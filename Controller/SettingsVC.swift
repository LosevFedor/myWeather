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
    private var typeTemperature = "сelsius"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setUpTemperature(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            typeTemperature = "сelsius"
        case 1:
            typeTemperature = "fahrenheit"
        default:
            print("error temperature type")
        }
        //print("UISegmentedControl \(e)")
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        
        ///coreDataStack.saveChangesToData(typeTemperature, keyTemperature)
        
        coreDataStack.loadData("temperature")
        
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
