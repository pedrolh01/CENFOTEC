//
//  PresupuestoTableViewCell.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class PresupuestoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbMonto: UILabel!
    
    @IBOutlet weak var lbNombre: UILabel!
    func setupCell(presupuesto: Presupuesto) {
        var total = presupuesto.detallex.map({$0.monto}).reduce(0,+)
        lbNombre.text = presupuesto.nombre
        lbMonto.text = String(total)
    }
    
}
