//
//  DaysTVController.swift
//  myWeather
//
//  Created by admin on 01/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

var currentWeather = CurrentWeather()
var dayForecasts = [DaysForecast]()
var dayForecast:DaysForecast!


class DaysTVController: UITableViewController, CLLocationManagerDelegate {
    
    @IBOutlet var currentSityName: UILabel!
    
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
            //print(HOURLY_WEATHER_URL)
            downloadHourlyForecastData {}
            
            // MARK: Stop updating location
            locationManager.stopUpdatingLocation()
            
        }else{
            print("non authorized DaysForecasrControll")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        
        //currentSityName.text = currentWeather.sityName
        
        // Only called when variable have location data
        locationAuthStatus()
    }
    
    func downloadHourlyForecastData(completed: @escaping DownloadComplete){
        Alamofire.request(DAY_WEATHER_URL, method: .get).responseJSON{ (responce) in

            let result = responce.result
                if let dict = result.value as? Dictionary<String,Any>{
                    if let list = dict["list"] as? [Dictionary<String, Any>]{
                        for obj in list{
                            dayForecast = DaysForecast(forecastDict:obj)
                            dayForecasts.append(dayForecast)
                            print(dayForecast)
                        }
                        self.tableView.reloadData()
                    }
                    if let city = dict["city"] as? Dictionary<String,Any>{
                        if let name = city["name"] as? String{
                            self.currentSityName.text = name
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
        
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daysId", for: indexPath)


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
