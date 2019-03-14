//
//  ViewController.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CurrentForecastVC: UIViewController {

    @IBOutlet var sity: UILabel!
    @IBOutlet var sityTemperature: UILabel!
    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var descriptionWeather: UILabel!
    @IBOutlet var maxTemperature: UILabel!
    @IBOutlet var minTemperature: UILabel!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.currentWeatherToday()
        }

    }
   
    func currentWeatherToday(){
        sity.text = currentWeather.sityName
        sityTemperature.text = "\(currentWeather.currentTemperature)"
        imageWeather.image = UIImage(named: currentWeather.weatherType)
        descriptionWeather.text = currentWeather.weatherType
        maxTemperature.text = "\(currentWeather.maxWeatherTemperature)"
        minTemperature.text = "\(currentWeather.minWeatherTemperature)"
    }
    
    
}

