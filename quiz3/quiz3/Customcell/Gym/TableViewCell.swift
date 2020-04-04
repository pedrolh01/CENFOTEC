//
//  TableViewCell.swift
//  quiz3
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var quantityLb: UILabel!
    @IBOutlet weak var tagNumberLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    
    func setupCell(gym: Gym) {
        quantityLb.text = String(gym.quantity)
        tagNumberLb.text = String(gym.tagNumber)
        nameLb.text = gym.name
    }
    
}
