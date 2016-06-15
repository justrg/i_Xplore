//
//  NewPlaceViewController.swift
//  i_Xplore
//
//  Created by Justin on 6/14/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import UIKit
import MapKit

class NewPlaceViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        var location = CLLocationCoordinate2D()
        let lat = Double(latitudeField.text!)
        let log = Double(longitudeField.text!)
        location.latitude = lat! as CLLocationDegrees
        location.longitude = log! as CLLocationDegrees
        //var newPlace = Place(title: titleField.text, coordinate: location, logoURL: nil, desc: descriptionField.text, date: NSDate(), favorite: false)
        
        if title != "" {
            PlacesController.sharedInstance.addPlace(title, coordinates: location, logoURL: nil, date: NSDate(), description: descriptionField.text)
        }
        else{
            print("Shits broke man")
        }
        
    }
    @IBAction func cancelPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
