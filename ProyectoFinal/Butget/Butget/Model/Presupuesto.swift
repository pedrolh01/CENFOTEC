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
    public enum PeriocidadType:String{
        case quincenal = "Quincenal"
        case semanal = "Semanal"
        case mensual = "Mensual"
    }
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
    @objc dynamic var periodicidad = 0
    @objc dynamic var fechaInicio = Date()
    @objc dynamic var fechaFinal = Date()
    let detallex = List<DetallePresupuesto>()
    
    //let color = UIColor()
    convenience init(nombre:String,periocidad:Int,fechaInicio:Date,fechaFinal:Date ){//periodicidad:List<Periodo>,monto:Int,
        self.init()
        self.nombre = nombre
        self.periodicidad = periodicidad//periodicidadType.mensual.rawValue
        self.fechaInicio = fechaInicio
        self.fechaFinal = fechaFinal
    }
    convenience init(nombre:String ){//periodicidad:List<Periodo>,monto:Int,
        self.init()
        self.nombre = nombre 
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    func tosPresupuesto() -> sPresupuesto{
        return sPresupuesto(nombre: nombre, periodicidad: periodicidad, fechaInicio: fechaInicio, fechaFinal: fechaFinal, detallex: detallex.map({$0.tosDetallePresupuesto()}))
    }
    
}
 
