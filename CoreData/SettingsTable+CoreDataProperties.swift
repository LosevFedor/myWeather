//
//  SettingsTable+CoreDataProperties.swift
//  myWeather
//
//  Created by admin on 26/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension SettingsTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsTable> {
        return NSFetchRequest<SettingsTable>(entityName: "SettingsTable")
    }

    @NSManaged public var temperature: String?
    @NSManaged public var selectTemp: String?

}
