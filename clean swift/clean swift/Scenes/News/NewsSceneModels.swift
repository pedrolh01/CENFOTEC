//
//  NewsSceneModels.swift
//  clean swift
//
//  Created by Felix F on 5/2/20.
//  Copyright (c) 2020 Pedro Ledezma. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum NewsScene
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var news:[News]
    }
    struct ViewModel
    {
        struct DisplayedNew {
            var title:String
            var image:UIImage?
        }
        var DisplayedNew:[DisplayedNew]
    }
  }
}