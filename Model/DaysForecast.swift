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
        get{
                if _minTemp == nil{
                _minTemp = 0.0
            }
            return _minTemp
        }
        set{ _minTemp = newValue }
    }
    var maxTemp: Double {
        get{
                if _maxTemp == nil{
                _maxTemp = 0.0
            }
            return _maxTemp
        }set{ _maxTemp = newValue }
    }
    
    var typeDegree: String{
        _typeDegree = globalValueTypeTemperature
        return _typeDegree
    }
    
    init(forecastDict: Dictionary<String,Any>) {
        
        if let dt = forecastDict["dt"] as? Double{
            let unixConverterDate = Date(timeIntervalSince1970: dt)
            self._dayOfTheWeak = unixConverterDate.Days()
        }
        
        if let main = forecastDict["main"] as? Dictionary<String,Any>{
            
            if let temp = main["temp_min"] as? Double{
                if globalValueTypeTemperature == "˚f"{
                    self._minTemp = setFarinhaitDegree(temp)
                }
                else{
                    self._minTemp = setCelsiumDegree(temp)
                }
            }
            
            if let temp = main["temp_max"] as? Double{
                if globalValueTypeTemperature == "˚f"{
                    self._maxTemp = setFarinhaitDegree(temp)
                    
                }
                else{
                    self._maxTemp = setCelsiumDegree(temp)
                }
            }
        }
        if let weather = forecastDict["weather"] as? [Dictionary<String,Any>]{
            if let main = weather[0]["main"] as? String{
                self._imageWeather =  main
                self._typeWeather = main
            }
        }

    }
    
    func detectMinTempPerDay(_ day: [DaysForecast])->Double{
        var arrayMinTemp = [Double]()
        
        for item in day{
            let valueMinTemp = item.minTemp
            arrayMinTemp.append(valueMinTemp)
        }
        return arrayMinTemp.min()!
    }
    
    func detectMaxTempPerDay(_ day: [DaysForecast])->Double{
        var arrayMaxTemp = [Double]()
        
        for item in day{
            let valueMaxTemp = item.maxTemp
            arrayMaxTemp.append(valueMaxTemp)
        }
        
        return arrayMaxTemp.max()!
    }
    
    
    
    
    
    
}
