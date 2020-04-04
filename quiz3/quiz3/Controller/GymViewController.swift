//
//  GymViewController.swift
//  quiz3
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift

class GymViewController: UIViewController {
     let tableViewCell = "TableViewCell"
    var gym:Gym?
     
let realmManager = RealmManager()
    var gyms : Results<Gym>?
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        setData()
        loadData()
    }
    func registerCustomCell(){
        let nib = UINib(nibName: tableViewCell, bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    func loadData(){
        let realmManager = RealmManager()
        let gyms = realmManager.getAll()
        if let gyms = realmManager.getAll(),gyms.isEmpty{
             print("no hay")
        }else{
            print("carga")
            self.gyms = gyms
            TableView.reloadData()
        }
    }
 func setData(){
     let realmManager = RealmManager()
     let gyms = realmManager.getAll()
     if let gyms = realmManager.getAll(),gyms.isEmpty{
         
         realmManager.insert(nombre: "gym 1", quantity: 1, tagNumber: 11)
         realmManager.insert(nombre: "gym 2", quantity: 2, tagNumber: 22)
         realmManager.insert(nombre: "gym 3", quantity: 3, tagNumber: 33)
         realmManager.insert(nombre: "gym 4", quantity: 4, tagNumber: 44)
        realmManager.insert(nombre: "gym 5", quantity: 5, tagNumber: 55)
        realmManager.insert(nombre: "gym 6", quantity: 6, tagNumber: 66)
        realmManager.insert(nombre: "gym 7", quantity: 7, tagNumber: 77)
        realmManager.insert(nombre: "gym 8", quantity: 8, tagNumber: 88)
        realmManager.insert(nombre: "gym 9", quantity: 9, tagNumber: 99)
        realmManager.insert(nombre: "gym 10", quantity:10, tagNumber: 1010)
         print("se insertaron")
         setData()
     }else{
         self.gyms = gyms
        print("ya insertados")
         TableView.reloadData()
     }
 }
}
extension GymViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms?.count ?? 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = TableView.dequeueReusableCell(withIdentifier: tableViewCell) as? TableViewCell else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "no hay rows"
            return cell
        }
        if let gym = gyms?[indexPath.row]{
            cell.setupCell(gym: gym)
        }
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
