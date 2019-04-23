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
var daysWeak = [DaysForecast]()
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
       print(FIVE_DAY_WEATHER_URL)
        Alamofire.request(FIVE_DAY_WEATHER_URL, method: .get).responseJSON{ (responce) in

            let result = responce.result
                if let dict = result.value as? Dictionary<String,Any>{
                    if let list = dict["list"] as? [Dictionary<String, Any>]{
                        for obj in list{
                            if dayForecasts.count < 40{
                                dayForecast = DaysForecast(forecastDict:obj)
                                dayForecasts.append(dayForecast)
                            }
                            
                        }
                        
                        var daySunday = [DaysForecast]()
                        var dayMonday = [DaysForecast]()
                        var dayTuesday = [DaysForecast]()
                        var dayWednesday = [DaysForecast]()
                        var dayThursday = [DaysForecast]()
                        var dayFriday = [DaysForecast]()
                        var daySaturday = [DaysForecast]()

                        
                        for day in dayForecasts{
                            switch (day.dayOfTheWeak){
                               
                            case "Sunday":
                                daySunday.append(day)
                                
                            case "Monday":
                                dayMonday.append(day)

                            case "Tuesday":
                                dayTuesday.append(day)
                                
                            case "Wednesday":
                                dayWednesday.append(day)
                                
                            case "Thursday":
                                dayThursday.append(day)
                                
                            case "Friday":
                                dayFriday.append(day)
                                
                            case "Saturday":
                                daySaturday.append(day)

                            default:
                                print("Can not find this day of weak")
                            }

                        }
                        
                        if daysWeak.count < 6 {
                            
                            if !daySunday.isEmpty {
                                daysWeak.append(daySunday[0])
                            }
                            if !dayMonday.isEmpty {
                                daysWeak.append(dayMonday[0])
                            }
                            if !dayTuesday.isEmpty {
                                daysWeak.append(dayTuesday[0])
                            }
                            if !dayWednesday.isEmpty {
                                daysWeak.append(dayWednesday[0])
                            }
                            if !dayThursday.isEmpty {
                                daysWeak.append(dayThursday[0])
                            }
                            if !dayFriday.isEmpty {
                                daysWeak.append(dayFriday[0])
                            }
                            if !daySaturday.isEmpty {
                                daysWeak.append(daySaturday[0])
                            }
                        }

                        //print("daysWeak \(daysWeak.count)")

                    }
                    if let city = dict["city"] as? Dictionary<String,Any>{
                        if let name = city["name"] as? String{
                            self.currentSityName.text = name
                        }
                    }
                    self.tableView.reloadData()

                }
            completed()
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return daysWeak.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "daysId", for: indexPath) as? DaysTVCell {
            
            var nameWeakAndIndex = [String:Int]()
            let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!

            for index in 0...5 {
                    
                let detectDayOfWeak = calendar.date(byAdding: .day, value: index, to: NSDate() as Date, options: [])!.Days()

                let detectDayIndex = index

                nameWeakAndIndex = [detectDayOfWeak:detectDayIndex] /// ["Tuesday": 0] ["Wednesday": 1] ["Thursday": 2] ["Friday": 3] ["Saturday": 4] ["Sunday": 5]
            }
            daysWeak.sort(by: { (nameWeakAndIndex[$0.dayOfTheWeak] ?? 6) > (nameWeakAndIndex[$1.dayOfTheWeak] ?? 6) })
            
            let day = daysWeak[indexPath.row]
            cell.configureCell(daysForecast: day)
            return cell

        }else{
            return DaysTVCell()
        }
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
