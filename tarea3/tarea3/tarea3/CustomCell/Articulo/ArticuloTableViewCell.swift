//
//  ArticuloTableViewCell.swift
//  tarea3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class ArticuloTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var NombreTxt: UITextField!
    @IBOutlet weak var CantidadTxt: UITextField!

    func setupCell(articulo: Articulo) {
        NombreTxt.text = "nombre"
        CantidadTxt.text = "cantidad"
        //ArticuloImage.image = UIImage(named: "imagen")
    }
}
