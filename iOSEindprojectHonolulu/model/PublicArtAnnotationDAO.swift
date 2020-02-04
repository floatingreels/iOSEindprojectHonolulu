//
//  PublicArtAnnotationDAO.swift
//  iOSEindprojectHonolulu
//
//  Created by David Gunzburg on 03/02/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit


//klasse misschien niet nodig...
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
                let coordinate = CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)!)
            
                let artAnnotation = PublicArtAnnotation.init(title: title, coordinate: coordinate)
                                                             
                allAnnotations.append(artAnnotation)
                }
            } catch {
                 print("Error finding artwork")
            }
        return allAnnotations
    }
    
        func getArtAnnotation(objectid: String) -> PublicArtAnnotation {
    
            var artWork:PublicArtAnnotation?
    
            let url = URL.init(string: "https://data.honolulu.gov/resource/yef5-h88r.json?objectid=\(objectid)")
            do {
                let rawData = try Data.init(contentsOf: url!)
                let jsonData = try JSONSerialization.jsonObject(with: rawData) as! NSObject
                
                let latitude = jsonData.value(forKey: "latitude") as! String
                let longitude = jsonData.value(forKey: "longitude") as! String
                
                let coordinate = CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)!)
                artWork = PublicArtAnnotation.init(
                                         title: jsonData.value(forKey: "title") as! String,
                                         coordinate: coordinate)
    
            } catch {
                print("Error finding user")
            }
            return artWork!
        }
    
}
