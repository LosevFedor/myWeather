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
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        
        //precipitation("Snow")

        
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
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
            
            // MARK: Stop updating location
            locationManager.stopUpdatingLocation()
            
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
        
        precipitation(currentWeather.weatherType)
        
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
    
    func precipitation(_ type: String){
        switch type {
        case "Snow":
            setSnow(with: type)
        case "Rain":
            setRain(with: type)
        default:
            print("not snow and not rain")
            return
        }
    }
    
    func setSnow(with type: String){
        emitterParams(type)
    }
    
    func setRain(with type: String){
        emitterParams(type)
    }
    
    func emitterParams(_ type: String){
        let emitter = Emitter.get(with: type)
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        view.layer.addSublayer(emitter)
    }
}

