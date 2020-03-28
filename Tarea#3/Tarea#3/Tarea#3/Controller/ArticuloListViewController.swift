//
//  ArticuloListViewController.swift
//  Tarea#3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

protocol NewArticuloViewControllerProtocol:class {
    func addNewArticulo(articulo:Articulo)
}

class ArticuloListViewController: UIViewController {

    let articuloTableViewCell = "ArticuloTableViewCell"
    let newArticuloViewController = "NewArticuloViewController"
    var articulos = [Articulo]()
    var articulosAx = [Articulo]()
    @IBOutlet weak var ArticuloTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        registerCustomCell()
        createArticulos()
        articulosAl()
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let newArticuloViewController = storyboard?.instantiateViewController(identifier:"NewArticuloViewController")
            as? NewArticuloViewController{
            print("clic")
            newArticuloViewController.delegate = self
            navigationController?.pushViewController(newArticuloViewController, animated: true)
        }
    }
    
    func registerCustomCell(){
        let nib = UINib(nibName: articuloTableViewCell, bundle: nil)
        ArticuloTable.register(nib, forCellReuseIdentifier: "ArticuloTableViewCell")
    }
    func createArticulos(){
        articulos.append(Articulo(nombre: "juan", cantidad: 3))
        articulos.append(Articulo(nombre: "carlos", cantidad: 4))
        articulos.append(Articulo(nombre: "luis", cantidad: 5))
        articulos.append(Articulo(nombre: "pedro", cantidad: 6))
        articulos.append(Articulo(nombre: "maria", cantidad: 7))
    }
    func articulosAl(){
        articulosAx.removeAll()
        for index in (articulos).reversed() {
            articulosAx.append(index)
            print("\(index.nombre)..")
        }
         articulos.removeAll()
         articulos = articulosAx
    }
}
extension ArticuloListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articulos.count
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            articulos.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            //tableView.reloadData()
        }
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
extension ArticuloListViewController:NewArticuloViewControllerProtocol{
    func addNewArticulo(articulo: Articulo) {
        articulos.append(articulo)
        articulosAl()
        navigationController?.popViewController(animated: true)
        ArticuloTable.reloadData()
    }
    
    
}

