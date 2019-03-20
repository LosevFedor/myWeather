//
//  SettingsVC.swift
//  myWeather
//
//  Created by admin on 04.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func setTypeTemperature(_ sender: UISegmentedControl) {
        var e = true
        switch (sender.selectedSegmentIndex) {
        case 0:
            //let degrees = Temperature()
            //degrees.сelsius
            e = true
        case 1:
            //let degrees = Temperature()
            //degrees.fahrenheit
            e = false
        default:
            print("error temperature type")
        }
        print(e)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
