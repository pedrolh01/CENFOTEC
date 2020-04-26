//
//  APIManager.swift
//  RestApi
//
//  Created by Felix F on 4/18/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import Alamofire
class APIManager {

    static let rootURL = "http://alpha-meme-maker.herokuapp.com"
    func getAllMemes(completionHandler:@escaping (_ error:MemeAPIError?, _ memes: [Meme]?) -> Void){
        
        guard let isNetWorkReachable = NetworkReachabilityManager()?.isReachable else{
            completionHandler(.noInternetConnection,nil)
            return
        }
        if isNetWorkReachable{
            makeRequestToGetAllMemesToTheAPI(completionHandler:completionHandler)
        }else{
            completionHandler(.noInternetConnection,nil)
        }
    }
    
    
   private func makeRequestToGetAllMemesToTheAPI(completionHandler: @escaping(_ error:MemeAPIError?,_ memes: [Meme]?) -> Void){
        guard let request = AlamofireHelper.createRequest(parameters:nil,requestPath:APIManager.rootURL,httpMethod:.get)else{
            return completionHandler(.invalidURL,nil)
        }
        AF.request(request).validate().responseJSON{(response) in
            switch  response.result{
            case .success:
                //print("\(response.value as? [String:Any] ?? [:])")
                guard let jsonAnswer = response.value as? [String:Any], let memeData = jsonAnswer["data"] as? [[String:Any]] else{
                    completionHandler(.wrongAnswer,nil)
                    return
                }
                var memesList = [Meme]()
                for meme in memeData{
                    memesList.append(Meme(dictionary:meme))
                }
                completionHandler(nil,memesList)
            case .failure:
                completionHandler(.serverError,nil)

            }

        }
    }
}
enum MemeAPIError{
    case noInternetConnection
    case invalidURL
    case wrongAnswer
    case serverError
}
