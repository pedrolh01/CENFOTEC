//
//  Weather.swift
//  weatherApi
//
//  Created by Felix F on 5/2/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//


import Foundation
struct WeatherKyes {
    static let dt = "dt"
    static let sunrise = "sunrise"
    static let sunset = "sunset"
    static let temp = "temp"
    static let feels_like = "feels_like"
    static let pressure = "pressure"
    static let humidity = "humidity"
     static let dew_point = "dew_point"
     static let uvi = "uvi"
     static let clouds = "clouds"
     static let visibility = "visibility"
     static let wind_speed = "wind_speed"
     static let wind_deg = "wind_deg"
}
struct Weather {
    var dt :String
    var sunrise :String
    var sunset :String
    var temp :String
    var feels_like :String
    var pressure :String
    var humidity:String
     var dew_point :String
     var uvi :String
     var clouds :String
     var visibility :String
     var wind_speed :String
     var wind_deg :String
   
}

extension Weather{
    init(dictionary:[String:Any]){
         dt = dictionary[WeatherKyes.dt] as? String ?? ""
         sunrise = dictionary[WeatherKyes.dt] as? String ?? ""
         sunset = dictionary[WeatherKyes.dt] as? String ?? ""
         temp = dictionary[WeatherKyes.dt] as? String ?? ""
         feels_like = dictionary[WeatherKyes.dt] as? String ?? ""
         pressure = dictionary[WeatherKyes.dt] as? String ?? ""
         humidity = dictionary[WeatherKyes.dt] as? String ?? ""
          dew_point = dictionary[WeatherKyes.dt] as? String ?? ""
          uvi = dictionary[WeatherKyes.dt] as? String ?? ""
          clouds = dictionary[WeatherKyes.dt] as? String ?? ""
          visibility = dictionary[WeatherKyes.dt] as? String ?? ""
          wind_speed = dictionary[WeatherKyes.dt] as? String ?? ""
          wind_deg = dictionary[WeatherKyes.dt] as? String ?? "" 
    }
}

