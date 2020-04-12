//
//  Presupuesto.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import RealmSwift
class Presupuesto:Object {
    enum periodicidadType{
        case semanal
        case quincenal
        case mensual
    }
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
    let periodicidad = List<Periodo>()
    @objc dynamic var fechaInicio = Date()
    let monto = List<Monto>()
    @objc dynamic var rollover = true
    
    
    
    
    
    convenience init(nombre:String,fechaInicio:Date,rollover:Bool){//periodicidad:List<Periodo>,monto:Int,
        self.init()
        self.nombre = nombre
        //self.periodicidad = periodicidad
        self.fechaInicio = fechaInicio
        //self.monto = monto
        self.rollover = rollover
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}
