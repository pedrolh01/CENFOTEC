//
//  MemeTableViewCell.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: UITableViewCell {
 
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
     
    func setupCell(weather:Parametros){
        let s =  stringFromAny(weather.value) //as? String ?? "--"
        bottomTitleLabel.text =  weather.key
        topTitleLabel.text = s//"value"//
        
    }
    func stringFromAny(_ value:Any?) -> String {
        if let nonNil = value, !(nonNil is NSNull) {
            return String(describing: nonNil)
        }
        return ""
    }
    
}
