//
//  Alamofire.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import Alamofire
class AlamofireHelper {
    static let timeOut = 30.0
    class func createRequest(parameters:Parameters?,requestPath:String,httpMethod:HTTPMethod) -> URLRequest? {
        
        guard let requestUrl = URL(string: requestPath)else{
            return nil
        }
        var request = URLRequest(url:requestUrl)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = timeOut
        if let parameters = parameters{
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        return request
    }
}
