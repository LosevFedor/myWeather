//
//  Settings.swift
//  myWeather
//
//  Created by admin on 20/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Settings {
    
    private var _сelsius: Double!
    private var _fahrenheit: Double!
    
    private var _specifiedTemperature: String!
    
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
    
    private func setFarinhaitDegree ( _ currenKelvinTemp:Double) -> Double{
        let getTemperature = (currenKelvinTemp * (9/5) - 459.67)
         _fahrenheit = Double(round(10 * getTemperature/10))
        return fahrenheit
    }
    
    private func setCelsiumDegree( _ currenKelvinTemp:Double) -> Double{
        let getTemperature = (currenKelvinTemp - 273.15)
        _сelsius = Double(round(10 * getTemperature/10))
        return сelsius
    }
    
    // MARK: Property get temperature from CoreData.
    var specifiedTemperature: String {
        get{
             _specifiedTemperature = temperatureData()
            return _specifiedTemperature
        }
    }

    // MARK: Return converted temperature.
    func convertDegrees(currenKelvinTemp:Double) -> Double{
        
        var typeOfDegrees = 0.0
        
        switch (specifiedTemperature) {
        case "celsius":
            typeOfDegrees = setCelsiumDegree(currenKelvinTemp)
        case "farinhate":
            typeOfDegrees = setFarinhaitDegree (currenKelvinTemp)
        default:
            print("error")
        }
        
        return typeOfDegrees
    }
    
    
    // MARK: Get type of temperature from CoreData.
    private func temperatureData() -> String{
        
        
    }
    
    
}
