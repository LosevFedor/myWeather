//
//  ShadowsSegmentControl.swift
//  myWeather
//
//  Created by admin on 27/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ShadowsSegmentControll: UISegmentedControl {
    override func awakeFromNib() {
        super .awakeFromNib()
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        layer.cornerRadius = 5.0
        layer.shadowOffset = .zero
        layer.shouldRasterize = true
    }
}
