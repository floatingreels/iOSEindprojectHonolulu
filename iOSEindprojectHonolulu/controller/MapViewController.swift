//
//  MapViewController.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var allArt = [PublicArt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //coördinaat van het middelpunt van de kaart instellen
        let center = CLLocationCoordinate2D.init(latitude: 21.3069, longitude: -157.8583)
        //hoogte en breedte instellen d.m.v. delta-coördinaten
        let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //aanmaken van de ingezoomde kaartweergave
        let visibleRegion = MKCoordinateRegion.init(center: center, span: span)
        //de gekozen weergave tonen in map view
        mapView.region = visibleRegion
        //verwijzing maken naar datasource
        allArt = PublicArtDAO.sharedInstance.getAllArt()
        //voeg pinnen toe aan mapview
        self.mapView.addAnnotations(allArt)
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        //wisselen tussen kaart- en sattelietweergave
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        default:print()
        }
    }

    // MARK: DELEGATE
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let art = annotation as? PublicArt {
            if annotation is MKUserLocation {
                return nil
            }
            //gaat zien of er al een herbruikbare annotationview in mapview bestaat
            if let artPin = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") {
                //geeft de annotationview de eigenschappen van je eingen klasse
                artPin.annotation = art
                //geef de view weer
                return artPin
            } else {
                //maak een nieuwe annotationview aan met de annotation uit je eigen klasse en herbruikbare ID
                let artPin = MKPinAnnotationView.init(annotation: art, reuseIdentifier: "pin")
                //geef kleur aan je annotationview
                artPin.pinTintColor = UIColor.black
                //zet dropanimatie uit want is irritant
                artPin.animatesDrop = false
                //toon de relevante properties uit eigen klasse
                artPin.canShowCallout = true
                //met dank aan Aula Swift (https://www.youtube.com/watch?v=a5dIfnuVdSk)
                //maak een button voor 'info'
                let button = UIButton(type: .detailDisclosure)
                //verander van default (blauw) naar zwart
                button.tintColor = .black
                //voeg button toe aan callout
                artPin.rightCalloutAccessoryView = button
                //geef de annotationview weer
                return artPin
            }
        }
        //code opvangen in geval dat er geen annotationview is
        return nil
    }

    //MARK: NAVIGATE
    //nogmaals met dank aan Aula Swift (https://www.youtube.com/watch?v=a5dIfnuVdSk)
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        //de gekozen annotationview moet vanaf nu alle gegevens van de klasse hebben
        let artView = view.annotation as! PublicArt
        //verwijzing maken naar storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //verwijzing maken naar de bestemming (view controller met ID)
        let destinationVC = storyboard.instantiateViewController(identifier: "Details") as! DetailViewController
        //object doorsturen naar de view controller
        destinationVC.artToDetail = artView
        //navigeren naar de view controller
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
