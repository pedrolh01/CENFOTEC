//
//  Category.swift
//  clean swift
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
struct Category {
    var identifier = NSUUID().uuidString
    var name:String
    var imageName:String
    var news:[News]
}
