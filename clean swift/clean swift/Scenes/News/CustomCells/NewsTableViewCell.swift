//
//  TableViewCell.swift
//  clean swift
//
//  Created by Felix F on 5/2/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var categoryImage: UIImageView!
    func setupCell(category: Categories.DataSource.ViewModel.DisplayedCategory){
        lbTitle.text = category.title
        categoryImage.image = category.image
    }
    
}
