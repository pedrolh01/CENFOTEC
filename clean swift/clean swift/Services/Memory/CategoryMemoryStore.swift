//
//  CategoryMemoryStore.swift
//  clean swift
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
class CategoryMemoryStore: CategoryStoreProtocol {
    func insert(category: Category, completinHandler: () -> Void) {
        completinHandler()
    }
    
    func fetchAll(completionHandler: ([Category]) -> Void) {
        let categories = [
            Category(name: "test1", imageName: "test1", news: [News]()),
            Category(name: "test2", imageName: "test2", news: [News]()),
            Category(name: "test3", imageName: "test3", news: [News]()),
            Category(name: "test4", imageName: "test4", news: [News]()),
            Category(name: "test5", imageName: "test5", news: [News]())
        ]
        completionHandler(categories)
        
    }
    
    
}
