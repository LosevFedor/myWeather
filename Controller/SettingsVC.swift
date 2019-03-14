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

    override var prefersStatusBarHidden: Bool{
        return true
    }

}
