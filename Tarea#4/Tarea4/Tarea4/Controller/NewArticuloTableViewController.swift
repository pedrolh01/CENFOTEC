//
//  NewArticuloTableViewController.swift
//  Tarea4
//
//  Created by Felix F on 4/3/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class NewArticuloTableViewController: UITableViewController {
    
    weak var delegate : NewArticuloTableViewControllerProtocol?

    @IBOutlet weak var NombreTxt: UITextField!
    @IBOutlet weak var CantidadTxt: UITextField!
    
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
       func eligeImagen()->String{
         let number = Int.random(in: 0 ... 4)
         let images = ["p1", "p2", "p3", "p4", "p5"]
         return images[number]
     }
  @objc func saveAction(sender:UIBarButtonItem){
    if let nombre = NombreTxt.text, let cantidad = Int(CantidadTxt.text!)  {
        let arti = Articulo(nombre: nombre, cantidad: cantidad,imagen:eligeImagen())
       delegate?.addNewArticulo(articulo: arti)
   }else{
       let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos y cantidad debe ser un numero", preferredStyle: .alert)
       let action  = UIAlertAction(title:"OK",style:.default,handler:nil)
       alertController.addAction(action)
       present(alertController,animated: true,completion: nil)
   }
   
              
  }

}
