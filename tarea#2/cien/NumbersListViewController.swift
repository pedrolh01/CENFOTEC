//
//  NumbersListViewController.swift
//  cien
//
//  Created by Felix F on 3/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class NumbersListViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    var numberList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        cargaNumbers()
         
    }
    func cargaNumbers() -> (){
        for n in 1...100 {
            numberList.append(n)
        }
    }
}

extension NumbersListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")else {
            return UITableViewCell()
        }
        let number = numberList[indexPath.row]
        if number % 2 == 0 {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "number: \(number) PAR"
        } else {
            cell.backgroundColor = UIColor.blue
            cell.textLabel?.text = "number: \(number) IMPAR"
        }
        
        return cell
    }
    
    
    
}
