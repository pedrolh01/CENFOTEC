//
//  animalListViewController.swift
//  AsignacionAdicional
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import RealmSwift
protocol delegateAddAnimalViewController:class {
    func addNewAnimal(animal:Animal)
}
class animalListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let realmManager = RealmManager()
       
    var animales : Results<Animal>?
    let addAnimalViewController = "addAnimalViewController"
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationButton()
        registerCustomCell()
        loadAnimales()
        // Do any additional setup after loading the view.
    }
    
    func registerCustomCell(){
        let nib = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AnimalTableViewCell")
    }
    func loadAnimales(){
        let realmManager = RealmManager()
        let animales = realmManager.getAll()
        if let animales = realmManager.getAll(),animales.isEmpty{
             
        }else{
            self.animales = animales
            tableView.reloadData()
        }
        //print("animales \(animales?.count)")
    }
    func setNavigationButton(){
        let setNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction(sender:)))
        navigationItem.rightBarButtonItem = setNavigationButton
    }
    @objc func addAction(sender:UIBarButtonItem){
        if let newAnimalViewController = storyboard?.instantiateViewController(identifier:"addAnimalViewController")
            as? addAnimalViewController{
            print("clic")
            newAnimalViewController.delegate = self
            navigationController?.pushViewController(newAnimalViewController, animated: true)
        }
    }

}
extension animalListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return animales?.count ?? 0
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let animal = animales?[indexPath.row]{
                realmManager.remove(animal:animal)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell") as? AnimalTableViewCell else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "no hay rows"
            print("cell for")
            return cell
        }
        if let animal = animales?[indexPath.row]{
            cell.setupCell(animal: animal)
            print("seting up")
        }
        print("seting up nada")
        return cell;
    }
    
    
    
}
extension animalListViewController:delegateAddAnimalViewController{
    func addNewAnimal(animal: Animal) {
        realmManager.insert(animal: animal)
        
        animales = realmManager.getAll()
        print("guarda")
        //realmManager.hola(hola:"")
        //articulos.append(articulo)
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
 
}
