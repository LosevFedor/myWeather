//
//  SettingsVC.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreData

class SettingsVC: UIViewController {

    private let coreDataStack = CoreDataStack()
    private var typeTemperature:String!
    private var selectTemp:Int!
    @IBOutlet var numberOfSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        numberOfSegment.selectedSegmentIndex = selectTemp
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func setUpTemperature(_ sender: UISegmentedControl) {
        numberOfSegment.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberOfSegment.selectedSegmentIndex) {
        case 0:
            //numberOfSegment = sender.selectedSegmentIndex
            typeTemperature = "сelsius"
            selectTemp = 0
            //sender.
        case 1:
            typeTemperature = "fahrenheit"
            selectTemp = 1
        default:
            print("error temperature type")
        }
        //print("UISegmentedControl \(e)")
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        /*for a in settingsTable{
            print("\(a.value(forKey: "temperature") as Any)  \(a.value(forKey: "selectTemp") as Any)")
        }*/
        
        coreDataStack.deleteParameters()
        
        saveChangesToData()

        dismiss(animated: true, completion: nil)
    }
    
    func loadData(){
        
        let request: NSFetchRequest<SettingsTable> = SettingsTable.fetchRequest()
        do{
            settingsTable = try context.fetch(request)
            for data in settingsTable {
                selectTemp = data.value(forKey: keySelectTemp) as? Int
                typeTemperature = data.value(forKey: keyTemperature) as? String
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
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
