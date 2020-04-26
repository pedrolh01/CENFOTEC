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
        tableView.register(nib2, forCellReuseIdentifier: "HistorialHeader")
         
    }
    func loadData(){
        presupuestos = realmManager.getAll()
        if let presus = realmManager.getAll(),presupuestos!.isEmpty{
             print("no hay")
        }else{
            tableView.reloadData()
        }
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
        return 50.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistorialHeader") as? HistorialHeader else{
            return UIView()
        }
        cell.setupCell(presupuesto: presupuestos![section])
        return cell
    }
    
}
