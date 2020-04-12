//
//  Animal.swift
//  AsignacionAdicional
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//
import Foundation
import RealmSwift
class Animal:Object {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
    @objc dynamic var telefono = ""
    @objc dynamic var animal = ""
    @objc dynamic var provincia = "" 
     
    convenience init(nombre:String,telefono:String,animal:String,provincia:String ){
        self.init()
        self.nombre = nombre
        self.telefono = telefono
        self.animal = animal
        self.provincia = provincia
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}


