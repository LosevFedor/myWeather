//
//  AppDelegate.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let keyTemperature = "temperature"
    private let keySelectTemperature = "selectTemp"
    
    private let keyPressure = "pressure"
    private let keySelectPressure = "selectPress"
    
    private let keyWindSpeed = "windSpeed"
    private let keySelectWindSpeed = "selectWindSpeed"
    
    private let coreDataStack = CoreDataStack()
    
    private let defaultTemperature = "сelsius"
    private let defaultSelectTemperature = 0
    
    private let defaultPressure = "hPa"
    private let defaultSelectPressure = 0
    
    private let defaultWindSpeed = "knots"
    private let defaultSelectWindSpeed = 0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
        } else {
            
            saveDefaultSettings()
            
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
        }
        return launchedBefore
    }

    private func saveDefaultSettings(){
        let entiti = NSEntityDescription.entity(forEntityName: "SettingsTable", in: context)
        
        let changeParameter = NSManagedObject(entity: entiti!, insertInto: context)
        
        changeParameter.setValue(defaultTemperature, forKey: keyTemperature)
        changeParameter.setValue(defaultSelectTemperature, forKey: keySelectTemperature)
        
        changeParameter.setValue(defaultPressure, forKey: keyPressure)
        changeParameter.setValue(defaultSelectPressure, forKey: keySelectPressure)
        
        changeParameter.setValue(defaultWindSpeed, forKey: keyWindSpeed)
        changeParameter.setValue(defaultSelectWindSpeed, forKey: keySelectWindSpeed)
        
        coreDataStack.save()
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    
}

