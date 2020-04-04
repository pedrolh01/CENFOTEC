//
//  Gym.swift
//  quiz3
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//
import Foundation
import RealmSwift
class Gym:Object {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var purchaseDate = Date()
    @objc dynamic var quantity = 0
    @objc dynamic var tagNumber = 0
    
    
    
    
    convenience init(nombre:String,quantity:Int,tagNumber:Int){
        self.init()
        self.name = nombre
        self.quantity = quantity
        self.tagNumber = tagNumber
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}

