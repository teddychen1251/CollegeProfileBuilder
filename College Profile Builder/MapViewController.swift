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
        displayMapAndChangeTextField(college.locationCoord, pinTitle: college.name)
    }
    
    func displayMapAndChangeTextField(center: CLLocationCoordinate2D, pinTitle: String) {
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = pinTitle
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
        locationTextField.text = pinTitle
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationTextField.text!) { (placemarks, error) in
            if error != nil {
                print(error)
            } else if placemarks!.count == 1 {
                self.displayMapAndChangeTextField(placemarks![0].location!.coordinate, pinTitle: placemarks![0].name!)
            } else {
                let actionController = UIAlertController(title: "Possible Locations", message: nil, preferredStyle: .ActionSheet)
                for index in 0...9 {
                    if index < placemarks!.count {
                        let placemark = placemarks![index]
                        let possibleLocationAction = UIAlertAction(title: placemark.name, style: .Default, handler: { (action) in
                                self.displayMapAndChangeTextField(placemark.location!.coordinate, pinTitle: placemark.name!)
                        })
                        actionController.addAction(possibleLocationAction)
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                actionController.addAction(cancelAction)
                self.presentViewController(actionController, animated: true, completion: nil)
            }
        }
        return true
    }
    
    @IBAction func onTappedSaveButton(sender: UIBarButtonItem) {
        college.locationCoord = mapView.centerCoordinate
    }
}
