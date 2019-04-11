//
//  Constants.swift
//  myWeather
//
//  Created by admin on 11.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

let BASE_URL = "http://api.openweathermap.org/data/2.5/"

let PERIOD_WEATHER = "weather?"
let PERIOD_HOURLY = "forecast/hourly?"
let PERIOD_DAY = "forecast/daily?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let COUNT_HOURS = "&cnt=24"
let COUNT_DAYS = "&cnt=7"
let APP_KEY = "db7caade3d43e8a93511c450d1eb2f31"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(PERIOD_WEATHER)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(APP_ID)\(APP_KEY)"

let HOURLY_WEATHER_URL = "\(BASE_URL)\(PERIOD_HOURLY)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(COUNT_HOURS)\(APP_ID)\(APP_KEY)"

let DAY_WEATHER_URL = "\(BASE_URL)\(PERIOD_DAY)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(COUNT_HOURS)\(APP_ID)\(APP_KEY)"

//http://api.openweathermap.org/data/2.5/forecast/hourly?lat=35&lon=139&cnt=24&appid=db7caade3d43e8a93511c450d1eb2f31
//http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=7&appid=db7caade3d43e8a93511c450d1eb2f31
