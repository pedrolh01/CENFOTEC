//
//  Periodo.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class Periodo:Object {
    enum periodicidadType{
        case semanal
        case quincenal
        case mensual
    }
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
     
    let presupuesto = LinkingObjects(fromType: Presupuesto.self, property: "periodicidad")
    convenience init(nombre:String){
        self.init()
        self.nombre = nombre
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}

