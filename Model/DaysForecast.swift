//
//  DaysForecast.swift
//  myWeather
//
//  Created by admin on 06/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class DaysForecast {
    
    private var _dayOfTheWeak: String!
    private var _imageWeather: String!
    private var _typeWeather: String!
    private var _typeDegree: String!

    private var _minTemp: Double!
    private var _maxTemp: Double!
    
    var dayOfTheWeak: String{
        if _dayOfTheWeak == nil{
            _dayOfTheWeak = ""
        }
        return _dayOfTheWeak
    }
    var imageWeather: String{
        if _imageWeather == nil{
            _imageWeather = ""
        }
        return _imageWeather
    }
    var typeWeather: String{
        if _typeWeather == nil{
            _typeWeather = ""
        }
        return _typeWeather
    }
    var minTemp: Double{
        if _minTemp == nil{
            _minTemp = 0.0
        }
        return _minTemp
    }
    var maxTemp: Double {
        if _maxTemp == nil{
            _maxTemp = 0.0
        }
        return _maxTemp
    }
    
    var typeDegree: String{
        _typeDegree = globalValueTypeTemperature
        return _typeDegree
    }
    
    init(forecastDict: Dictionary<String,Any>) {
        
        if let dt = forecastDict["dt"] as? Double{
            let unixConverterDate = Date(timeIntervalSince1970: dt)
            self._dayOfTheWeak = unixConverterDate.Days()
//            print("DayTimePeriod: \(self._dayOfTheWeak!)")
        }
        
        if let main = forecastDict["main"] as? Dictionary<String,Any>{
            if let temp = main["temp_min"] as? Double{
                if globalValueTypeTemperature == "˚f"{
                    self._minTemp = setFarinhaitDegree(temp)
//                    print("_minTemperature: \(self._currentTemp!)")
                }
                else{
                    self._minTemp = setCelsiumDegree(temp)
//                    print("_minTemperature: \(self._currentTemp!)")
                }
            }
            if let temp = main["temp_max"] as? Double{
                if globalValueTypeTemperature == "˚f"{
                    self._maxTemp = setFarinhaitDegree(temp)
                    //print("_maxTemperature: \(self._currentTemp!)")
                    
                }
                else{
                    self._maxTemp = setCelsiumDegree(temp)
                    //print("_maxTemperature: \(self._currentTemp!)")
                }
            }
        }
        if let weather = forecastDict["weather"] as? [Dictionary<String,Any>]{
            if let main = weather[0]["main"] as? String{
                self._imageWeather =  main
                self._typeWeather = main
                //print("_imageWeather: \(self._imageWeather!)")
                //print("_typeWeather: \(self._typeWeather!)")
            }
        }

    }
}
