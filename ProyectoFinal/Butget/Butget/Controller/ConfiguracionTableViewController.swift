//
//  ConfiguracionTableViewController.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class ConfiguracionTableViewController: UITableViewController {

    @IBOutlet weak var lbVersion: UILabel!
    @IBOutlet var tblView: UITableView!
    @IBAction func btnBorrar(_ sender: UIButton) {
        truncar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getVersion()
        
    }
    func getVersion(){ 
        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            lbVersion.text = "version \(appVersion)"
        }else{
            lbVersion.text = "error"
        }
        
    }
    func truncar(){
        let alert = UIAlertController(title: "Seguro de eliminar los datos?", message: "Se perdera toda la informacion.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle yes logic here")
            //self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
            let realmManager = RealmPresupuestoManager()
            realmManager.truncate()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle no logic here")
        }))

        self.present(alert, animated: true)
        
        
    }
    
}
