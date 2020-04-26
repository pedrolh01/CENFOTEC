//
//  RealmNews.swift
//  clean swift
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
import RealmSwift
class RealmNews :Object{
    @objc dynamic var date = Date()
    @objc dynamic var title = ""
    @objc dynamic var descriptionNews = ""
    
    let categories = LinkingObjects(fromType: RealmCategory.self, property: "news")
    convenience init(news:News){
        self.init()
        date =  news.date
        title = news.title
        descriptionNews = news.descriptionNews
    }
    func toNews() -> News{
        return News(date: date, title: title, descriptionNews: descriptionNews)
    }
}

