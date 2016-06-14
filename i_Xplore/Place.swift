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
    var favorite: Bool = false
    
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
        place3.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Lion%27s_Head_from_Signal_Hill.jpg/1280px-Lion%27s_Head_from_Signal_Hill.jpg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.934722,longitude: 18.389167)
        
        let place4 = Place()
        place4.title = "Never@Home"
        //place4.ratable = true
        place4.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Flag_of_Afghanistan_(1880%E2%80%931901).svg/2000px-Flag_of_Afghanistan_(1880%E2%80%931901).svg.png"
        place4.coordinate = CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918)
        
        let place5 = Place()
        place5.title = "Boulder Beach"
        //place4.ratable = true
        place5.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Boulders_Bay.jpg/1024px-Boulders_Bay.jpg"
        place5.coordinate = CLLocationCoordinate2D(latitude: -34.1972,longitude: 18.4513)
        
        let place6 = Place()
        place6.title = "Randy Warthog"
        place6.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Flag_of_Afghanistan_(1880%E2%80%931901).svg/2000px-Flag_of_Afghanistan_(1880%E2%80%931901).svg.png"
        place6.coordinate = CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918)
        
        let place7 = Place()
        place7.title = "Aquila Private Game Reserve"
        place7.logoURL = "https://www.cometocapetown.com/wp-content/gallery/aquila-reserve/andulela_aquila_house.jpg"
        place7.coordinate = CLLocationCoordinate2D(latitude: -33.3536,longitude: 19.9365)
        
        let place8 = Place()
        place8.title = "V&A Market"
        place8.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Flag_of_Afghanistan_(1880%E2%80%931901).svg/2000px-Flag_of_Afghanistan_(1880%E2%80%931901).svg.png"
        place8.coordinate = CLLocationCoordinate2D(latitude: -33.9060766,longitude: 18.423153800000023)
        
        let place9 = Place()
        place9.title = "Shark Alley"
        place9.logoURL = "https://chasingpisces.files.wordpress.com/2009/11/south-africa-001.jpg"
        place9.coordinate = CLLocationCoordinate2D(latitude: -34.57697367552366,longitude: 19.345378875732422)
        
        let place10 = Place()
        place10.title = "University of Michigan"
        place10.logoURL = "https://en.wikipedia.org/wiki/University_of_Michigan#/media/File:Umichigan_color_seal.png"
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