//
//  HistorialHeader.swift
//  Butget
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class HistorialHeader: UITableViewHeaderFooterView {
   
    var total:Double = 0
    
    @IBOutlet weak var lbMonto: UILabel!
    @IBOutlet weak var lbNombre: UILabel!
    func setupCell(presupuesto:Presupuesto){
        
       total = presupuesto.detallex.map({$0.monto}).reduce(0,+)
        lbMonto.text = " \(total)"
        lbNombre.text = presupuesto.nombre
    }

}
