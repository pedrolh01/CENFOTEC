//
//  HistorialViewController.swift
//  Butget
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift
class HistorialViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    var presupuestos : Results<Presupuesto>?//[sPresupuesto]?
    var realmManager = RealmPresupuestoManager()
    var realmManagerd = RealmDetallePresupuestoManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        tableView.reloadData();
    }
    
    func registerCustomCells(){
        let nib = UINib(nibName: "HistorialTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HistorialTableViewCell")
        
        let nib2 = UINib(nibName: "HistorialHeader", bundle: nil)
        tableView.register(nib2, forHeaderFooterViewReuseIdentifier: "HistorialHeader")
         
    }
    func loadData(){
        presupuestos = realmManager.getAll()
        if let presus = realmManager.getAll(),presupuestos!.isEmpty{
             print("no hay")
        }else{
            tableView.reloadData()
        }
    }
    func alertaEliminar(detallePresupuesto:DetallePresupuesto,indexPath:IndexPath){
        let alert = UIAlertController(title: "Seguro de eliminar esta transaccion?", message: "Se perdera la informacion.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.realmManagerd.removeDetallePresupuesto(detallex: detallePresupuesto)
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle no logic here")
        }))

        self.present(alert, animated: true)
        
        
    }

}
extension HistorialViewController:UITableViewDelegate,UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presupuestos?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presupuestos?[section].detallex.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistorialTableViewCell") as?  HistorialTableViewCell else{
            return UITableViewCell()
        }
        cell.setupCell(detallePresupuesto: presupuestos![indexPath.section].detallex[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistorialHeader") as? HistorialHeader else{
            return UIView()
        }
        cell.setupCell(presupuesto: presupuestos![section])
        cell.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
         
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print(indexPath.section)
            print(indexPath.row)
            let resst:DetallePresupuesto?
            guard let ress = self.presupuestos?[indexPath.section].detallex[indexPath.row]else {
                return
            }
            resst = ress
            self.alertaEliminar(detallePresupuesto:resst!,indexPath:indexPath)
            
                })
                deleteAction.image = UIImage(named: "tick")
        deleteAction.backgroundColor = .red
                
                return UISwipeActionsConfiguration(actions: [deleteAction])
    }
     
    
}
