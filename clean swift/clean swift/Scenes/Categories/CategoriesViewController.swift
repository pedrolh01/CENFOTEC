//
//  CategoriesViewController.swift
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

protocol CategoriesDisplayLogic: class
{
    func displayDataSource(viewModel: Categories.DataSource.ViewModel)
}

class CategoriesViewController: UIViewController, CategoriesDisplayLogic
{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [Categories.DataSource.ViewModel.DisplayedCategory]()
  var interactor: CategoriesBusinessLogic?
  var router: (NSObjectProtocol & CategoriesRoutingLogic & CategoriesDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = CategoriesInteractor()
    let presenter = CategoriesPresenter()
    let router = CategoriesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    registerCustomCell()
    requestDataSource()
     
  }
    func registerCustomCell() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    func requestDataSource(){
        let request = Categories.DataSource.Request()
        interactor?.requestDataSourse(request: request)
    }
    func displayDataSource(viewModel: Categories.DataSource.ViewModel) {
        dataSource = viewModel.displayedCategory
        tableView.reloadData()
    }
  
   
}
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")  as? TableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
         
        cell.setupCell(category: dataSource[indexPath.row]) 
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
     
}

