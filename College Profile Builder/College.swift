//
//  College.swift
//  College Profile Builder
//
//  Created by SESP Walkup on 7/26/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit
import MapKit

class College: NSObject {
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")
    var url = NSURL(string: "https://bigfuture.collegeboard.org/college-search")
    var locationCoord = CLLocationCoordinate2DMake(0.0, 0.0)
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage, url: NSURL, locationCoord: CLLocationCoordinate2D) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
        self.url = url
        self.locationCoord = locationCoord
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }

}
