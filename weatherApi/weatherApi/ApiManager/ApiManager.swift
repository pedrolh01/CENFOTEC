//
//  APIManager.swift
//  RestApi
//

//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import Foundation
import Alamofire
class APIManager {

    static let rootURL = "https://api.openweathermap.org/data/2.5/onecall?lat=9.83228027673567&lon=-83.91017021487139&appid=308a78b4a0e54e1b8a8dbcb781f4179b"
    
    func getAllWeather(completionHandler:@escaping (_ error:WeatherAPIError?, _ memes: [Parametros]?) -> Void){
        
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
    
    
   private func makeRequestToGetAllMemesToTheAPI(completionHandler: @escaping(_ error:WeatherAPIError?,_ weathers: [Parametros]?) -> Void){
    var keys = [String]()
    keys.append("visibility")
    
        guard let request = AlamofireHelper.createRequest(parameters:nil,requestPath:APIManager.rootURL,httpMethod:.get)else{
            return completionHandler(.invalidURL,nil)
        }
        AF.request(request).validate().responseJSON{(response) in
            switch  response.result{
            case .success:
                //print("\(response.value as? [String:Any] ?? [:])")
                guard let jsonAnswer = response.value as? [String:Any], let weatherData = jsonAnswer["current"] as? [String:Any] else{
                    completionHandler(.wrongAnswer,nil)
                    return
                }
                 
                 var weatherList = [Parametros]()
                
                for weather in weatherData{
                    if let o = weather.value as? [AnyObject] {
                          
                    }else{
                         weatherList.append(Parametros(value: weather.value , key: weather.key ))

                    }
                    //print(weather) 
                    //weatherList.append(Weather(dt: "", sunrise: "", sunset: "", temp: "", feels_like: "", pressure: "", humidity: "", dew_point: "", uvi: "", clouds: "", visibility: "", wind_speed: "", wind_deg: ""))
                }
                completionHandler(nil,weatherList) 
            case .failure:
                completionHandler(.serverError,nil)

            }

        }
    }
}
enum WeatherAPIError{
    case noInternetConnection
    case invalidURL
    case wrongAnswer
    case serverError
}
