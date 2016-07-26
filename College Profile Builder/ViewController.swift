//
//  ViewController.swift
//  College Profile Builder
//
//  Created by SESP Walkup on 7/26/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colleges.append(College(name: "Harvard", location: "Cambridge", enrollment: 21000, image: UIImage(named: "Harvard")!))
        colleges.append(College(name: "Northwestern", location: "Evanston", enrollment: 20336, image: UIImage(named: "Northwestern")!))
        colleges.append(College(name: "Tsinghua", location: "Beijing", enrollment: 45237, image: UIImage(named: "Tsinghua")!))
    }
}
