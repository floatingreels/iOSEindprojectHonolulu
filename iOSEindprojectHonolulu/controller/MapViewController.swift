//
//  MapViewController.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
     
    var allArt = [PublicArt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
            
            
        let center = CLLocationCoordinate2D.init(latitude: 21.3069, longitude: -157.8583)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let visibleRegion = MKCoordinateRegion.init(center: center, span: span)
        mapView.region = visibleRegion
        
        
        //allArt = PublicArtDAO.sharedInstance.getAllArt()
                
        //let pinArt:PublicArt = PublicArt(objectid: , title: <#T##String#>, creator: <#String#>, imagefile: <#String#>, discipline: <#String#>, details: <#String#>, date: <#String#>, credit: <#String#>, access: <#String#>, latitude: <#T##String#>, longitude: <#T##String#>)
        
        //voeg pin toe aan mapview
        //self.mapView.addAnnotation(pinArt)
        

    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        default:print()
        }
    }


    // MARK: - Navigation

    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    //}
}
