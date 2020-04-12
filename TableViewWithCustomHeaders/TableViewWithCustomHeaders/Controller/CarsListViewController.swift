//
//  CarsListViewController.swift
//  TableViewWithCustomHeaders
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class CarsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cars = [CarBrand]()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        fillCarsArray()
 
    }
    func fillCarsArray(){
        let toyotaModels = [CarModel(name: "Yaris", year: 2012, engine: .gasolina),CarModel(name: "Corolla", year: 2020, engine: .diesel) ]
        cars.append(CarBrand(name: "Toyota", country: "Japon", models: toyotaModels))
         let chevroletModels = [CarModel(name: "Camaro", year: 2012, engine: .gasolina),CarModel(name: "Colorado", year: 2020, engine: .diesel) ]
        cars.append(CarBrand(name: "Chevrolet", country: "USA", models: chevroletModels))
        let bmwModels = [CarModel(name: "x6", year: 2012, engine: .diesel) ]
        cars.append(CarBrand(name: "Bmw", country: "Alemania", models: bmwModels))
    }
    func registerCustomCells(){
       tableView.register(UINib(resource: R.nib.modelCarTableViewCell),forCellReuseIdentifier:R.nib.modelCarTableViewCell.name)
        tableView.register(UINib(resource: R.nib.carBrandHeaderView),forHeaderFooterViewReuseIdentifier:R.nib.carBrandHeaderView.name)
    }

}
extension CarsListViewController:UITableViewDelegate,UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars[section].models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.modelCarTableViewCell.name) as?  ModelCarTableViewCell else{
            return UITableViewCell()
        }
        cell.setupCell(model: cars[indexPath.section].models[indexPath.row])
        return cell
    }
    
    
    ///METODOS NECESARIOS PARA EL HEADER
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.carBrandHeaderView.name) as? CarBrandHeaderView else{
            return UIView()
        }
        cell.setupCell(cardBrand: cars[section])
        return cell
    }
    
}
