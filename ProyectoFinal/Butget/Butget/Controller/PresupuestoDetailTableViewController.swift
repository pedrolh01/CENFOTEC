//
//  PresupuestoDetailTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/17/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import SwiftDate
class PresupuestoDetailTableViewController: UITableViewController {

   
    @IBOutlet weak var lbTimer: UILabel!
    @IBOutlet weak var txtMontoTotal: UILabel!
    @IBOutlet weak var txtMonto: UILabel!
    var today:Date = Date()
    var presupuesto:Presupuesto?
    var timer = Timer()
    var segundos = 0
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
        cuentaHora()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard var total = presupuesto?.detallex.map({$0.monto}).reduce(0,+)else {
            return
        }
        txtMontoTotal.text = " \(total)"
          
    }
    func cuentaHora(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(cadaSegundo), userInfo: nil, repeats: true)
    }
    func getSecondsBetween(start: Date,end:Date) -> Int{
        let result = end.timeIntervalSince(start)
        return Int(result)
    }
    func formatTimer(seconds: Int) -> String{
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) / 60 % 60
        let seconds = Int(seconds) % 60
        if hours > 24 {
                let numberOfDays: Int = hours / 24
                return "Days: \(numberOfDays)"
        }
        return "H:\(hours),M:\(minutes),s:\(seconds)"
    }
    
     
    @objc func cadaSegundo(){
 
        guard let final = presupuesto?.fechaFinal else {return}
        guard let inicio = presupuesto?.fechaInicio else {return}
        var start = Date()
        var end = Date()
        var newFechaFinal = Date()
        if(final > Date()){
           end = final
        }else if(final <= Date()){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let date = dateFormatter.date(from: Date().toString())
            
            if(presupuesto?.periodicidad == 1){//1 semana
                newFechaFinal = date! + 1.weeks
                realmManagerp.editPeriocidad(presupuesto:presupuesto!,fechaInicio:Date(),fechaFinal:newFechaFinal)
            }else if(presupuesto?.periodicidad == 2){//2 semana
                newFechaFinal = date! + 2.weeks
                realmManagerp.editPeriocidad(presupuesto:presupuesto!,fechaInicio:Date(),fechaFinal:newFechaFinal)
            }
            else if(presupuesto?.periodicidad == 3){//4 semana
                newFechaFinal = date! + 4.weeks
                realmManagerp.editPeriocidad(presupuesto:presupuesto!,fechaInicio:Date(),fechaFinal:newFechaFinal)
            }
            end = newFechaFinal
        }
        let difference = getSecondsBetween(start:Date()  ,end:final )
        let formatString = formatTimer(seconds:difference)
        lbTimer.text = formatString
    }
    
     
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

extension TimeInterval{

    func stringFromTimeInterval() -> String {
        let time = NSInteger(self)

        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        //let formatter = DateFormatter()
        //formatter.dateFormat = "HH:mm:ss"
        return String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)

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
