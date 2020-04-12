//
//  ModelCarTableViewCell.swift
//  TableViewWithCustomHeaders
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class ModelCarTableViewCell: UITableViewCell {

    @IBOutlet weak var engineLb: UILabel!
    @IBOutlet weak var yearLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setupCell(model:CarModel){
        nameLb.text = "Modelo: \(model.name)"
        yearLb.text = "ani de fabricacion: \(model.year)"
        
        switch model.engine {
        case .diesel:
            engineLb.text = "Diesel";
        case .gasolina:
            engineLb.text = "Gasolina";
        case .electric:
            engineLb.text = "Electrico";
            
        }
    }
    
}
