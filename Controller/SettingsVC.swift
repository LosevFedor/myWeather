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
    let currentWeather = CurrentWeather()
    
    private let coreDataStack = CoreDataStack()
    
    @IBOutlet var numberSegmentTemperature: UISegmentedControl!
    @IBOutlet var numberSegmentPressure: UISegmentedControl!
    @IBOutlet var numberSegmentWindSpeed: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.loadData()
        
        numberSegmentTemperature.selectedSegmentIndex = settings.selectTemp
        numberSegmentPressure.selectedSegmentIndex = settings.selectPressure
        numberSegmentWindSpeed.selectedSegmentIndex = settings.selectWindSpeed
    }
   
    @IBAction func setUpTemperature(_ sender: UISegmentedControl) {
        numberSegmentTemperature.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberSegmentTemperature.selectedSegmentIndex) {
        case 0:
            globalValueTypeTemperature = "сelsius"
            settings.selectTemp = 0
            //sender.
        case 1:
            globalValueTypeTemperature = "fahrenheit"
            settings.selectTemp = 1
        default:
            print("error temperature type")
        }
    }
    
    @IBAction func setUpPressure(_ sender: UISegmentedControl) {
        numberSegmentPressure.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberSegmentPressure.selectedSegmentIndex) {
        case 0:
            globalValueTypePressure = "hPa"
            settings.selectPressure = 0
        case 1:
            globalValueTypePressure = "mmHd"
            settings.selectPressure = 1
        default:
            print("error pressure type")
        }
    }
    
    @IBAction func setUpWindSpeed(_ sender: UISegmentedControl) {
        numberSegmentWindSpeed.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberSegmentWindSpeed.selectedSegmentIndex) {
        case 0:
            globalValueTypeWindSpeed = "knots"
            settings.selectWindSpeed = 0
        case 1:
            globalValueTypeWindSpeed = "kmh"
            settings.selectWindSpeed = 1
        case 2:
            globalValueTypeWindSpeed = "ms"
            settings.selectWindSpeed = 2
        default:
            print("error wind speed type")
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        coreDataStack.deleteParameters()
        settings.saveChangesToData()

        dismiss(animated: true, completion: nil)
    }

}
