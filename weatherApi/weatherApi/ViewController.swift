//
//  ViewController.swift
//  weatherApi
//
//  Created by Felix F on 5/2/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        
        
        getAllData()
    }
    var weatherList = [Parametros](){
        didSet{
            tableView.reloadData()
        }
    }
    func handleError(error:WeatherAPIError){
        var message = ""
        switch error {
        case .invalidURL, .serverError, .wrongAnswer:
            message = "Estamos experimentando problemas con el servidor, por favor intente más tarde"
        case .noInternetConnection:
            message = "Por favor revisar la conexión a internet"
        }
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    func registerCustomCells(){
           let nib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "WeatherTableViewCell")
           
        }
       func getAllData(){
           APIManager().getAllWeather { (error, weathers) in
            if let error = error {
                self.handleError(error: error)
            }else if let weathers = weathers{
                self.weatherList = weathers
                   //self.trabajeConData(weathers:weathers)
               }
           }
       }
    func trabajeConData(weathers:[Weather]){
        //print(meme.image)
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(weather: weatherList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

