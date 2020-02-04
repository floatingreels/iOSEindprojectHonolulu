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
    
//Read
    //functie om alle data weer te geven binnen te halen
    func getAllArt() -> [PublicArt] {
      
        var allArt = [PublicArt]()
        //verwijzing naar url waar alle restdata is opgeslagan
        let url = URL.init(string: "https://data.honolulu.gov/resource/yef5-h88r.json")
        //gegevens uit de json-objecten omzetten naar properties in eigen klasse
        do {
            let rawData = try Data.init(contentsOf: url!)
            let jsonArray = try JSONSerialization.jsonObject(with: rawData) as! [NSObject]
            
            for item in jsonArray {
                //standaardwaarde instellen voor properties die mogelijk niet ingevuld zijn
                //met dank aan Gwouten
                var jsonTitle = item.value(forKey: "title")
                if jsonTitle == nil {
                    jsonTitle = "Unnamed"}
                
                var jsonCreator = item.value(forKey: "creator")
                if jsonCreator == nil {
                    jsonCreator = "Unknown"
                }
                
                var jsonDate = item.value(forKey: "date")
                if jsonDate == nil {
                    jsonDate = "Unknown"
                }
                //properties van eigen klasse invullen met gegevens uit json-objecten
                let objectid = item.value(forKey: "objectid") as! String
                let title = jsonTitle as! String
                let creator = jsonCreator as! String
                let details = item.value(forKey: "description") as! String
                let access = item.value(forKey: "access") as! String
                let discipline = item.value(forKey: "discipline") as! String
                let date = jsonDate as! String
                let latitude = item.value(forKey: "latitude") as! String
                let longitude = item.value(forKey: "longitude") as! String
                //initialiseren van object met nieuw ingevulde gegevens
                let artWork = PublicArt.init(objectid: objectid,
                                             title: title,
                                             creator: creator,
                                             discipline: discipline,
                                             details: details,
                                             date: date,
                                             access: access,
                                             latitude: latitude,
                                             longitude: longitude)
                //object toevoegen aan eigen dataset
                allArt.append(artWork)
                }
            //fouten opvangen indien er iets is misgelopen
            } catch {
                 print("Error finding artwork")
            }
        //alle objecten in eigen dataset weergeven
        return allArt
    }
}
