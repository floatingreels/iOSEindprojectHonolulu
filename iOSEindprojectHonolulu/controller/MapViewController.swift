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
        
        
        func mapView(_ mapView: MKMapView) {
            let visibleRegion = MKCoordinateRegion.init(center: CLLocationCoordinate2DMake(21.3069, -157.8583), latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.region = visibleRegion
        }
        
        //allArt = PublicArtDAO.sharedInstance.getAllArt()
                
        //let pinArt:PublicArt = PublicArt(objectid: <#String#>, title: <#T##String#>, creator: <#String#>, imagefile: <#String#>, discipline: <#String#>, details: <#String#>, date: <#String#>, credit: <#String#>, access: <#String#>, latitude: <#T##String#>, longitude: <#T##String#>)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
