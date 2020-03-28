//
//  AddNameViewController.swift
//  Clase#2
//
//  Created by Cesar Brenes on 2/29/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit


protocol AddNameViewControllerDelegate: class {
    func addPerson(person: Person)
}

class AddNameViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    weak var delegate: AddNameViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNameAction(_ sender: Any) {
        let person = Person(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "")
        delegate?.addPerson(person: person)
        closeAction(self)
    }
    
    @IBAction func endEditingViewAction(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
