//
//  RegionModel.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftyJSON

enum Directions: String {
    
    case east = "east"
    case west = "west"
    case north = "north"
    case south = "south"
    case central = "central"
    
}

struct RegionModel {
    var direction: Directions
    var locationCoordinate: CLLocationCoordinate2D
    
    init(direction: Directions, locationCoordinate: CLLocationCoordinate2D) {
        self.direction = direction
        self.locationCoordinate = locationCoordinate
    }
}

extension RegionModel: JsonModel {
    init?(json: JSON) {
        guard let direction = Directions.init(rawValue: json["name"].stringValue) else {
            return nil
        }
        
        guard let lat = json["label_location"]["latitude"].double,
            let long = json["label_location"]["longitude"].double else {
                return nil
        }
        
        let location = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
        self.init(
            direction: direction,
            locationCoordinate: location
        )
    }
}
