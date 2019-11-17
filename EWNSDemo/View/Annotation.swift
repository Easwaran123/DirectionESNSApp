//
//  Annotation.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import MapKit


class Annotation: NSObject, MKAnnotation {
    
    var psi: ItemModel
    
    public var coordinate: CLLocationCoordinate2D {
        return psi.region.locationCoordinate
    }
    
    init(psi: ItemModel) {
        self.psi = psi
    }
    
    var title: String? {
        return psi.region.direction.rawValue
    }
    
    var subtitle: String? {
        return psi.getDescription()
    }
}
