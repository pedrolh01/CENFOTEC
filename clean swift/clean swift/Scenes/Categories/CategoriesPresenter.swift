//
//  CategoriesPresenter.swift
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

protocol CategoriesPresentationLogic
{
  func presentDataSource (response: Categories.DataSource.Response)
}

class CategoriesPresenter: CategoriesPresentationLogic
{
  weak var viewController: CategoriesDisplayLogic?
  
  
  
  func presentDataSource(response: Categories.DataSource.Response)
  {
    let categories = response.categories.map({Categories.DataSource.ViewModel.DisplayedCategory(title: $0.name, image: UIImage(named: $0.imageName))})
    viewController?.displayDataSource(viewModel:Categories.DataSource.ViewModel(displayedCategory: categories))
  }
}
