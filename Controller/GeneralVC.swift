//
//  GeneralVC.swift
//  myWeather
//
//  Created by admin on 01/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class GeneralVC: UIViewController {

    @IBOutlet weak var now:UIView!
    @IBOutlet weak var hourly:UIView!
    @IBOutlet weak var days:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchViews(_ sender: UISegmentedControl){
        switch (sender.selectedSegmentIndex) {
        case 0:
            now.alpha = 1
            hourly.alpha = 0
            days.alpha = 0
            print("0")
        case 1:
            now.alpha = 0
            hourly.alpha = 1
            days.alpha = 0
            print("1")
        case 2:
            now.alpha = 0
            hourly.alpha = 0
            days.alpha = 1
            print("2")
        default:
            print("Error change segment")
        }
    }
    

}
