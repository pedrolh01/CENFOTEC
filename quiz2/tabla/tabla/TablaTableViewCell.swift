//
//  TablaTableViewCell.swift
//  tabla
//
//  Created by Felix F on 3/28/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class TablaTableViewCell: UITableViewCell {

    @IBOutlet weak var ResultaTxt: UILabel!
    

   func setupCell(numero: Numero) {
    ResultaTxt.text = "\(String(numero.numero1)) * \((String(numero.numero2)) ) = \((String(numero.resultado)) )"
    
    }
    
}
