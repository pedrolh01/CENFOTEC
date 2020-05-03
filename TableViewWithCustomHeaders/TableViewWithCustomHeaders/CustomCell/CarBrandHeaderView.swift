//
//  CarBrandHeaderView.swift
//  TableViewWithCustomHeaders
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class CarBrandHeaderView: UITableViewHeaderFooterView {
     
   
    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var countryLb: UILabel!
    func setupCell(cardBrand:CarBrand){
        nameLb.text = cardBrand.name
        countryLb.text = cardBrand.country
    }

}
