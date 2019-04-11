//
//  HourlyTVController.swift
//  myWeather
//
//  Created by admin on 01/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class HourlyTVController: UITableViewController, CLLocationManagerDelegate {

    @IBOutlet var currentSityName: UILabel!
    
    var hourlyForecast: HourlyForecast!
    var hourlyForecasts = [HourlyForecast]()
    let currentWeather = CurrentWeather()
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        
    }

    func locationAuthStatus(){
    
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            //print("longitude \(currentLocation.coordinate.longitude) latitude \(currentLocation.coordinate.latitude)")
            print(HOURLY_WEATHER_URL)
            downloadHourlyForecastData {}
            
            // MARK: Stop updating location
            locationManager.stopUpdatingLocation()
            
        }else{
            print("non authorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        
//        currentSityName.text = currentWeather.sityName

        // Only called when variable have location data
        locationAuthStatus()
    }
    
    func downloadHourlyForecastData(completed: @escaping DownloadComplete){
        Alamofire.request(HOURLY_WEATHER_URL, method: .get).responseJSON{ (responce) in
            
            let result = responce.result
            if self.hourlyForecasts.count < 24{
                if let dict = result.value as? Dictionary<String,Any>{
                    if let list = dict["list"] as? [Dictionary<String, Any>]{
                        for obj in list{
                                self.hourlyForecast = HourlyForecast(forecastDict:obj)
                                self.hourlyForecasts.append(self.hourlyForecast)
                                print(self.hourlyForecast)
                        }
                        self.tableView.reloadData()
                    }
                    if let city = dict["city"] as? Dictionary<String,Any>{
                        if let name = city["name"] as? String{
//                            self.currentSityName.text = name
                        }
                    }
                }
            }
            completed()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourlyForecasts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "hourlyId", for: indexPath) as? HourlyTVCell{

            let hourly = hourlyForecasts[indexPath.row]
            cell.configureCell(hourlyForecast: hourly)
            
            return cell
        }else{
            return HourlyTVCell()
        }
    }
    
}
