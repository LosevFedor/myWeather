//
//  HourlyTVCell.swift
//  myWeather
//
//  Created by admin on 02/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class HourlyTVCell: UITableViewCell {

    @IBOutlet var hourlyTimePeriod: UILabel!
    @IBOutlet var hourlyImageForecast: UIImageView!
    @IBOutlet var hourlyTypeWeather: UILabel!
    @IBOutlet var hourlyForecastTemp: UILabel!
    @IBOutlet var hourlutWeatherDegrees: UILabel!
    
    func configureCell(hourlyForecast: HourlyForecast){
        hourlyTimePeriod.text = hourlyForecast.hourlyTimePeriod
        hourlyImageForecast.image = UIImage(named: hourlyForecast.hourlyImageForecast)
        hourlyTypeWeather.text = hourlyForecast.hourlyTypeWeather
        hourlyForecastTemp.text = "\(hourlyForecast.hourlyForecastTemp)"
        hourlutWeatherDegrees.text = hourlyForecast.hourlyForecastDegree
    }
    
}
