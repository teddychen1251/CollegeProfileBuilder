//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by SESP Walkup on 7/27/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationTextField: UITextField!
    
    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(college.locationCoord, span)
        let pin = MKPointAnnotation()
        pin.coordinate = college.locationCoord
        pin.title = college.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        let geocoder = CLGeocoder()
//        
//        
//        
//        
//        
//        
//        return true
//    }
}
