//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by SESP Walkup on 7/26/16.
//  Copyright © 2016 Teddy Chen. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var urlTextField: UITextField!
    
    var college: College!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        collegeTextField.text = college.name
        locationTextField.text = college.location
        enrollmentTextField.text = String(college.enrollment)
        imageView.image = college.image
        urlTextField.text = String(college.url!)
    }
    
    @IBAction func onTappedImageView(sender: UITapGestureRecognizer) {
        let actionController = UIAlertController(title: "Select image source", message: "test", preferredStyle: .ActionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .Default) { (action) in
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.Camera) {
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Camera not available")
                //eventually dismiss AlertController and display alert
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionController.addAction(libraryAction)
        actionController.addAction(cameraAction)
        actionController.addAction(cancelAction)
    }
    @IBAction func onTappedGoButton(sender: UIButton) {
        let url = NSURL(string: urlTextField.text!)!
        let svc = SFSafariViewController(URL: url)
        presentViewController(svc, animated: true, completion: nil)
    }
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.enrollment = Int(enrollmentTextField.text!)!
        college.url = NSURL(string: urlTextField.text!)
    }
}
