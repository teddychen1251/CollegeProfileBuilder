//
//  ViewController.swift
//  College Profile Builder
//
//  Created by SESP Walkup on 7/26/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colleges.append(College(name: "Harvard", location: "Cambridge, MA", enrollment: 21000, image: UIImage(named: "Harvard")!, url: NSURL(string: "http://www.harvard.edu/")!, locationCoord: CLLocationCoordinate2DMake(42.3770, 71.1167)))
        colleges.append(College(name: "Northwestern", location: "Evanston, IL", enrollment: 20336, image: UIImage(named: "Northwestern")!, url: NSURL(string: "http://www.northwestern.edu/")!, locationCoord: CLLocationCoordinate2DMake(42.0531, 87.6748)))
        colleges.append(College(name: "Tsinghua", location: "Beijing, China", enrollment: 45237, image: UIImage(named: "Tsinghua")!, url: NSURL(string: "http://www.tsinghua.edu.cn/publish/newthuen/")!, locationCoord: CLLocationCoordinate2DMake(40.001, 116.3292)))
        editButton.tag = 0
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel!.text = colleges[indexPath.row].name
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Add college here"
        }
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        } else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow!.row
        dvc.college = colleges[index]
    }
}



















