//
//  TableViewController.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var artWorks = [PublicArt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //verwijzing naar datasource
        artWorks = PublicArtDAO.sharedInstance.getAllArt()
    }

// MARK: DATASOURCE
    //hoeveel rijen in de tabel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artWorks.count
    }
    
// MARK: DELEGATE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //verwijs naar cel in table view om te kunnen hergebruiken
        let cell = tableView.dequeueReusableCell(withIdentifier: "artcell", for: indexPath) as! ArtTableViewCell
        //object voor de gepaste rij uit de datasource halen
        let art = artWorks[indexPath.row]
        //vul de cel in met de gegevens uit klasse
        cell.artTitleLbl.text = art.title
        cell.artDescrLbl.text = art.creator
        //geef cel weer
        return cell
    }
    
//MARK: NAVIGATE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //nakijken of de segue de juiste is
        if segue.identifier == "showDetailSegue" {
            //welke cel is de sender
            let cellToDetail = sender as! UITableViewCell
            //op welke rij in de tabel staat cel
            let indexPath = tableView.indexPath(for: cellToDetail)!
            //welk object zat in de cel
            let art = artWorks[indexPath.row]
            //verwijzing maken naar bestemming van segue
            let destinationVC = segue.destination as! DetailViewController
            //stuur de gegevens door naar de view controller
            destinationVC.artToDetail = art
        }
    }
}
