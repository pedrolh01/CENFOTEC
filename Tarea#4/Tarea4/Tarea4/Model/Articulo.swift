//
//  Articulo.swift
//  Tarea4
//
//  Created by Felix F on 4/3/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import RealmSwift
class Articulo:Object {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
    @objc dynamic var cantidad = 0
    @objc dynamic var fecha = Date()
    @objc dynamic var imagen = ""
    
    
    
    
    convenience init(nombre:String,cantidad:Int,imagen:String){
        self.init()
        self.nombre = nombre
        self.cantidad = cantidad
        self.imagen = imagen
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}

