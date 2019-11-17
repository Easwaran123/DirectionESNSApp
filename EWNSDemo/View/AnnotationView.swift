//
//  AnnotationView.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import MapKit


class AnnotationView: MKPinAnnotationView {
    var pinCustomImageName:String!
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11)
        let width = NSLayoutConstraint(item: label,
                                       attribute: .width,
                                       relatedBy: .lessThanOrEqual,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 400)
        label.addConstraint(width)
        
        let height = NSLayoutConstraint(item: label,
                                        attribute: .height,
                                        relatedBy: .greaterThanOrEqual,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 0)
        label.addConstraint(height)
        
        return label
    }()
    
    override var detailCalloutAccessoryView: UIView? {
        get {
            return self.subtitleLabel
        } set { }
    }
    
    override var canShowCallout: Bool {
        get { return true }
        set { }
    }
}
