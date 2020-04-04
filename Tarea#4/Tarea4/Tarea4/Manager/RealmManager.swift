//
//  RealmManager.swift
//  Tarea4
//
//  Created by Felix F on 4/3/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import RealmSwift
class RealmManager {
    func hola(hola:String)  {
         
        
    }
    func insert(articulo:Articulo){
        let articulo = articulo
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(articulo,update:.all)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    func remove(articulo:Articulo){
        do{
            let realm = try Realm()
            try realm.write{
                realm.delete(articulo)
            }
        }catch{
            print("Realm error por alguna razon")
        }
    }
    //obtiene todas las categorias de forma syncrona
    func getAll()->Results<Articulo>?{
        let realm = try? Realm()
        return realm?.objects(Articulo.self).sorted(byKeyPath:"fecha",ascending: false)
    }
}
