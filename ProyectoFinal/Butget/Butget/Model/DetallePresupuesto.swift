//
//  DetallePresupuesto.swift
//  Butget
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import RealmSwift
class DetallePresupuesto:Object {
     
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var detalle = ""
    @objc dynamic var monto = 0.0
    @objc dynamic var tipo = 0
    
    let presupuestos = LinkingObjects(fromType: Presupuesto.self, property: "detallex")
    
    
    convenience init(detalle:String,monto:Double,tipo:Int){
        self.init()
        self.detalle = detalle
        self.monto  = monto
        self.tipo = tipo
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    func tosDetallePresupuesto() -> sDetallePresupuesto{
        return sDetallePresupuesto(detalle: detalle, monto: monto, tipo: tipo)
    }
    
}

