//
//  Constants.swift
//  myWeather
//
//  Created by admin on 11.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "db7caade3d43e8a93511c450d1eb2f31"
//http://api.openweathermap.org/data/2.5/weather?&lat=55.04&lon=82.93&appid=db7caade3d43e8a93511c450d1eb2f31
//http://api.openweathermap.org/data/2.5/weather?lat=55.04&lon=82.93&appid=db7caade3d43e8a93511c450d1eb2f31

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(APP_ID)\(APP_KEY)"
