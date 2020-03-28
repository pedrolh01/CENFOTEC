//
//  NewArticuloViewController.swift
//  Tarea#3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class NewArticuloViewController: UITableViewController {

    @IBOutlet weak var CantidadTxt: UITextField!
    @IBOutlet weak var NombreTxt: UITextField!
    weak var delegate : NewArticuloViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
 
    }
    func integer(from textField: UITextField) -> Int {
        guard let text = textField.text, let number = Int(text) else {
            return 0
        }
        return number
    }
    func setNavigationButton(){
       let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction(sender:)))
           navigationItem.rightBarButtonItem = setNavigationButton
       }
       @objc func saveAction(sender:UIBarButtonItem){
        if let nombre = NombreTxt.text, let cantidad = Int(CantidadTxt.text!)  {
            let arti = Articulo(nombre: nombre, cantidad: cantidad)
            delegate?.addNewArticulo(articulo: arti)
        }else{
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos y cantidad debe ser un numero", preferredStyle: .alert)
            let action  = UIAlertAction(title:"OK",style:.default,handler:nil)
            alertController.addAction(action)
            present(alertController,animated: true,completion: nil)
        }
        
                   
       }
}
