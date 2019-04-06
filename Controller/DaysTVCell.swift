//
//  DaysTVCell.swift
//  myWeather
//
//  Created by admin on 02/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DaysTVCell: UITableViewCell {
    @IBOutlet var day: UILabel!
    @IBOutlet var imageWeather: UIImageView!
    @IBOutlet var typeWeather: UILabel!
    @IBOutlet var minTemp: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var typeDegreeMax: UILabel!
    @IBOutlet var tupeDegreeMin: UILabel!
    
    
    func configureCell(daysForecast:DaysForecast){
        day.text = daysForecast.dayOfTheWeak
        imageWeather.image = UIImage(named: daysForecast.imageWeather)
        typeWeather.text = daysForecast.typeWeather
        minTemp.text = "\(daysForecast.minTemperature)"
        maxTemp.text = "\(daysForecast.maxTemperature)"
        typeDegreeMax.text = daysForecast.typeDegree
        tupeDegreeMin.text = daysForecast.typeDegree
    }

}
