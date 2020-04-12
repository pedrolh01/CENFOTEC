//
//  Monto.swift
//  Butget
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import RealmSwift
class Monto:Object {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var nombre = ""
    @objc dynamic var type = 0
     
    let monto = LinkingObjects(fromType: Monto.self, property: "monto")
    convenience init(nombre:String,type:Int){
        self.init()
        self.nombre = nombre
        self.type = type
    }
    
    override static func primaryKey() -> String?{
        return "id"}
    override static func indexedProperties() -> [String]{
        return  ["id"]
    }
    
}
