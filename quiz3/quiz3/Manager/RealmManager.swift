//
//  RealmManager.swift
//  quiz3
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class RealmManager {
    func hola(hola:String)  {
         
        
    }
    func insert(nombre:String,quantity:Int,tagNumber:Int){
        let gym = Gym(nombre: nombre, quantity: quantity, tagNumber: tagNumber)
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(gym,update:.all)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
     
    //obtiene todas las categorias de forma syncrona
    func getAll()->Results<Gym>?{
        let realm = try? Realm()
        return realm?.objects(Gym.self)
    }
}
