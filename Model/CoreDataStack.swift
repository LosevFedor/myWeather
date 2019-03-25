//
//  CoreDataStack.swift
//  myWeather
//
//  Created by admin on 21/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import CoreData

var settingsTable = [SettingsTable]()
let context = CoreDataStack().persistentContainer.viewContext

class CoreDataStack{
    
    
    func loadData(_ key: String){
        
        let request: NSFetchRequest<SettingsTable> = SettingsTable.fetchRequest()
        do{
            settingsTable = try context.fetch(request)
            for data in settingsTable {
                print(data.value(forKey: key)!)
            }
            
        }catch{
            print("Error fetch SettingsParameters objects \(error.localizedDescription)")
        }
    }
    
    func saveChangesToData(_ value: String, _ key: String){
        
        let entiti = NSEntityDescription.entity(forEntityName: "SettingsTable", in: context)
        let changeParameter = NSManagedObject(entity: entiti!, insertInto: context)
        changeParameter.setValue(value, forKey: key)
        do{
            try context.save()
        }catch{
            print("Faill saved to coredata")
        }
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "myWeather")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

