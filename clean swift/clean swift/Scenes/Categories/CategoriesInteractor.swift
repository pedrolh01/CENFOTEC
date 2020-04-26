//
//  CategoriesInteractor.swift
//  clean swift
//
//  Created by Felix F on 4/25/20.
//  Copyright (c) 2020 Pedro Ledezma. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CategoriesBusinessLogic
{
    func requestDataSourse(request: Categories.DataSource.Request)
    
}

protocol CategoriesDataStore
{
  //var name: String { get set }
}

class CategoriesInteractor: CategoriesBusinessLogic, CategoriesDataStore
{
    func requestDataSourse(request: Categories.DataSource.Request) {
        storeWorker.fetchAll{
            (categories) in
            self.categories = categories
            presenter?.presentDataSource(response:Categories.DataSource.Response)
        }
    }
    
  var presenter: CategoriesPresentationLogic?
    var storeWorker: CategoryWorker(store: CategoryRealmStore())
    var categories = [Category]()
    
    
   
}