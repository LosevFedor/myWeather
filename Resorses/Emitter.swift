//
//  Emitter.swift
//  myWeather
//
//  Created by admin on 30/03/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class Emitter {
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 2
        cell.lifetime = 100
        cell.velocity = CGFloat(32)
        cell.emissionLongitude = 180*(.pi/180)
        cell.emissionRange = 62*(.pi/180)
        
        cell.scale = 0.01
        cell.scaleRange = 0.1
        
        cells.append(cell)
        return cells
    }
}
