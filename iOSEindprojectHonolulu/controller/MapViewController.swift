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
        
        //wat wordt weergegeven bij het laden van de map view
        //coördinaat van het middelpunt van de kaart instellen
        let center = CLLocationCoordinate2D.init(latitude: 21.3069, longitude: -157.8583)
        //hoogte en breedte instellen d.m.v. delta-coördinaten
        let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //aanmaken van de ingezoomde kaartweergave
        let visibleRegion = MKCoordinateRegion.init(center: center, span: span)
        mapView.region = visibleRegion
        
        allArt = PublicArtDAO.sharedInstance.getAllArt()
        
        //voeg pinnen toe aan mapview
        self.mapView.addAnnotations(allArt)
        
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        //om te kunnen wisselen tussen kaart- en sattelietweergave
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        default:print()
        }
    }
}



extension MapViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let art = annotation as? PublicArt {
            //gaat zien of er al een herbruikbare pin (customview) in mapview bestaat
            if let artPin = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") {
                //geeft de customview de eigenschappen van je eingen klasse
                artPin.annotation = art
                //toon de customview
                return artPin
            } else {
                //maak een nieuwe view aan met de annotatie uit je eigen klasse en herbruikbare ID
                let artPin = MKPinAnnotationView.init(annotation: art, reuseIdentifier: "pin")
                
                //geef kleur aan je customview
                artPin.pinTintColor = UIColor.blue
                //zet dropanimatie uit want is irritant
                artPin.animatesDrop = false
                //toon de var subtitle uit eigen klasse
                artPin.canShowCallout = true
                artPin.showsLargeContentViewer = true
                artPin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                //toon de customview
                return artPin
            }
        }
        //code opvangen moest hij geen annotaties vinden
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let artView = view.annotation as! PublicArt
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(identifier: "Details") as! DetailViewController
        detailVC.artToDetail = artView
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        let alert = UIAlertController.init(title: "Public Art",
//                                           message: "Would you like to know more?",
//                                           preferredStyle: .alert)
        
        //ok handler aanmaken, wat uitvoeren als we op knop duwen
//        let okActionHandler = {(action:UIAlertAction) -> Void in
//        }
        
//        let okAction = UIAlertAction.init(title: "OK",
//                                          style: .default,
//                                          handler: okActionHandler)
        
//        let cancelAction = UIAlertAction.init(title: "Cancel",
//                                              style: .cancel,
//                                              handler: nil)
        
        //de aangemaakte actions  toevoegen aan de alert
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
        
        //hoe moet de alert worden weergegeven
//        self.present(alert, animated: true, completion: nil)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let art = sender as! PublicArt
//        let detailVC = segue.destination as! DetailViewController
//        detailVC.artToDetail = art
//    }


}
