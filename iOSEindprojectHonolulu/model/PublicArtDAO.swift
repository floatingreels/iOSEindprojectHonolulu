//
//  PublicArtDAO.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation
import MapKit

class PublicArtDAO {
    
    //Singleton
    
    static var sharedInstance:PublicArtDAO = PublicArtDAO.init()
    
    private init(){}
    
    //READ
    
    func getAllArt() -> [PublicArt] {
        var allArt = [PublicArt]()
        let url = URL.init(string: "https://data.honolulu.gov/resource/yef5-h88r.json")
        do {
            let rawData = try Data.init(contentsOf: url!)
            let jsonArray = try JSONSerialization.jsonObject(with: rawData) as! [NSObject]
            
            for item in jsonArray {
                
                var jsonTitle = item.value(forKey: "title")
                if jsonTitle == nil {
                    jsonTitle = "Unnamed"}
            
                var jsonCredit = item.value(forKey: "credit")
                if jsonCredit == nil {
                    jsonCredit = "None"}
                
                var jsonCreator = item.value(forKey: "creator")
                if jsonCreator == nil {
                    jsonCreator = "Unknown"
                }
                
                var jsonDate = item.value(forKey: "date")
                if jsonDate == nil {
                    jsonDate = "Unknown"
                }
                                
                let objectid = item.value(forKey: "objectid") as! String
                let title = jsonTitle as! String
                let creator = jsonCreator as! String
                let details = item.value(forKey: "description") as! String
                let access = item.value(forKey: "access") as! String
                let discipline = item.value(forKey: "discipline") as! String
                let date = jsonDate as! String
                let credit = jsonCredit as! String
                let latitude = item.value(forKey: "latitude") as! String
                let longitude = item.value(forKey: "longitude") as! String
            
                let artWork = PublicArt.init(objectid: objectid,
                                             title: title,
                                             creator: creator,
                                             discipline: discipline,
                                             details: details,
                                             date: date,
                                             credit: credit,
                                             access: access,
                                             latitude: latitude,
                                             longitude: longitude)
                allArt.append(artWork)                
                }
            } catch {
                 print("Error finding artwork")
            }
        return allArt
    }
}
