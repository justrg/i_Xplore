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
    //var ratable:Bool = true
    var desc: String?
    var date: NSDate = NSDate()
    
    class func placeList() -> [Place] {
        
        let place = Place()
        place.title = "Workshop 17"
        place.date = NSDate()
        place.logoURL = "https://avatars1.githubusercontent.com/u/7220596?v=3&s=200"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        
        let place2 = Place()
        place2.title = "Truth Coffee"
        //place2.ratable = true
        place2.logoURL = "https://robohash.org/123.png"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        
        let place3 = Place()
        place3.title = "Lion's Head"
        //place3.ratable = true
        place3.logoURL = "https://pbs.twimg.com/profile_images/615938716800909312/Ail46JOW.jpg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.934722,longitude: 18.389167)
        
        let place4 = Place()
        place4.title = "Never@Home"
        //place4.ratable = true
        place4.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place4.coordinate = CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918)
        
        let place5 = Place()
        place5.title = "Boulder Beach"
        //place4.ratable = true
        place5.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place5.coordinate = CLLocationCoordinate2D(latitude: -34.1972,longitude: 18.4513)
        
        let place6 = Place()
        place6.title = "Randy Warthog"
        place6.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place6.coordinate = CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918)
        
        let place7 = Place()
        place7.title = "Aquila Private Game Reserve"
        place7.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place7.coordinate = CLLocationCoordinate2D(latitude: -33.3536,longitude: 19.9365)
        
        let place8 = Place()
        place8.title = "V&A Market"
        place8.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place8.coordinate = CLLocationCoordinate2D(latitude: -33.54266,longitude: 18.2457)
        
        let place9 = Place()
        place9.title = "Shark Alley"
        place9.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place9.coordinate = CLLocationCoordinate2D(latitude: -34.4114,longitude: 19.2451)
        
        let place10 = Place()
        place10.title = "University of Michigan"
        place10.logoURL = "http://plainicon.com/dboard/userprod/2805_fce53/prod_thumb/plainicon.com-44613-256px.png"
        place10.coordinate = CLLocationCoordinate2D(latitude: 42.2780,longitude: -83.7382)
        
        
        return [place, place3, place2, place4, place5, place6, place7, place8, place9, place10]
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