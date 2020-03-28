//
//  TablaViewController.swift
//  tabla
//
//  Created by Felix F on 3/28/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

 
class TablaViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    var tablaNumeros = [Numero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        createNumeros()
        // Do any additional setup after loading the view.
    }
    
 func createNumeros(){
     
    for item in (1...100) {
        //print(item)
        let num1 = 8
        let num2 = item
        let res = item * 8
        tablaNumeros.append(Numero(numero1: num1, numero2: num2, resultado: res))
    }
 }
    
    func registerCustomCell(){
        let nib = UINib(nibName: "TablaTableViewCell", bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: "TablaTableViewCell")
    }

}
extension TablaViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablaNumeros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablaTableViewCell") as? TablaTableViewCell else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "no hay rows"
            return cell
        }
        cell.setupCell(numero: tablaNumeros[indexPath.row])
         
        
        return cell;
    }
    
    
}

 
