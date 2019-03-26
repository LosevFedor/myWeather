//
//  AppDelegate.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

let keyTemperature = "temperature"
let keySelectTemp = "selectTemp"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    private let coreDataStack = CoreDataStack()
    private let defaultTemperature = "сelsius"
    private let defaultSelectTemp = 0
    
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

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    private func saveDefaultSettings(){
        let entiti = NSEntityDescription.entity(forEntityName: "SettingsTable", in: context)
        
        let changeParameter = NSManagedObject(entity: entiti!, insertInto: context)
        changeParameter.setValue(defaultTemperature, forKey: keyTemperature)
        changeParameter.setValue(defaultSelectTemp, forKey: keySelectTemp)
        coreDataStack.save()
        
    }
}

