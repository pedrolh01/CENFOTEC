//
//  RealmDetallePresupuestoManager.swift
//  Butget
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class RealmPresupuestoManager {
    func hola(caca:String) {
        print("vez que si")
    }
    func truncate() {
        do{
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func insert(presupuesto:Presupuesto) {
        
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(presupuesto,update: .all)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func editNombre(presupuesto:Presupuesto,nombre:String) -> Presupuesto{
        do{
            let realm = try Realm()
            try realm.write{
                presupuesto.nombre = nombre
            }
        }catch{
            print("Realm error por alguna razon")
        }
        return presupuesto
    }
    func editPeriocidad(presupuesto:Presupuesto,fechaInicio:Date,fechaFinal:Date) -> Presupuesto{
        do{
            let realm = try Realm()
            try realm.write{
                presupuesto.fechaInicio = fechaInicio
                presupuesto.fechaFinal = fechaFinal
            }
        }catch{
            print("Realm error por alguna razon")
        }
        return presupuesto
    }
    func remove(presupuesto:Presupuesto){
        do{
            let realm = try Realm()
            try realm.write{
                realm.delete(presupuesto)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func getTotal(presupuesto:Presupuesto)->Double{
         
        var total = presupuesto.detallex.map({$0.monto}).reduce(0,+)
         
         
         
        return total
    }
             
    //obtiene todas las categorias de forma syncrona
    func getAll()->Results<Presupuesto>?{
        let realm = try? Realm()
        return realm?.objects(Presupuesto.self)
    }
    
    func getAll(completionHandler:(_ presupuestos:Results<Presupuesto>?) -> Void){
        completionHandler(getAll())
    }
    
}
