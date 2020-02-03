//
//  PublicArtAnnotationDAO.swift
//  iOSEindprojectHonolulu
//
//  Created by David Gunzburg on 03/02/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit

class PublicArtAnnotationDAO {
    
    //Singleton
    
    static var sharedInstance:PublicArtAnnotationDAO = PublicArtAnnotationDAO.init()
    
    private init(){}
    
    //READ
    
    func getAllAnnotations() -> [PublicArtAnnotation] {
        var allAnnotations = [PublicArtAnnotation]()
        let url = URL.init(string: "https://data.honolulu.gov/resource/yef5-h88r.json")
        do {
            let rawData = try Data.init(contentsOf: url!)
            let jsonArray = try JSONSerialization.jsonObject(with: rawData) as! [NSObject]
            
            for item in jsonArray {
                
                var jsonTitle = item.value(forKey: "title")
                if jsonTitle == nil {
                    jsonTitle = "Unnamed"}
                let title = jsonTitle as! String
                
                let latitude = item.value(forKey: "latitude") as! String
                let longitude = item.value(forKey: "longitude") as! String
            
                let artAnnotation = PublicArtAnnotation.init(title: title,
                                                             coordinate: CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)!))
                allAnnotations.append(artAnnotation)
                }
            } catch {
                 print("Error finding artwork")
            }
        return allAnnotations
    }
}
