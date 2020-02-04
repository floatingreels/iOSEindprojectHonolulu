//
//  PublicArtAnnotation.swift
//  iOSEindprojectHonolulu
//
//  Created by David Gunzburg on 03/02/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit


//klasse misschien niet nodig...
class PublicArtAnnotation : NSObject, MKAnnotation {
    
    var title : String?
    var coordinate : CLLocationCoordinate2D
    
    init (title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        
        super.init()
    }
}
