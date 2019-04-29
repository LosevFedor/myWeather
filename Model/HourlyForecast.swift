//
//  HourlyForecast.swift
//  myWeather
//
//  Created by admin on 03/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class HourlyForecast{
    
    private var _hourlyTimePeriod: String!
    private var _hourlyImageForecast: String!
    private var _hourlyTypeWeather: String!
    private var _hourlyForecastTemp: Double!
    private var _hourlyForecastDegrees: String!
    private var _currentSityName: String!
    
    var hourlyTimePeriod: String{
        if _hourlyTimePeriod == nil{
            _hourlyTimePeriod = ""
        }
        return _hourlyTimePeriod
    }
    
    var hourlyImageForecast: String{
        if _hourlyImageForecast == nil{
            _hourlyImageForecast = ""
        }
        return _hourlyImageForecast
    }
    
    var hourlyTypeWeather: String{
        if _hourlyTypeWeather == nil{
            _hourlyTypeWeather = ""
        }
        return _hourlyTypeWeather
    }
    
    var hourlyForecastTemp: Double{
        if _hourlyForecastTemp == nil{
            _hourlyForecastTemp = 0.0
        }
        return _hourlyForecastTemp
    }
    
    var hourlyForecastDegree: String{
        _hourlyForecastDegrees = globalValueTypeTemperature
        return _hourlyForecastDegrees
    }
    
    var currentSityName: String{
        if _currentSityName == nil{
            _currentSityName = ""
        }
        return _currentSityName
    }
    
    init(forecastDict: Dictionary<String,Any>) {
        if let dt = forecastDict["dt"] as? Double{
            let unixConverterDate = Date(timeIntervalSince1970: dt)
            self._hourlyTimePeriod = unixConverterDate.Hourly()
        }
        if let main = forecastDict["main"] as? Dictionary<String,Any>{
            if let temp = main["temp"] as? Double{
                if globalValueTypeTemperature == "˚f"{
                    self._hourlyForecastTemp = setFarinhaitDegree(temp)
                }
                else{
                    self._hourlyForecastTemp = setCelsiumDegree(temp)
                }
                
            }
        }
        if let weather = forecastDict["weather"] as? [Dictionary<String,Any>]{
            if let main = weather[0]["main"] as? String{
                _hourlyImageForecast = main
                _hourlyTypeWeather = main
                
            }
        }
    }
    
}

