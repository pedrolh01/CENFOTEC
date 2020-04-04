//
//  ArticuloListViewController.swift
//  Tarea4
//
//  Created by Felix F on 4/3/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift
protocol NewArticuloTableViewControllerProtocol:class {
    func addNewArticulo(articulo:Articulo)
}
class ArticuloListViewController: UIViewController {
    let articuloTableViewCell = "ArticuloTableViewCell"
    let newArticuloTableViewController = "NewArticuloTableViewController"
    @IBOutlet weak var ArticuloTable: UITableView!
    
    let realmManager = RealmManager()
    
    var articulos : Results<Articulo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        registerCustomCell()
        loadArticulos()
        // Do any additional setup after loading the view.
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let newArticuloTableViewController = storyboard?.instantiateViewController(identifier:"NewArticuloTableViewController")
            as? NewArticuloTableViewController{
            print("clic")
            newArticuloTableViewController.delegate = self
            navigationController?.pushViewController(newArticuloTableViewController, animated: true)
        }
    }
    
    func registerCustomCell(){
        let nib = UINib(nibName: articuloTableViewCell, bundle: nil)
        ArticuloTable.register(nib, forCellReuseIdentifier: "ArticuloTableViewCell")
    }
    func loadArticulos(){
        let realmManager = RealmManager()
        let articulos = realmManager.getAll()
        if let articulos = realmManager.getAll(),articulos.isEmpty{
             
        }else{
            self.articulos = articulos
            ArticuloTable.reloadData()
        }
    }

}
extension ArticuloListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articulos?.count ?? 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let articulo = articulos?[indexPath.row]{
                realmManager.remove(articulo:articulo)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
            
            
            //tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ArticuloTable.dequeueReusableCell(withIdentifier: articuloTableViewCell) as? ArticuloTableViewCell else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "no hay rows"
            return cell
        }
        if let articulo = articulos?[indexPath.row]{
            cell.setupCell(articulo: articulo)
        }
         
          // cell.setupCell(articulo: articulos[indexPath.row])
         
        
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
extension ArticuloListViewController:NewArticuloTableViewControllerProtocol{
    func addNewArticulo(articulo: Articulo) {
        realmManager.insert(articulo: articulo)
        
        articulos = realmManager.getAll()
        print("guarda")
        //realmManager.hola(hola:"")
        //articulos.append(articulo)
        navigationController?.popViewController(animated: true)
        ArticuloTable.reloadData()
    }
 
}
