//
//  ViewController.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ViewController: UIViewController,NVActivityIndicatorViewable {
 
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimating()
        getAllMemes()
    }
    var memesList = [Meme](){
        didSet{
            tableView.reloadData()
        }
    }
    func handleError(error:MemeAPIError){
        var message = ""
        switch error {
        case .invalidURL,.serverError,.wrongAnswer:
            message = "estamos experimentando problemas con el servidor, por favor intente mas tarde"
        case .noInternetConnection:
            message = "resivar conexion"
        }
        let alertcontroller = UIAlertController(title: "error", message: "mensaje", preferredStyle:.alert)
    }
    
    func registerCustomCells(){
        let nib = UINib(nibName: "MemeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MemeTableViewCell")
        
     }
    func getAllMemes(){
        APIManager().getAllMemes { (error, memes) in
            self.stopAnimating()
            if let memes = memes{
                self.trabajeConMemes(memes:memes)
            }
        }
    }
    func trabajeConMemes(memes:[Meme]){
        //print(meme.image)
    }
    

}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


