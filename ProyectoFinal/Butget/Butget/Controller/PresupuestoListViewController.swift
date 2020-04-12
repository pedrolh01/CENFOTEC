//
//  PresupuestoListViewController.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class PresupuestoListViewController: ViewController {
    @IBOutlet weak var TableView: UITableView!
    let PresupuestoTableViewCell = "PresupuestoTableViewCell"
    let PresupuestoFormTableViewController = "PresupuestoFormTableViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        registerCustomCell()
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let newPage = storyboard?.instantiateViewController(identifier:PresupuestoFormTableViewController)
            as? PresupuestoFormTableViewController{
            print("clic")
            //newPage.delegate = self
            navigationController?.pushViewController(newPage, animated: true)
        }
    }
    func registerCustomCell(){
        let nib = UINib(nibName: PresupuestoTableViewCell, bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: "PresupuestoTableViewCell")
    }
}
extension PresupuestoListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "no hay rows"
        return cell
    }
    
    
}
