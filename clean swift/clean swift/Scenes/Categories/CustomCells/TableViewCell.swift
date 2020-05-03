//
//  TableViewCell.swift
//  clean swift
//
//  Created by Felix F on 5/2/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    func setupCell(category: Categories.DataSource.ViewModel.DisplayedCategory){
        lbTitle.text = category.title
        categoryImage.image = category.image
    } 
}
