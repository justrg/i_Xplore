//
//  Place.swift
//  MapView
//
//  Created by Justin Gasta on 2016/06/08.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation  {
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String? = ""
    var logoURL:String?
    var ratable:Bool = true
    
    class func placeList() -> [Place] {
        
        let place = Place()
        place.title = "Workshop 17"
        place.logoURL = "https://avatars1.githubusercontent.com/u/7220596?v=3&s=200"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        
        let place2 = Place()
        place2.title = "Truth Coffee"
        place2.ratable = true
        place2.logoURL = "https://robohash.org/123.png"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        
        let place3 = Place()
        place3.title = "Lion's Head"
        place3.ratable = true
        place3.logoURL = "http://www.averysegal.com/wp-content/uploads/2014/04/cape-town-lions-head-mountain-hiking-path.jpg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9350,longitude: 18.3890)
        
        return [place, place2, place3]
    }
    
    class func aPlace () -> Place {
        
        let place = Place ()
        place.title = "Workshop 17"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        return place
    }
    
}

//let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: self.spotList[indexPath.row].coordinate.latitude,longitude: self.spotList[indexPath.row].coordinate.longitude)
//        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,
//MKCoordinateSpanMake(0.01, 0.01)))
//        mapView.setRegion(adjustedRegion, animated: true)

extension UIImageView   {
    
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
}