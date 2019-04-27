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
        layer.shadowOpacity = 3
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
}
