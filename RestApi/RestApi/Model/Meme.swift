//
//  Meme.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
struct MemeKyes {
    static let id = "ID"
    static let bottomText = "bottomText"
    static let image = "image"
    static let name = "name"
    static let rank = "rank"
    static let tags = "tags"
    static let topText = "topText"
}
struct Meme {
    var id:Int
    var bottomText:String
    var image:String
    var name:String
    var rank:String
    var tags:[String]
    var topText:String
}
extension Meme{
    init(dictionary:[String:Any]){
        id = dictionary[MemeKyes.id] as? Int ?? -1
        bottomText = dictionary[MemeKyes.bottomText] as? String ?? ""
        image = dictionary[MemeKyes.image] as? String ?? ""
        name = dictionary[MemeKyes.name] as? String ?? ""
        rank = dictionary[MemeKyes.rank] as? String ?? ""
        topText = dictionary[MemeKyes.topText] as? String ?? ""
        tags = (dictionary[MemeKyes.tags] as? String ?? "").components(separatedBy: ",")
    }
}
