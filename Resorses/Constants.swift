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
let PERIOD_FIVE_DAYS = "forecast?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let COUNT_HOURS = "&cnt=24"
let COUNT_DAYS = "&cnt=7"
let APP_KEY = "db7caade3d43e8a93511c450d1eb2f31"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(PERIOD_WEATHER)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(APP_ID)\(APP_KEY)"

let HOURLY_WEATHER_URL = "\(BASE_URL)\(PERIOD_HOURLY)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(COUNT_HOURS)\(APP_ID)\(APP_KEY)"

let FIVE_DAY_WEATHER_URL = "\(BASE_URL)\(PERIOD_FIVE_DAYS)\(LATITUDE)\(Location.sharedInstance.latitude)\(LONGITUDE)\(Location.sharedInstance.longitude)\(APP_ID)\(APP_KEY)"

//https://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=db7caade3d43e8a93511c450d1eb2f31

//http://api.openweathermap.org/data/2.5/forecast/hourly?lat=35&lon=139&cnt=24&appid=db7caade3d43e8a93511c450d1eb2f31
//http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=7&appid=db7caade3d43e8a93511c450d1eb2f31

//https://api.weather.yandex.ru/v1/forecast?lat=35&lon=139&limit=5 X-Yandex-API-Key:7b8e600a-2154-483a-b505-5d18c02c7b46
//                                https://api.weather.yandex.ru/v1/forecast?lon=123&lat=55&X-Yandex-API-Key:%20<7b8e600a-2154-483a-b505-5d18c02c7b46%20>
