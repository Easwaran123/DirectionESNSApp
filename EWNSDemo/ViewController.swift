//
//  ViewController.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    var pointAnnotation:AnnotationView!
    var pinAnnotationView:MKPinAnnotationView!
    @IBOutlet var mapView: MKMapView!
    var psis = [ItemModel]()
    var psiService = AFService(networkClient: NetworkClient())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadPSI()
    }
    
    //MARK: Private
    private func loadPSI() {
        psiService.getPSI(date: Date()) {
            self.psis = $0
            self.loadMapPins()
        }
    }
    
    private func loadMapPins() {
        for psi in psis {
            
            let annotation = Annotation.init(psi: psi)
            self.mapView.addAnnotation(annotation)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: AnnotationView!
        
        guard let annotation = annotation as? Annotation else {
            return nil
        }
        
        annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? AnnotationView
        if annotationView == nil {
            annotationView = AnnotationView.init(annotation: annotation, reuseIdentifier: "pin")
            
        }
        
        annotationView.subtitleLabel.text = annotation.subtitle
        
        return annotationView
    }
    
    
}
