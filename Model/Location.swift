//
//  Location.swift
//  myWeather
//
//  Created by admin on 18/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class Location{
    
    private var _latitude: Double!
    private var _longitude: Double!
    
    private init() {}
    
    static var sharedInstance = Location()
    
    // MARK: Default coordinates lat = 41.145556 lon = -73.995 (New-York city)
    var latitude: Double{
        get{
            if _latitude == nil{
                _latitude = 0.0//41.145556
            }
            return _latitude
        }
        set{_latitude =  newValue}
    }
    var longitude: Double{
        get{
                if _longitude == nil{
                _longitude = 0.0//-73.995
            }
            return _longitude
        }
        set{_longitude = newValue}
    }
    
}
