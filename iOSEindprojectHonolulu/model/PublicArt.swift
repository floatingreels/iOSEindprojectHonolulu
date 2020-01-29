//
//  PublicArt.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit

class PublicArt {
       
    var objectid: String
    var title: String
    var creator: String
    var imagefile: String
    var discipline: String
    var description: String
    var date: String
    var credit: String
    var access: String
    var coord: CLLocationCoordinate2D
    
    
    
    init(objectid: String, title: String, creator: String, imagefile: String, discipline: String, description: String, date: String, credit: String, access: String, latitude: String, longitude: String) {
        
        let coordLat = Double(latitude)
        let coordLong = Double(longitude)
        
            self.objectid = objectid
            self.title = title
            self.creator = creator
            self.imagefile = imagefile
            self.discipline = discipline
            self.description = description
            self.date = date
            self.credit = credit
            self.access = access
        self.coord = CLLocationCoordinate2DMake(coordLat!, coordLong!)
        }
}
