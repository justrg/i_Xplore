//
//  NewPlaceViewController.swift
//  i_Xplore
//
//  Created by Justin on 6/14/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NewPlaceViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    var locationManager: CLLocationManager?
    
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        var location = CLLocationCoordinate2D()
        let lat = Double(latitudeField.text!)
        let log = Double(longitudeField.text!)
        location.latitude = lat! as CLLocationDegrees
        location.longitude = log! as CLLocationDegrees
        //var newPlace = Place(title: titleField.text, coordinate: location, logoURL: nil, desc: descriptionField.text, date: NSDate(), favorite: false)
        
        if titleField.text != "" {
            PlacesController.sharedInstance.addPlace(titleField.text, coordinates: location, logoURL: nil, date: NSDate(), description: descriptionField.text)
        }
        else{
            print("Shits broke man")
        }
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func cancelPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        latitudeField.text = String(format:"%f", locValue.latitude)
        longitudeField.text = String(format:"%f", locValue.longitude)
        locationManager!.stopUpdatingLocation()
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
