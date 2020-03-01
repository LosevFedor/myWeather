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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
