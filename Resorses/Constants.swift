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

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)34.97\(LONGITUDE)138.93\(APP_ID)\(APP_KEY)"
