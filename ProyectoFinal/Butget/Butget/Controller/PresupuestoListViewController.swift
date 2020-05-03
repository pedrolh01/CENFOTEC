//
//  PresupuestoListViewController.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftDate

class PresupuestoListViewController: UIViewController {
     
    
    @IBOutlet weak var TableView: UITableView!
    let PresupuestoTableViewCell = "PresupuestoTableViewCell"
    let PresupuestoFormTableViewController = "PresupuestoFormTableViewController"
    let PresupuestoDetailTableViewController = "PresupuestoDetailTableViewController"
    var presupuestos : Results<Presupuesto>?
 
    let realmManager = RealmPresupuestoManager()
    let realmManagerd = RealmDetallePresupuestoManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        setNavigationButton()
        registerCustomCell()
        createPresupuestos()
        TableView.reloadData();
        
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        TableView.reloadData();
    }
   // override func viewWillAppear(_ animated: Bool) {//PARA QUE APARESCA CUANDO VOY Y VENGO
        
    //}
    
    func createPresupuestos() {
        
        let presupuestos = realmManager.getAll()
        
        if let presupuestos = presupuestos,presupuestos.isEmpty{
            realmManager.insert(presupuesto:Presupuesto(nombre: "presupuesto 1", periocidad:1, fechaInicio: Date(),fechaFinal: Date() + 1.weeks ))
            realmManager.insert(presupuesto:Presupuesto(nombre: "presupuesto 2", periocidad:2 , fechaInicio: Date(),fechaFinal: Date() + 1.weeks  ))
            realmManager.insert(presupuesto:Presupuesto(nombre: "presupuesto 3", periocidad:3 , fechaInicio: Date(),fechaFinal: Date() + 1.weeks ))
            print("se insertaron")
            createPresupuestos()
        }else{
            print("ya insertaron")
            self.presupuestos = presupuestos
            TableView.reloadData()
        }
    }
    
    
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let newPage = storyboard?.instantiateViewController(identifier:PresupuestoFormTableViewController)
            as? PresupuestoFormTableViewController{
            print("clic")
             newPage.delegate = self
            //newPage.delegate = self
            navigationController?.pushViewController(newPage, animated: true)
        }
    }
    func registerCustomCell(){
        let nib = UINib(nibName: PresupuestoTableViewCell, bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: "PresupuestoTableViewCell")
    }
    func editarlo(presupuesto:Presupuesto){
        if let newPage = storyboard?.instantiateViewController(identifier:"PresupuestoEditableTableViewController")
            as? PresupuestoEditableTableViewController{
             newPage.delegate = self
            newPage.presupuesto = presupuesto
            navigationController?.pushViewController(newPage, animated: true)
        }
    }
    func alertaEliminar(presupuesto:Presupuesto,indexPath:IndexPath){
        let alert = UIAlertController(title: "Seguro de eliminar este presupuesto?", message: "Se perdera la informacion.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.realmManager.remove(presupuesto:presupuesto)
            self.TableView.beginUpdates()
            self.TableView.deleteRows(at: [indexPath], with: .fade)
            self.TableView.endUpdates()
            self.TableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle no logic here")
        }))

        self.present(alert, animated: true)
        
        
    }
    
     
}
extension PresupuestoListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presupuestos?.count ?? 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                    print("OK, marked as Closed")
                    success(true)
            if let presupuesto = self.presupuestos?[indexPath.row]{
                
                self.alertaEliminar(presupuesto:presupuesto,indexPath:indexPath)
                
            }
                })
                deleteAction.image = UIImage(named: "tick")
        deleteAction.backgroundColor = .red
                
                return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Update action ...")
                success(true)
            if let presupuesto = self.presupuestos?[indexPath.row]{
                self.editarlo(presupuesto:presupuesto)
            }
            })
            modifyAction.image = UIImage(named: "hammer")
        modifyAction.backgroundColor = .black
            
            return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            if let presupuesto = self.presupuestos?[indexPath.row]{
                           self.editarlo(presupuesto:presupuesto)
                       }
        }
        editAction.backgroundColor = .blue

        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            if let presupuesto = self.presupuestos?[indexPath.row]{
                self.realmManager.remove(presupuesto:presupuesto)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
           
        }
        deleteAction.backgroundColor = .red

        return [editAction,deleteAction]
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let presupuesto = presupuestos?[indexPath.row]{
                realmManager.remove(presupuesto:presupuesto)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        }
        if editingStyle == .insert{
            if let presupuesto = presupuestos?[indexPath.row]{
                realmManager.remove(presupuesto:presupuesto)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PresupuestoTableViewCell)  as? PresupuestoTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        if let presupuesto = presupuestos?[indexPath.row]{
            
            cell.setupCell(presupuesto:presupuesto)
            if presupuesto.detallex.map({$0.monto}).reduce(0,+) == 0 || presupuesto.detallex.map({$0.monto}).reduce(0,+) < 0{
                cell.backgroundColor = UIColor( red: CGFloat(255/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0) )
                    
                    
            }else{
                cell.backgroundColor = UIColor( red: CGFloat(153/255.0), green: CGFloat(204/255.0), blue: CGFloat(255/255.0), alpha: CGFloat(1.0) )
                 
            }
            
        }
        //cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: PresupuestoDetailTableViewController) as? PresupuestoDetailTableViewController, let presupuesto = presupuestos?[indexPath.row] {
            viewController.presupuesto = presupuesto
           
            navigationController?.pushViewController(viewController, animated: true)
            //viewController.category = categories[indexPath.row]
            //navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
 
extension PresupuestoListViewController:PresupuestoFormTableViewControllerProtocol,PresupuestoEditableTableViewControllerProtocol{
     
    func edit(presupuesto: Presupuesto) {
         
    }
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func addInicial(detallePresupuesto: DetallePresupuesto, presupuesto: Presupuesto) {
        realmManagerd.addDetalleToPresupuesto(detallex: detallePresupuesto, presupuesto: presupuesto) 
        print("inserta")
        TableView.reloadData();
    }
    
    func hola(caca: String) {
        realmManager.hola(caca: caca)
        print("en el protocol")
    }
    
    func add(presupuesto: Presupuesto) {
        realmManager.insert(presupuesto: presupuesto)
        print("inserta")
        TableView.reloadData();
    }
     
    
     
}
