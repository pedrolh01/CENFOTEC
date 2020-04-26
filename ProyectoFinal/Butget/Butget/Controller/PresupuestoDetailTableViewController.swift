//
//  PresupuestoDetailTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/17/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class PresupuestoDetailTableViewController: UITableViewController {

   
    @IBOutlet weak var txtMontoTotal: UILabel!
    @IBOutlet weak var txtMonto: UILabel!
    var presupuesto:Presupuesto?
    weak var delegate : PresupuestoXFormTableViewControllerProtocol?
    let PresupuestoXFormTableViewController = "PresupuestoXFormTableViewController";
    
     let realmManager = RealmDetallePresupuestoManager()
    let realmManagerp = RealmPresupuestoManager()
    @IBAction func btnDinero(_ sender: UIButton) {
        getInstanceButton(tipo:1)
        
    }
    //https://github.com/malcommac/SwiftDate
    //falta lo de la seccion para saber cual eliminar del historial
    //falta lo de la hora que se vaya bajando con minutos y horas.
    //guardar fecha inicio para comparar con la fecha final.
    //hacer un counter
    //didBecomeActive registrarme cuando viene de back a el frente para calcular las fechas y actualizar fecha si ya paso la el tiempo
    
    @IBAction func btnGasto(_ sender: UIButton) {
        getInstanceButton(tipo:2)
    }
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard var total = presupuesto?.detallex.map({$0.monto}).reduce(0,+)else {
            return
        }
        txtMontoTotal.text = " \(total)"
    }
    //
    
     
    func getInstanceButton(tipo:Int){
        if let viewController = storyboard?.instantiateViewController(identifier: PresupuestoXFormTableViewController) as? PresupuestoXFormTableViewController{
            viewController.presupuesto = presupuesto
            viewController.tipo = tipo
            viewController.delegate = self
            
            navigationController?.pushViewController(viewController, animated: true)
            //viewController.xxx = xxx[indexPath.row]
            //navigationController?.pushViewController(viewController, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return presupuesto?.nombre
        } else {
            return "SIN NOMBRE"
        }
    }
 
}



extension PresupuestoDetailTableViewController:PresupuestoXFormTableViewControllerProtocol{
    func edit(presupuesto: Presupuesto) {
        realmManagerp.insert(presupuesto: presupuesto)
    }
    
    func add(detallePresupuesto: DetallePresupuesto,presupuesto:Presupuesto) {
        realmManager.addDetalleToPresupuesto(detallex: detallePresupuesto, presupuesto: presupuesto)
        print("adding pre to deta")
        let  si = realmManager.getAll()?.count;
        let total = realmManagerp.getTotal(presupuesto:presupuesto)
        navigationController?.popViewController(animated: true)
    }
    
    func hola2(caca: String) {
        navigationController?.popViewController(animated: true)
        print("sisiisiis")
    }
    
    
}
