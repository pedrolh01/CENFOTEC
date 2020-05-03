//
//  PresupuestoXFormTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
protocol PresupuestoXFormTableViewControllerProtocol:class{
    func add(detallePresupuesto:DetallePresupuesto,presupuesto:Presupuesto)
    func hola2(caca:String)
    func edit(presupuesto:Presupuesto)
}
class PresupuestoXFormTableViewController: UITableViewController {
     
    var presupuesto:Presupuesto?
    var tipo:Int?
    var NombreTipo:String?
    
    @IBOutlet weak var txtDetalle: UITextField!
    @IBOutlet weak var txtMonto: UITextField!
    weak var delegate : PresupuestoXFormTableViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        headTipoName()
        print("estamos por aca")
         
    }
    
     //
    func headTipoName(){
        if tipo == 2{//gasto
            NombreTipo = "Gasto"
        }else{//
            NombreTipo = "Dinero"
        }
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        print("agregando monto a presupuesto")
        guard let detalle = txtDetalle.text, let monto = Double(txtMonto.text!) else {
               return
        }
        let montoTipo:Double
        if tipo == 2{//gasto
            montoTipo = -monto
        }else{//
            montoTipo = monto
        }
        let deta = DetallePresupuesto(detalle: detalle, monto: montoTipo, tipo: tipo!)
        delegate?.add(detallePresupuesto: deta, presupuesto: presupuesto!) 
         
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         
            return NombreTipo
         
    }
 
}
