//
//  sPresupuesto.swift
//  Butget
//
//  Created by Felix F on 4/26/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
struct sPresupuesto {
    var id = NSUUID().uuidString
    var nombre:String
    var periodicidad:Int
    var fechaInicio:Date
    var fechaFinal:Date
    var detallex:[sDetallePresupuesto]
}

