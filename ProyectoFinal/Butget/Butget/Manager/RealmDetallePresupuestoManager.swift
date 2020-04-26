//
//  RealmDetallePresupuestoManager.swift
//  Butget
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class RealmDetallePresupuestoManager {
    func insert(detallePresupuesto:DetallePresupuesto) {
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(detallePresupuesto,update: .all)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func addDetalleToPresupuesto(detallex:DetallePresupuesto,presupuesto:Presupuesto){
        print("agregando aqui en master") 
        //ALGO PASA ACA QUE ME GUARDA EN TODOS LOS DETALLES, NO EN UN SOLO PRESUPUESTO.
        do{
            let realm = try Realm()
            try realm.write{
                presupuesto.detallex.append(detallex)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func removeDetallePresupuesto(detallex:DetallePresupuesto){
        do{
            let realm = try Realm()
            try realm.write{
                realm.delete(detallex)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    
    //obtiene todas las categorias de forma syncrona
    func getAll()->Results<DetallePresupuesto>?{
        let realm = try? Realm()
        return realm?.objects(DetallePresupuesto.self)
    }
    func getAll(completionHandler:(_ detallex:Results<DetallePresupuesto>?) -> Void){
        completionHandler(getAll())
    }
    
}

