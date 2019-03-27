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

class Settings {
    
    private var _сelsius: Double!
    private var _fahrenheit: Double!
    
    private var _selectTemp: Int!
    
    private var _typeTemperature:String!

    let coreDataStack = CoreDataStack()
    
    var сelsius:Double{
        get{
            if _сelsius == nil{
                _сelsius = 0.0
            }
            return _сelsius
        }
    }
    var fahrenheit:Double{
        get{
            if _fahrenheit == nil{
                _fahrenheit = 0.0
            }
            return _fahrenheit
        }
    }
    
    
    var typeTemperature: String {
        get{
            return _typeTemperature
        }set{
            _typeTemperature = newValue
        }
    }
    var selectTemp:Int{
        get{
            return _selectTemp
        }set{
            _selectTemp = newValue
        }
    }

    init() {
        loadData()
        
    }
    
    //static var internalSequances = Settings()
  
    
    func loadData(){
        
        let request: NSFetchRequest<SettingsTable> = SettingsTable.fetchRequest()
        do{
            settingsTable = try context.fetch(request)
            for data in settingsTable {
                _selectTemp = data.value(forKey: keySelectTemp) as? Int
                _typeTemperature = (data.value(forKey: keyTemperature) as? String)!
            }
            //print("\(selectTemp) \(typeTemperature)")
        }catch{
            print("Error fetch SettingsParameters objects \(error.localizedDescription)")
        }
    }
    
    func saveChangesToData(){
        let entiti = NSEntityDescription.entity(forEntityName: "SettingsTable", in: context)
        
        let changeParameter = NSManagedObject(entity: entiti!, insertInto: context)
        changeParameter.setValue(typeTemperature, forKey: keyTemperature)
        changeParameter.setValue(selectTemp, forKey: keySelectTemp)
        coreDataStack.save()
        
    }
    
    
}
