//
//  Extention.swift
//  myWeather
//
//  Created by admin on 16/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


extension Date{
    func Days() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .short
        dataFormatter.dateFormat = "EEEE"
        return dataFormatter.string(from: self)
    }
}
extension Date{
    func Hourly() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .short
        dataFormatter.dateFormat = "EEEE HH:00"
        return dataFormatter.string(from: self)
    }
}
