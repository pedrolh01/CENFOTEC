//
//  RealmManager.swift
//  AsignacionAdicional
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class RealmManager {
    func insertssss(palabra:String){}
    func insert(animal:Animal){
        let animal = animal
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(animal,update:.all)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func remove(animal:Animal){
        do{
            let realm = try Realm()
            try realm.write{
                realm.delete(animal)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    //obtiene todas  
    func getAll()->Results<Animal>?{
        let realm = try? Realm()
        return realm?.objects(Animal.self)
    }
}

