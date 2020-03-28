//
//  articuloListViewController.swift
//  tarea3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
protocol newArticuloViewControllerProtocol:class {
    func addNewArticulo(articulo:Articulo)
}
class articuloListViewController: UIViewController {

    @IBOutlet weak var ArticuloTable: UITableView!
    
    let articuloTableViewCell = "ArticuloTableViewCell"
    let newArticuloViewController = "newArticuloViewController"
    var articulos = [Articulo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        //registerCustomCell()
        createArticulos()

         
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        //if let newArticuloViewController = //storyboard?.instantiateViewController(identifier:"newArticuloViewController")
            //as? newArticuloViewController{
            print("clic")
            //newArticuloViewController.delegate = self
            //navigationController?.pushViewController(newArticuloViewController, animated: true)
        //}
    }
    func registerCustomCell(){
        //let nib = UINib(nibName: articuloTableViewCell, bundle: nil)
        //ArticuloTable.register(nib, forCellReuseIdentifier: //articuloTableViewCell)
    }
    func createArticulos(){
        articulos.append(Articulo(nombre: "el nombre", cantidad: 3))
       articulos.append(Articulo(nombre: "el nombre", cantidad: 3))
        articulos.append(Articulo(nombre: "el nombre", cantidad: 3))
        articulos.append(Articulo(nombre: "el nombre", cantidad: 3))
        articulos.append(Articulo(nombre: "el nombre", cantidad: 3))
    }
     

}
extension articuloListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articulos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ArticuloTable.dequeueReusableCell(withIdentifier: articuloTableViewCell) as? ArticuloTableViewCell else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "no hay rows"
            return cell
        }
        cell.setupCell(articulo: articulos[indexPath.row])
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
extension articuloListViewController:newArticuloViewControllerProtocol{
    func addNewArticulo(articulo: Articulo) {
         print("listo")
        navigationController?.popViewController(animated: true)
        ArticuloTable.reloadData()
    }
    
    
}
