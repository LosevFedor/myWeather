//
//  HourlyTVCell.swift
//  myWeather
//
//  Created by admin on 02/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class HourlyTVCell: UITableViewCell {

    @IBOutlet var time: UILabel!
    @IBOutlet var hourlyImageWeather: UIImageView!
    @IBOutlet var hourlyTypeWeather: UILabel!
    @IBOutlet var hourlyTemp: UILabel!
    @IBOutlet var currentWeather: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
