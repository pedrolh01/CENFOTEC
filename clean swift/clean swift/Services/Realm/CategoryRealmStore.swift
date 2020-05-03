//
//  CategoryRealmStore.swift
//  clean swift
//
//  Created by Felix F on 4/25/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//
import Foundation
import RealmSwift

class CategoryRealmStore: CategoryStoreProtocol{
    func insert(category: Category, completinHandler: () -> Void) {
    
       let category = RealmCategory(category: category)
       do{
           let realm = try Realm()
           try realm.write{
               realm.add(category,update: .all)
           }
       }catch{
           print("Realm error por alguna razon")
       }
    
    }
    
    func fetchAll(completionHandler: ([Category]) -> Void) {
    let realm = try? Realm()
        var categories = [Category]()
        guard let realmCategories = realm?.objects(RealmCategory.self)else {//.map({$0.toCategory()})else{
            completionHandler([Category]())
            return
        }
        for realmCategory in realmCategories{
            categories.append(realmCategory.toCategory())
        }
        completionHandler(categories)
    }
    func fetch(id:String,completionHandler:(_ category:Category?) -> Void){
        let realm = try? Realm()
        let predicate = NSPredicate(format: "identifier = %@",id)
        let result = realm?.objects(RealmCategory.self).filter(predicate)
        completionHandler(result?.first?.toCategory())
    }

    
    
}
