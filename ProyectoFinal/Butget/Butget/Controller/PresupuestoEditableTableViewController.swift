//
//  PresupuestoEditableTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/26/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift
protocol PresupuestoEditableTableViewControllerProtocol:class{ 
    func edit(presupuesto:Presupuesto)
}
class PresupuestoEditableTableViewController: UITableViewController {

    @IBOutlet weak var txtNombre: UITextField!
    var presupuesto :  Presupuesto?
    weak var delegate : PresupuestoEditableTableViewControllerProtocol?
    
     let realmManagerp = RealmPresupuestoManager()
    @IBAction func txtNombre(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNombre.text = presupuesto?.nombre
        setNavigationButton()
    }
     func setNavigationButton(){
         let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction(sender:)))
         navigationItem.rightBarButtonItem = setNavigationButton
     }
     @objc func editAction(sender:UIBarButtonItem){
         guard let _pre = presupuesto,let nombre = txtNombre.text else {
             return
         }
         self.presupuesto = realmManagerp.editNombre(presupuesto:presupuesto!,nombre:nombre)
         delegate?.edit(presupuesto: presupuesto!)
         navigationController?.popViewController(animated: true)
     }
}
