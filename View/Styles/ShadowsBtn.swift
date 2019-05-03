//
//  ShadowsBtn.swift
//  myWeather
//
//  Created by admin on 27/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ShadowBtn: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 30
        layer.shadowOffset = CGSize(width: -1.0, height: -1.0)
        layer.cornerRadius = 0.0
    }
}
