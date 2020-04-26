//
//  sDetallePresupuesto.swift
//  Butget
//
//  Created by Felix F on 4/26/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
struct sDetallePresupuesto {
    var id = NSUUID().uuidString
    var detalle:String
    var monto:Double
    var tipo:Int
}
