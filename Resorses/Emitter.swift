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
    
    private static let rain = #imageLiteral(resourceName: "Drop")
    private static let snow = #imageLiteral(resourceName: "Snow")
    
    static func get(with type:String) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: type)
        return emitter
    }
    
    private static func generateEmitterCells(with type: String) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        var cell = CAEmitterCell()
        
        switch type {
        case "Snow":
            cell = todaySnow()
        case "Rain":
            cell = todayRain()
        default:
            print("don't know what type of weather")
        }
        
        cells.append(cell)
        return cells
    }
    
    private static func todaySnow () -> CAEmitterCell{
        let cell = CAEmitterCell()
        cell.contents = snow.cgImage
        cell.birthRate = 2
        cell.lifetime = 32
        cell.velocity = CGFloat(32)
        cell.emissionLongitude = 180*(.pi/180)
        cell.emissionRange = 62*(.pi/180)
        
        cell.scale = 0.01
        cell.scaleRange = 0.1
        
        return cell
    }
    private static func todayRain () -> CAEmitterCell{
        let cell = CAEmitterCell()
        cell.contents = rain.cgImage
        cell.birthRate = 20
        cell.lifetime = 32
        cell.velocity = CGFloat(1000)
        cell.emissionLongitude = 180*(.pi/180)

        cell.scale = 0.1
        cell.scaleRange = 0.4
        return cell
    }
}
