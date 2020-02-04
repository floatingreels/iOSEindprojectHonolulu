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

    var allAnnotations = [PublicArtAnnotation]()
    var artAnnotation:PublicArtAnnotation?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //wat wordt weergegeven bij het laden van de map view
        //coördinaat van het middelpunt van de kaart instellen
        let center = CLLocationCoordinate2D.init(latitude: 21.3069, longitude: -157.8583)
        //hoogte en breedte instellen d.m.v. delta-coördinaten
        let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //aanmaken van de ingezoomde kaartweergave
        let visibleRegion = MKCoordinateRegion.init(center: center, span: span)
        mapView.region = visibleRegion
        
        allAnnotations = PublicArtAnnotationDAO.sharedInstance.getAllAnnotations()
        artAnnotation = PublicArtAnnotationDAO.sharedInstance.getArtAnnotation(objectid: PublicArt.objectid)

        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let annotation = PublicArtAnnotation.init(title: "Honolulu",
        coordinate: center)
        
        
        //voeg pin toe aan mapview
        self.mapView.addAnnotation(annotation)
        

    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        //om te kunnen wisselen tussen kaart- en sattelietweergave
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        default:print()
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
