//
//  MapViewController.swift
//  I_Xplore
//
//  Created by Justin on 6/8/16.
//  Copyright © 2016 Justin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate{
    
    var placeList: [Place] = Place.placeList()
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       self.tableView.allowsMultipleSelectionDuringEditing = false
        
        mapView.delegate = self
        setupMapView()
        setupTableView()
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
//     let mvtc: UINib
//            tableView.registerNib(nibName: "MapTableViewCell", bundle: nil), forCellReuseIdentifier: "MapTableViewCell")
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
        
        if place.favorite {
            cell.label?.textColor = UIColor.yellowColor()
        }
        else{
            cell.label?.textColor = UIColor.blackColor()
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm a"
        dateFormatter.AMSymbol = "AM"
        dateFormatter.PMSymbol = "PM"
        let convertedDate = dateFormatter.stringFromDate(place.date)
        cell.date!.text = String(convertedDate)
        
        //Account for online images vs local images
        if place.logoURL != nil {
            cell.iView!.imageFromUrl(place.logoURL!)
        }
        
        //Styling of table cells
        if indexPath.row % 2 == 1{
            cell.backgroundColor = UIColor(red: 228/255, green: 229/255, blue: 224/255, alpha: 1.0) /* #e4e5e0  Very light gray color */
                
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
        
        
        //        self.mapView.centerCoordinate = mapCenterCoordinateAfterMove
        //
        //        mapView.region.center.latitude = spot.coordinate.latitude
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            placeList.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//        }
//    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteRow = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("Delete tapped")
            self.placeList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        deleteRow.backgroundColor = UIColor.redColor()
        
        let favoriteRow = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            print("Favorite tapped")
            self.placeList[indexPath.row].favorite = true
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
        let place = placeList[indexPath.row]
        
        
        return 88
//        let row = indexPath.row
//        print ()
//        if place.ratable{
//            return 88
//        }
//        else{
//            
//            return 44
//        }
//        return 0
    }

}

