//
//  ViewController.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentForecastVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var sity: UILabel!
    @IBOutlet var sityTemperature: UILabel!
    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var descriptionWeather: UILabel!
    @IBOutlet var maxTemperature: UILabel!
    @IBOutlet var minTemperature: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var windSpeed: UILabel!
    @IBOutlet var humidity: UILabel!
    @IBOutlet var pressure: UILabel!
    
    
    
    var currentWeather: CurrentWeather!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        currentWeather = CurrentWeather()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //locationAuthStatus()
        
    }
    func locationAuthStatus(){
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            //print("longitude \(currentLocation.coordinate.longitude) latitude \(currentLocation.coordinate.latitude)")
            //print(CURRENT_WEATHER_URL)
            currentWeather.downloadWeatherDetails {
                self.currentWeatherToday()
            }
            //locationManager.stopUpdatingLocation()
            
        }else{
            //locationManager.requestWhenInUseAuthorization()
            //locationAuthStatus()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        // Only called when variable have location data
        locationAuthStatus()
    }
    
    func currentWeatherToday(){
        sity.text = currentWeather.sityName
        sityTemperature.text = "\(currentWeather.currentTemperature)"
        imageWeather.image = UIImage(named: currentWeather.imageWeather)
        descriptionWeather.text = currentWeather.weatherType
        maxTemperature.text = "\(currentWeather.maxWeatherTemperature)"
        minTemperature.text = "\(currentWeather.minWeatherTemperature)"
        date.text = currentWeather.date
        windSpeed.text = "\(currentWeather.speed)"
        humidity.text = "\(currentWeather.humidity)"
        pressure.text = "\(currentWeather.pressure)"
        
    }
    
}

