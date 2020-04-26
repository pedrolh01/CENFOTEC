//
//  PresupuestoFormTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import SwiftDate
protocol PresupuestoFormTableViewControllerProtocol:class{
    func add(presupuesto:Presupuesto) 
    func addInicial(detallePresupuesto:DetallePresupuesto,presupuesto:Presupuesto)
    func pop()
    func hola(caca:String)
}
class PresupuestoFormTableViewController: UITableViewController {

    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtPeriocidad: UITextField!
    @IBOutlet weak var txtMontoInicial: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    var periocidadList = [
        Presupuesto.PeriocidadType.semanal.rawValue,
        Presupuesto.PeriocidadType.quincenal.rawValue,
        Presupuesto.PeriocidadType.mensual.rawValue
    ]
    let periocidadPickerView = UIPickerView()
    private var datePicker:UIDatePicker?
    let PresupuestoDetailTableViewController = "PresupuestoDetailTableViewController"
    
    
     weak var delegate : PresupuestoFormTableViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        initializePicker()
        dismissPickerView()
        //periocidadPickerView.delegate = self
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    func initializePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target:self,action:#selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        txtDate.inputView = datePicker
        
        
        periocidadPickerView.delegate = self
        txtPeriocidad.inputView = periocidadPickerView
    }
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        txtDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(false)
    }
    func dismissPickerView() {
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
            toolBar.sizeToFit()
            let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
            toolBar.setItems([flexButton,button], animated: true)
            toolBar.isUserInteractionEnabled = true
            txtPeriocidad.inputAccessoryView = toolBar
            //txtProvincia.inputAccessoryView = toolBar
        }
    @objc func action() {
        if txtPeriocidad.isEditing {
            txtPeriocidad.text = periocidadList[periocidadPickerView.selectedRow(inComponent: 0)]
        } else {
            txtPeriocidad.text = periocidadList[periocidadPickerView.selectedRow(inComponent: 0)]
        }
        view.endEditing(true)
    }
    @objc func addAction(sender:UIBarButtonItem){
//        if let newPage = storyboard?.instantiateViewController(identifier:PresupuestoDetailTableViewController)
//            as? PresupuestoDetailTableViewController{
//
//        }
        print("addaction")
        let h = "camion"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: txtDate.text!)
        guard let detalle = txtNombre.text,let fecha = date,let periocidad = txtPeriocidad.text, let monto = Double(txtMontoInicial.text!) else {
               return
        }
        
        if let a = Presupuesto.PeriocidadType(rawValue: periocidad){
            var numPeriocidad:Int = 0
            var fechaFinal:Date
            switch a {
            case .semanal:
                numPeriocidad = 1
                fechaFinal = fecha + 1.weeks
            case .quincenal:
                numPeriocidad = 2
                fechaFinal = fecha + 2.weeks
            case .mensual:
                numPeriocidad = 3
                fechaFinal = fecha + 4.weeks
            }
            let pre = Presupuesto(nombre:detalle, periocidad: numPeriocidad, fechaInicio: fecha,fechaFinal: fechaFinal )
            
            let deta = DetallePresupuesto(detalle: "Monto Inicial", monto: monto, tipo: 0)
            pre.detallex.append(deta)
            
            delegate?.add(presupuesto:pre)
            delegate?.hola(caca: h)
            delegate?.pop()
            print("delegaaaaa")
        }
        
    }
    
     
    
}
extension PresupuestoFormTableViewController : UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == periocidadPickerView {
            return periocidadList.count
        }
        return periocidadList.count
     
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
   if pickerView == periocidadPickerView {
        return periocidadList[row]
    }
    return periocidadList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView == periocidadPickerView {
        txtPeriocidad.text = periocidadList[row]
    } else {
        txtPeriocidad.text = periocidadList[row]
    }
    }
    
}
