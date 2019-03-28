//
//  SettingsTable+CoreDataProperties.swift
//  myWeather
//
//  Created by admin on 28/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension SettingsTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsTable> {
        return NSFetchRequest<SettingsTable>(entityName: "SettingsTable")
    }

    @NSManaged public var selectTemp: Int16
    @NSManaged public var temperature: String?
    @NSManaged public var selectPress: Int16
    @NSManaged public var pressure: String?
    @NSManaged public var windSpeed: String?
    @NSManaged public var selectWindSpeed: Int16

}
