//
//  HistorialHeader.swift
//  Butget
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class HistorialHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var lbMonto: UILabel!
    @IBOutlet weak var lbNombre: UILabel!
    var total:Double?
    func setupCell(presupuesto:Presupuesto){
        total = presupuesto.detallex.map({$0.monto}).reduce(0,+)
        lbMonto.text = "monto"//" \(total)"
        lbNombre.text = "nombre"//presupuesto.nombre
    }

}
