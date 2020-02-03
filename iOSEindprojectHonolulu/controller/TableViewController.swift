//
//  TableViewController.swift
//  iOSEindprojectHonolulu
//
//  Created by mobapp02 on 29/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var artWorks = [PublicArt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artWorks = PublicArtDAO.sharedInstance.getAllArt()
        
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

extension TableViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "artcell", for: indexPath) as! ArtTableViewCell
        
        let art = artWorks[indexPath.row]
        
        cell.artTitleLbl.text = art.title
        
        return cell
        
    }
}
