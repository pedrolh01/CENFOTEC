//
//  CarModl.swift
//  TableViewWithCustomHeaders
//
//  Created by Felix F on 4/4/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
struct CarModel {
    enum EngineType{
        case gasolina
        case diesel
        case electric
    }
    var name:String
    var year:Int
    var engine:EngineType
}
