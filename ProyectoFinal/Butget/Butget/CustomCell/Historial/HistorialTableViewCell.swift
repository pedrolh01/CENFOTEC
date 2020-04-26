//
//  HistorialTableViewCell.swift
//  Butget
//
//  Created by Felix F on 4/26/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class HistorialTableViewCell: UITableViewCell {

    @IBOutlet weak var lbMonto: UILabel!
    @IBOutlet weak var lbNombre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var total:Double?
    func setupCell(detallePresupuesto:DetallePresupuesto){
        total = detallePresupuesto.monto
        lbMonto.text = " \(total)"
        lbNombre.text = detallePresupuesto.detalle
    }

    
}
