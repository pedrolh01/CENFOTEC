//
//  addAnimalViewController.swift
//  AsignacionAdicional
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class addAnimalViewController: UITableViewController {
    weak var delegate : delegateAddAnimalViewController?
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtTelefono: UITextField!
    
    @IBOutlet weak var txtProvincia: UITextField!
    @IBOutlet weak var textField: UITextField!
    var selectedAnimal: String?
    var animalList = ["Perro", "Gato"]
    var provinciaList = ["San Jose", "Alajuela", "Cartago", "Heredia", "Guanacaste", "Puntarenas", "Limon"]
    let animalPickerView = UIPickerView()
    let provinciaPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTextFields()
        dismissPickerView()
        setNavigationButton()
        // Do any additional setup after loading the view.
    }
    func initializeTextFields() {
           animalPickerView.delegate = self
           provinciaPickerView.delegate = self
           textField.inputView = animalPickerView
           txtProvincia.inputView = provinciaPickerView
       }
      func dismissPickerView() {
             //Es importante inicializar el tamaño del toolbar para evitar warnings de constraints en la terminal
             let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
             toolBar.sizeToFit()
             //El flexbutton es un espaciador que me va a permitir tener el boton done a la derecha y no a la izquierda, si lo deseara a la izquierda solo deberia eliminar este espaciador
             let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
             let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
             toolBar.setItems([flexButton,button], animated: true)
             toolBar.isUserInteractionEnabled = true
     //      le asigno el toolbar a ambos textfields
             textField.inputAccessoryView = toolBar
             txtProvincia.inputAccessoryView = toolBar
         }
    @objc func action() {
           if textField.isEditing {
               textField.text = animalList[animalPickerView.selectedRow(inComponent: 0)]
           } else {
               txtProvincia.text = provinciaList[provinciaPickerView.selectedRow(inComponent: 0)]
           }
           view.endEditing(true)
       }
    
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let nombre = txtNombre.text ,let provincia = txtProvincia.text, let telefono = txtTelefono.text,let animal = textField.text {//,
             let ani = Animal(nombre:nombre,telefono:telefono,animal:animal,provincia:provincia)
            delegate?.addNewAnimal(animal: ani) 
        }else{
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos y cantidad debe ser un numero", preferredStyle: .alert)
            let action  = UIAlertAction(title:"OK",style:.default,handler:nil)
            alertController.addAction(action)
            present(alertController,animated: true,completion: nil)
        }
    }
    
}
extension addAnimalViewController : UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == animalPickerView {
            return animalList.count
        }
        return provinciaList.count
     
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
   if pickerView == animalPickerView {
        return animalList[row]
    }
    return provinciaList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView == animalPickerView {
        textField.text = animalList[row]
    } else {
        txtProvincia.text = provinciaList[row]
    }
    }
    
}
