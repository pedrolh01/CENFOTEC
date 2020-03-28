//
//  Articulo.swift
//  tarea3
//
//  Created by Felix F on 3/27/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation

class Articulo {
    
    var nombre:String
    var cantidad:Int
    var fecha = Date()
    var imagen = "imagen"
    
    init(nombre:String,cantidad:Int){
        self.nombre = nombre
        self.cantidad = cantidad 
    }
    
}
