//
//  CurrentWeather.swift
//  myWeather
//
//  Created by admin on 11.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    
    // MARK: Private weather parameters.
    
    private var _sityName: String!
    private var _imageWeather: String!
    private var _weatherType:String!
    private var _date:String!

    private var _currentTemperature:Double!
    private var _minWeatherTemperature:Double!
    private var _maxWeatherTemperature:Double!
    
    private var _pressure: Int!
    private var _humidity: Int!
    private var _speed: Double!

    private let settings = Settings()
    
    var sityName:String{
        if _sityName == nil{
             _sityName = ""
        }
        return _sityName
    }
    
    var imageWeather:String{
        if _imageWeather == nil{
            _imageWeather = ""
        }
        return _imageWeather
    }
    
    // geted it
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    // geted it
    var date: String{
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        let currentDate = dateFormatter.string(from: Date())
        _date = "\(currentDate)"
        
        return _date
    }
    
    // geted it
    var currentTemperature:Double{
        if _currentTemperature == nil{
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    // geted it
    var minWeatherTemperature: Double{
        if _minWeatherTemperature == nil{
            _minWeatherTemperature = 0.0
        }
        return _minWeatherTemperature
    }
    
    // geted it
    var maxWeatherTemperature: Double{
        if _maxWeatherTemperature == nil{
            _maxWeatherTemperature = 0.0
        }
        return _maxWeatherTemperature
    }
    
    var speed: Double{
        if _speed == nil{
            _speed = 0.0
        }
        return _speed
    }
    
    var pressure:Int{
        if _pressure == nil{
            _pressure = 0
        }
        return _pressure
    }
    
    var humidity:Int{
        if _humidity == nil{
            _humidity = 0
        }
        return _humidity
    }
    
    
    // MARK: use Alamofire
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { (responce) in
            let result = responce.result
            
            if let dict = result.value as? Dictionary<String, Any>{
                
                // MARK: Get sity name.
                if let name = dict["name"] as? String{
                    self._sityName = name.capitalized
                    //print(self._sityName)
                }
                
                // MARK: Get weather tupes.
                if let weather = dict["weather"] as? [Dictionary<String,Any>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        self._imageWeather = main.capitalized
                    }
                }
                
                // MARK: Get weather properties.
                if let main = dict["main"] as? Dictionary<String, Any>{
                    if let currenTemp = main["temp"] as? Double {
                        
                        if globalValueTypeTemperature == "fahrenheit"{
                            self._currentTemperature = setFarinhaitDegree(currenTemp)
                        }
                        else{
                            self._currentTemperature = setCelsiumDegree(currenTemp)
                        }
                    }
                    
                    if let minTemp = main["temp_min"] as? Double{
                        if globalValueTypeTemperature == "fahrenheit"{
                            self._minWeatherTemperature = setFarinhaitDegree(minTemp)
                        }else{
                            self._minWeatherTemperature = setCelsiumDegree(minTemp)
                        }

                    }
                    
                    if let maxTemp = main["temp_max"] as? Double{
                        if globalValueTypeTemperature == "fahrenheit"{
                            self._maxWeatherTemperature = setFarinhaitDegree(maxTemp)
                        }else{
                            self._maxWeatherTemperature = setCelsiumDegree(maxTemp)
                        }
                    }
                    
                    if let pressure = main["pressure"] as? Int{
                        
                        if globalValueTypePressure == "hPa"{
                            self._pressure = setHpaPressure(pressure)
                        }else{
                            self._pressure = setMmHgPressure(pressure)
                        }
                        
                        
                    }
                    
                    if let humidity = main["humidity"] as? Int{
                        self._humidity = humidity
                    }
                }
                
                // MARK: Get wind.
                if let wind = dict["wind"] as? Dictionary<String,Any>{
                    if let speed = wind["speed"] as? Double{
                        
                        if globalValueTypeWindSpeed == "knots"{
                            self._speed = setKnotsWindSpeed(speed)
                        } else if globalValueTypeWindSpeed == "kmh" {
                            self._speed = setkmhWindSpeed(speed)
                        }else{
                            self._speed = setMsWindSpeed(speed)
                        }
                    }
                }
            }
            completed()
        }
    }
}


func setFarinhaitDegree ( _ currenKelvinTemp:Double) -> Double{
    let getTemperature = (currenKelvinTemp * (9/5) - 459.67)
    let _fahrenheit = Double(round(10 * getTemperature/10))
    return _fahrenheit
}

func setCelsiumDegree( _ currenKelvinTemp:Double) -> Double{
    let getTemperature = (currenKelvinTemp - 273.15)
    let _сelsius = Double(round(10 * getTemperature/10))
    return _сelsius
}

func setHpaPressure(_ currentPressure: Int) -> Int{
    let hpa = currentPressure
    return hpa
}

func setMmHgPressure(_ currentPressure: Int) -> Int{
        let mmHg = (Double(currentPressure)/1.333)
    return Int(mmHg)
}

func setKnotsWindSpeed(_ currentSpeed: Double) -> Double{

    let knots = currentSpeed
    let format: NSString = "%.2f"
    let shortKnots = numberFormatter(format, knots)
    return shortKnots
}

func setkmhWindSpeed(_ currentSpeed: Double) -> Double{
    let kmh = currentSpeed * 1.852
    let shortKmh = numberFormatter(kmh)
    return shortKmh
}

func setMsWindSpeed(_ currentSpeed: Double) -> Double{
    let ms = currentSpeed/1.944
    let shortMs = numberFormatter(ms)
    return shortMs
}

private func numberFormatter(_ value:Double)->Double{
    let formatter = NSString(format: "%.1f", value).doubleValue
    return formatter
}
private func numberFormatter(_ tupeformat: NSString, _ value:Double)->Double{
    let formatter = NSString(format: tupeformat, value).doubleValue
    return formatter
}
