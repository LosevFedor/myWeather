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
            globalValueTypeTemperature = "˚c"
            settings.selectTemp = 0
        case 1:
            globalValueTypeTemperature = "˚f"
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
            globalValueTypePressure = "mm Hg"
            settings.selectPressure = 1
        default:
            print("error pressure type")
        }
    }
    
    @IBAction func setUpWindSpeed(_ sender: UISegmentedControl) {
        numberSegmentWindSpeed.selectedSegmentIndex = sender.selectedSegmentIndex
        switch (numberSegmentWindSpeed.selectedSegmentIndex) {
        case 0:
            globalValueTypeWindSpeed = "Knots"
            settings.selectWindSpeed = 0
        case 1:
            globalValueTypeWindSpeed = "Km/h"
            settings.selectWindSpeed = 1
        case 2:
            globalValueTypeWindSpeed = "M/s"
            settings.selectWindSpeed = 2
        default:
            print("error wind speed type")
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        coreDataStack.deleteParameters()
        settings.saveChangesToData()

        let view = CurrentForecastVC()
        view.reloadView()
        
        dismiss(animated: true, completion: nil)
    }

}
