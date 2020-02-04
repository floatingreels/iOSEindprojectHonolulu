//
//  PublicArt.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit

class PublicArt : NSObject, MKAnnotation {
       
    var objectid: String
    var title: String?
    var creator: String
    var discipline: String
    var details: String
    var date: String
    var credit: String
    var access: String
    var coordinate: CLLocationCoordinate2D
    var latitude: String
    var longitude: String

    init(objectid: String,
         title: String?,
         creator: String,
         discipline: String,
         details: String,
         date: String,
         credit: String,
         access: String,
         latitude: String,
         longitude: String) {
            self.objectid = objectid
            self.title = title
            self.creator = creator
            self.discipline = discipline
            self.details = details
            self.date = date
            self.credit = credit
            self.latitude = latitude
            self.longitude = longitude
            self.access = access
            self.coordinate = CLLocationCoordinate2DMake(Double(latitude)!,
                                                         Double(longitude)!)
        }
}
