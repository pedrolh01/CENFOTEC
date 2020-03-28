//
//  Articulo.swift
//  Tarea#3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation

class Articulo {
    
    var nombre:String
    var cantidad:Int
    var fecha = Date()
    var imagen:String
    let number = Int.random(in: 0 ... 4)
    let images = ["p1", "p2", "p3", "p4", "p5"]
    init(nombre:String,cantidad:Int){
        self.nombre = nombre
        self.cantidad = cantidad
        self.imagen = images[number]
    }
    
}
