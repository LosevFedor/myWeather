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

    let settings = Settings()
    
    private let coreDataStack = CoreDataStack()
    @IBOutlet var numberOfSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.loadData()
        numberOfSegment.selectedSegmentIndex = settings.selectTemp
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func setUpTemperature(_ sender: UISegmentedControl) {
        numberOfSegment.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberOfSegment.selectedSegmentIndex) {
        case 0:
            //numberOfSegment = sender.selectedSegmentIndex
            settings.typeTemperature = "сelsius"
            settings.selectTemp = 0
            //sender.
        case 1:
            settings.typeTemperature = "fahrenheit"
            settings.selectTemp = 1
        default:
            print("error temperature type")
        }
        //print("UISegmentedControl \(e)")
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        coreDataStack.deleteParameters()
        settings.saveChangesToData()

        dismiss(animated: true, completion: nil)
    }

}
