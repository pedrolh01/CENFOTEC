//
//  newArticuloViewController.swift
//  tarea3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class newArticuloViewController: UITableViewController {
    @IBOutlet weak var NombreTxt: UITextField!
    
    @IBOutlet weak var CantidadTxt: UITextField!
    
    weak var delegate : newArticuloViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   func setNavigationButton(){
    let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func saveAction(sender:UIBarButtonItem){
        
        let arti = Articulo(nombre: "juan", cantidad: 1)
            delegate?.addNewArticulo(articulo: arti)
                
    }

}
