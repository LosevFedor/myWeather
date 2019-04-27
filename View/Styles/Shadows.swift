//
//  Shadows.swift
//  myWeather
//
//  Created by admin on 27/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class Shadows: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
    }
}
