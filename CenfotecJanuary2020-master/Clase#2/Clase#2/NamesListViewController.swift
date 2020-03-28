//
//  NamesListViewController.swift
//  Clase#2
//
//  Created by Cesar Brenes on 2/29/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import UIKit

class NamesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func addNameAction(_ sender: Any) {
        if let addNameViewController =  self.storyboard?.instantiateViewController(identifier: "AddNameViewController") as? AddNameViewController {
            addNameViewController.modalPresentationStyle = .fullScreen
            addNameViewController.delegate = self
            self.present(addNameViewController, animated: true, completion: nil)
        }
    }
    
}

extension NamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        let person = personList[indexPath.row]
        cell.textLabel?.text = "name: \(person.name), lastName: \(person.lastName)"
        return cell
    }
}

extension NamesListViewController: AddNameViewControllerDelegate {
    func addPerson(person: Person) {
        personList.append(person)
        tableView.reloadData()
    }
}
