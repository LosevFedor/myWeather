//
//  SettingsTable+CoreDataProperties.swift
//  myWeather
//
//  Created by admin on 23/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//
//

import Foundation
import CoreData


extension SettingsTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsTable> {
        let request = NSFetchRequest<SettingsTable>(entityName: "SettingsTable")
        request.sortDescriptors = [NSSortDescriptor(key: "temperature", ascending: true)]
        return request
    }

    @NSManaged public var temperature: String

}
