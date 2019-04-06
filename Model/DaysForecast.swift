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

    private var _minTemperature: Double!
    private var _maxTemperature: Double!
    
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
    var minTemperature: Double{
        if _minTemperature == nil{
            _minTemperature = 0.0
        }
        return _minTemperature
    }
    var maxTemperature: Double{
        if _maxTemperature == nil{
            _maxTemperature = 0.0
        }
        return _maxTemperature
    }
    var typeDegree: String{
        _typeDegree = globalValueTypeTemperature
        return _typeDegree
    }
}
