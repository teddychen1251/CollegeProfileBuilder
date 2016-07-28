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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
