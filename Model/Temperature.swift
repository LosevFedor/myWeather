//
//  Settings.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Temperature{
    private var _сelsius: Double!
    private var _fahrenheit: Double!
    
    var сelsius:Double{
        get{
            if _сelsius == nil{
                _сelsius = 0.0
            }
            return _сelsius
        }
    }
    var fahrenheit:Double{
        get{
            if _fahrenheit == nil{
                _fahrenheit = 0.0
            }
            return _fahrenheit
        }
    }
}
func convertDegrees(){
    
}
func setFarinhaitDegree (currenKelvinTemp:Double) -> Double{
    let getTemperature = (currenKelvinTemp * (9/5) - 459.67)
    let convertedKelvinToFarinhate = Double(round(10 * getTemperature/10))
    return convertedKelvinToFarinhate
}

func setCelsiumDegree(currenCelsiusTemp:Double) -> Double{
    let getTemperature = (currenCelsiusTemp - 273.15)
    let convertedCelsiusToFarinhate = Double(round(10 * getTemperature/10))
    return convertedCelsiusToFarinhate
}

