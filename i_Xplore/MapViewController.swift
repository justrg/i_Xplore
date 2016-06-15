//
//  MapViewController.swift
//  I_Xplore
//
//  Created by Justin on 6/8/16.
//  Copyright © 2016 Justin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate{
    
    var placeList: [Place] = []
    var locationManager: CLLocationManager?
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let list = PersistenceManager.loadNSArray("array") as? [Place]
        
        if (list != nil) {
            placeList = list!
        }
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager!.requestWhenInUseAuthorization()

        
       self.tableView.allowsMultipleSelectionDuringEditing = false
        
        mapView.delegate = self
        setupMapView()
        setupTableView()
        
        let plusButton = UIBarButtonItem(title: "+", style: .Done, target: self, action: #selector(self.presentNewPlace))
        
        self.navigationItem.rightBarButtonItem = plusButton
    }
    

    
    func presentNewPlace(){
        let vc = NewPlaceViewController()
        self.presentViewController(vc, animated: true, completion: nil)
        print("Shit works man")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupMapView() {
        mapView.mapType = .Hybrid
        self.mapView.showsBuildings = true
        //self.mapView.addAnnotation(self.spotList as! MKAnnotation)
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
    ////////// TABLE VIEW FUNCTIONS /////////////////
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell", forIndexPath: indexPath) as! CustomTableViewCell
        let place = placeList[indexPath.row]
        cell.label!.text = place.title
        cell.desc!.text = place.desc
        
        
        if (place.favorite) {
            cell.label?.textColor = UIColor.yellowColor()
        }
        else{
            cell.label?.textColor = UIColor.blackColor()
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm a"
        dateFormatter.AMSymbol = "AM"
        dateFormatter.PMSymbol = "PM"
        let convertedDate = dateFormatter.stringFromDate(place.date!)
        cell.date!.text = String(convertedDate)
        
        //Account for online images vs local images
        if place.logoURL != nil {
            cell.iView!.imageFromUrl(place.logoURL!)
        }
        
        //Styling of table cells
        if indexPath.row % 2 == 1{
            cell.backgroundColor = UIColor(red: 228/255, green: 229/255, blue: 224/255, alpha: 1.0) /* #e4e5e0  Very light gray color */
            cell.desc?.backgroundColor = UIColor(red: 228/255, green: 229/255, blue: 224/255, alpha: 1.0) /* #e4e5e0  Very light gray color */
                
                //UIColor(red: 230/255, green: 231/255, blue: 247/255, alpha: 1.0) /* #e6e7f7 Light blue color*/
                //UIColor(red: 228/255, green: 229/255, blue: 224/255, alpha: 1.0) /* #e4e5e0  Very light gray color */
        }
        else {
            cell.backgroundColor = UIColor.clearColor()
        }
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let spot = placeList[indexPath.row]
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: spot.coordinate.latitude, longitude: spot.coordinate.longitude)
        self.mapView.addAnnotation(spot as MKAnnotation)
        
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapCenterCoordinateAfterMove.latitude, longitude: mapCenterCoordinateAfterMove.longitude), span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteRow = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("Delete tapped")
            self.placeList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        deleteRow.backgroundColor = UIColor.redColor()
        
        let favoriteRow = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            
            
            print("Favorite tapped")

            var array = PersistenceManager.loadNSArray("array") as! [Place]
            
            let place = array[indexPath.row]
            
            place.favorite = true
            
            array.removeAtIndex(indexPath.row)
            array.insert(place, atIndex: indexPath.row)

            PersistenceManager.saveNSArray(array, fileName: "array")
            
            for element in array {
                print(element.title)
                print(element.favorite)
            }
            
            
            
        }
        favoriteRow.backgroundColor = UIColor.orangeColor()
        
        return [favoriteRow, deleteRow]
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        if (annotation as! Place).favorite {
            pin.pinTintColor = UIColor.yellowColor()
        }
        else{
            pin.pinTintColor = UIColor.redColor()
        }
        pin.canShowCallout = true
        pin.animatesDrop = true
        return pin
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //let place = placeList[indexPath.row]
        return 88
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {

                }
            }
        }
    }

}

