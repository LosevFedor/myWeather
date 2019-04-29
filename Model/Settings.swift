//
//  Settings.swift
//  myWeather
//
//  Created by admin on 20/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var globalValueTypeTemperature: String!
var globalValueTypePressure: String!
var globalValueTypeWindSpeed: String!

class Settings {
    
    private var _сelsius: Double!
    private var _fahrenheit: Double!
    
    private var _selectTemp: Int!
    private var _selectPressure: Int!
    private var _selectWindSpeed: Int!

    let coreDataStack = CoreDataStack()
    
    var сelsius: Double{
        get {
            if _сelsius == nil{ _сelsius = 0.0 }
            return _сelsius
        }
    }
    
    var fahrenheit: Double{
        get {
            if _fahrenheit == nil{ _fahrenheit = 0.0 }
            return _fahrenheit
        }
    }
    
    var selectTemp: Int{
        get { return _selectTemp }
        set { _selectTemp = newValue }
    }
    
    var selectPressure: Int{
        get { return _selectPressure }
        set { _selectPressure = newValue }
    }
    var selectWindSpeed: Int{
        get { return _selectWindSpeed }
        set { _selectWindSpeed = newValue }
    }

    init() {
        loadData()
        
    }
    
    func loadData(){
        
        let request: NSFetchRequest<SettingsTable> = SettingsTable.fetchRequest()
        do{
            settingsTable = try context.fetch(request)
            for data in settingsTable {
                _selectTemp = data.value(forKey: "selectTemp") as? Int
                globalValueTypeTemperature = (data.value(forKey: "temperature") as? String)!
                
                _selectPressure = data.value(forKey: "selectPress") as? Int
                globalValueTypePressure = (data.value(forKey: "pressure") as? String)!
                
                _selectWindSpeed = data.value(forKey: "selectWindSpeed") as? Int
                globalValueTypeWindSpeed = (data.value(forKey: "windSpeed") as? String)!
                

            }
            
        }catch{
            print("Error fetch SettingsParameters objects \(error.localizedDescription)")
        }
    }
    
    func saveChangesToData(){
        let entiti = NSEntityDescription.entity(forEntityName: "SettingsTable", in: context)
        
        let changeParameter = NSManagedObject(entity: entiti!, insertInto: context)
        changeParameter.setValue(globalValueTypeTemperature, forKey: "temperature")
        changeParameter.setValue(selectTemp, forKey: "selectTemp")
        
        changeParameter.setValue(globalValueTypePressure, forKey: "pressure")
        changeParameter.setValue(selectPressure, forKey: "selectPress")
        
        changeParameter.setValue(globalValueTypeWindSpeed, forKey: "windSpeed")
        changeParameter.setValue(selectWindSpeed, forKey: "selectWindSpeed")
        
        coreDataStack.save()
        
    }
    
    
}
