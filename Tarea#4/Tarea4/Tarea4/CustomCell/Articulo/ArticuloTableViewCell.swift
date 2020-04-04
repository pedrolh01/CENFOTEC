//
//  ArticuloTableViewCell.swift
//  Tarea4
//
//  Created by Felix F on 4/3/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class ArticuloTableViewCell: UITableViewCell {

    @IBOutlet weak var ImagenP: UIImageView!
    @IBOutlet weak var FechaLb: UILabel!
    @IBOutlet weak var NombreLb: UILabel!
    @IBOutlet weak var CantidadLb: UILabel!
    func setupCell(articulo: Articulo) {
     FechaLb.text = articulo.fecha.getFormatted(dateStyle: .short, timeStyle: .short)
     NombreLb.text = articulo.nombre
     CantidadLb.text = String(articulo.cantidad)
     ImagenP.image = UIImage(named: articulo.imagen)
    }
    
}
