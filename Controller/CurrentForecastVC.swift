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

    @IBOutlet var sityName: UILabel!
    @IBOutlet var sityTemperature: UILabel!
    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var descriptionWeather: UILabel!
    @IBOutlet var maxTemperature: UILabel!
    @IBOutlet var minTemperature: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var windSpeed: UILabel!
    @IBOutlet var humidity: UILabel!
    @IBOutlet var pressure: UILabel!
    @IBOutlet var visualTypeTemperatureCurrent: UILabel!
    @IBOutlet var visualTypeTemperatureMin: UILabel!
    @IBOutlet var visualTypeTemperatureMax: UILabel!
    @IBOutlet var visualTypeSpeed: UILabel!
    @IBOutlet var visualTypePressure: UILabel!
        
    var currentWeather: CurrentWeather!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = CurrentWeather()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        locationAuthStatus()
    }
    
    func locationAuthStatus(){
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            currentWeather.downloadWeatherDetails {
                self.currentWeatherToday()
            }
            
            locationManager.stopMonitoringSignificantLocationChanges()
            locationManager.stopUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        locationAuthStatus()
    }
    
    func currentWeatherToday(){
        sityName.text = currentWeather.sityName
        sityTemperature.text = "\(currentWeather.currentTemperature)"
        imageWeather.image = UIImage(named: currentWeather.imageWeather)
        descriptionWeather.text = currentWeather.weatherType
        
        maxTemperature.text = "\(currentWeather.maxWeatherTemperature)"
        minTemperature.text = "\(currentWeather.minWeatherTemperature)"
        date.text = currentWeather.date
        windSpeed.text = "\(currentWeather.speed)"
        humidity.text = "\(currentWeather.humidity)"
        pressure.text = "\(currentWeather.pressure)"
        
        visualTypeTemperatureCurrent.text = globalValueTypeTemperature
        visualTypeTemperatureMin.text = globalValueTypeTemperature
        visualTypeTemperatureMax.text = globalValueTypeTemperature
        
        visualTypeSpeed.text = globalValueTypeWindSpeed
        visualTypePressure.text = globalValueTypePressure
        
    }
    
    func reloadView() {
        self.viewDidLoad()
    }
    
    @IBAction func updateCurrentForecast(_ sender: Any){
         viewDidAppear(true)
    }
    
}

