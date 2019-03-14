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
    
    
    // MARK: Public weather properties.
    
    // geted it
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
                        //print(self._weatherType)

                    }
                    /*if let description = weather[0]["description"] as? String{
                        self._imageWeather = description.capitalized
                    }*/
                }
                
                // MARK: Get weather temperature.
                if let main = dict["main"] as? Dictionary<String, Any>{
                    if let currenTemp = main["temp"] as? Double {
                        
                        let getTemperature = (currenTemp * (9/5) - 459.67)
                        let kelvinToFarinhate = Double(round(10 * getTemperature/10))
                        self._currentTemperature = kelvinToFarinhate
                        //print(self._currentTemperature)

                    }
                    if let minTemp = main["temp_min"] as? Double{
                        let getTemperature = (minTemp * (9/5) - 459.67)
                        let kelvinToFarinhate = Double(round(10 * getTemperature/10))
                        self._minWeatherTemperature = kelvinToFarinhate
                    }
                    if let maxTemp = main["temp_max"] as? Double{
                        let getTemperature = (maxTemp * (9/5) - 459.67)
                        let kelvinToFarinhate = Double(round(10 * getTemperature/10))
                        self._maxWeatherTemperature = kelvinToFarinhate
                    }
                }
            }
            completed()

        }
    }
}


