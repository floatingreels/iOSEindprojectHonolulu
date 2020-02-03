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

        artWorks = PublicArtDAO.sharedInstance.getAllArt()
    }


// MARK: DATASOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artWorks.count
    }
    
// MARK: DELEGATE
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artcell", for: indexPath) as! ArtTableViewCell
        let art = artWorks[indexPath.row]
        
        cell.artTitleLbl.text = art.title
        cell.artDescrLbl.text = art.creator
        
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
            //wat is de bestemming van de segue
            let detailVC = segue.destination as! DetailViewController
            //de gegevens doorsturen
            detailVC.artToDetail = art
        }
    }
}
