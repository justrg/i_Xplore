//
//  Place.swift
//  MapView
//
//  Created by Justin Gasta on 2016/06/08.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation, NSCoding  {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var logoURL:String?
    var desc: String?
    var date: NSDate?
    var favorite: Bool
    
    required init(title:String?, coordinate:CLLocationCoordinate2D?, logoURL:String?, desc:String?, date:NSDate?, favorite: Bool) {
        self.title = title
        self.coordinate = coordinate!
        self.logoURL = logoURL
        self.desc = desc
        self.date = date
        self.favorite = favorite
    }
    
    // MARK: - NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.coordinate as! AnyObject, forKey: "coordinate") //Not sure if that is right
        aCoder.encodeObject(self.logoURL, forKey: "logoURL")
        aCoder.encodeObject(self.desc, forKey: "description")
        aCoder.encodeObject(self.date, forKey: "date")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let title = aDecoder.decodeObjectForKey("title") as? String
        let coordinate = aDecoder.decodeObjectForKey("coordinate") as! CLLocationCoordinate2D
        let logoURL = aDecoder.decodeObjectForKey("logoURL") as? String
        let description = aDecoder.decodeObjectForKey("description") as? String
        let date = aDecoder.decodeObjectForKey("date") as! NSDate
        let favorite = aDecoder.decodeObjectForKey("favorite") as! Bool
        
        self.init(title: title, coordinate: coordinate, logoURL: logoURL, desc: description, date: date, favorite: favorite)
        
    }
    
    class func placeList() -> [Place] {
        
        let place = Place(title: "Workshop 17", coordinate: CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983), logoURL: "https://avatars1.githubusercontent.com/u/7220596?v=3&s=200", desc: "xx", date: NSDate(), favorite: true)
        
        let place2 = Place(title: "Truth Coffee", coordinate: CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045), logoURL: "https://robohash.org/123.png", desc: "xx", date: NSDate(), favorite: false)
        
        let place3 = Place(title: "Lion's Head", coordinate: CLLocationCoordinate2D(latitude: -33.934722,longitude: 18.389167), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        
        let place4 = Place(title: "Never@Home", coordinate: CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        
        let place5 = Place(title: "Boulder Beach", coordinate: CLLocationCoordinate2D(latitude: -34.1972,longitude: 18.4513), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        
        let place6 = Place(title: "Randy Warthog", coordinate: CLLocationCoordinate2D(latitude: -33.907772,longitude: 18.40918), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        
        let place7 = Place(title: "Aquila Private Game Reserve", coordinate: CLLocationCoordinate2D(latitude: -33.3536,longitude: 19.9365), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        
        let place8 = Place(title: "V&A Market", coordinate: CLLocationCoordinate2D(latitude: -33.9060766,longitude: 18.423153800000023), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
                //place8.logoURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Flag_of_Afghanistan_(1880%E2%80%931901).svg/2000px-Flag_of_Afghanistan_(1880%E2%80%931901).svg.png"
        
        
        let place9 = Place(title: "Shark Alley", coordinate: CLLocationCoordinate2D(latitude: -34.57697367552366,longitude: 19.345378875732422), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        //place9.logoURL = "https://chasingpisces.files.wordpress.com/2009/11/south-africa-001.jpg"
        
        let place10 = Place(title: "University of Michigan", coordinate: CLLocationCoordinate2D(latitude: 42.2780,longitude: -83.7382), logoURL: nil, desc: "xx", date: NSDate(), favorite: false)
        //place10.logoURL = "https://en.wikipedia.org/wiki/University_of_Michigan#/media/File:Umichigan_color_seal.png"
        
        
        return [place, place3, place2, place4, place5, place6, place7, place8, place9, place10]
    }
    
//    class func aPlace () -> Place {
//        
//        let place = Place ()
//        place.title = "Workshop 17"
//        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
//        return place
//    }
    
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