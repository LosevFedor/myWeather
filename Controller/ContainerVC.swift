//
//  ContainerVC.swift
//  myWeather
//
//  Created by admin on 06.03.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBAction func homePage(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "home") as? CurrentForecastVC
        present(home!, animated: true, completion: nil)
    }
    
    @IBAction func ShowHourlyWeather(_ sender: Any) {
        let hourly = self.storyboard?.instantiateViewController(withIdentifier: "hourly") as? ForecastHourlyTVC
        present(hourly!, animated: true, completion: nil)
    }
    
    @IBAction func ShowWeatherAt10Days(_ sender: Any) {
        let tenDays = self.storyboard?.instantiateViewController(withIdentifier: "tenDays") as? ForecastTenDaysTVC
        present(tenDays!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
