//
//  SettingsDegrees+CoreDataProperties.swift
//  myWeather
//
//  Created by admin on 20/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension SettingsDegrees {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsDegrees> {
        return NSFetchRequest<SettingsDegrees>(entityName: "SettingsDegrees")
    }

    @NSManaged public var degrees: String?

}
