//
//  PlacesController.swift
//  i_Xplore
//
//  Created by Justin on 6/14/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import Foundation
import MapKit

class PlacesController {
    
    private var placeList: [Place] = []
    
    var coordinate: CLLocationCoordinate2D?
    var title: String?
    var logoURL:String?
    var desc: String?
    var date: NSDate?
    
    
    // Singleton design pattern
    class var sharedInstance: PlacesController {
        struct Static {
            static var instance:PlacesController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = PlacesController()
        }
        return Static.instance!
    }
    
    
    func addPlace( title: String?, coordinates: CLLocationCoordinate2D, logoURL: String?, date: NSDate?, description: String?){
        var newPlace = Place(title: title, coordinate: coordinates, logoURL: logoURL, desc: description, date: date, favorite: false)
        
        placeList.append(newPlace)
        
        PersistenceManager.saveNSArray(placeList, fileName: "array")

    }
    
    //new function to update favorite
    
    private func readPlacesFromMemory(){
        var places = PersistenceManager.loadNSArray("array") as? [Place]
        if places != nil {
            self.placeList += places!
        }
        
    }
    
    func getPlaces() ->  [Place]{
        
        if PlacesController.sharedInstance.placeList.isEmpty{
            PlacesController.sharedInstance.readPlacesFromMemory()
            //return Place.placeList()
            return PlacesController.sharedInstance.placeList
        }
        else{
            return PlacesController.sharedInstance.placeList
        }
        
    }

}