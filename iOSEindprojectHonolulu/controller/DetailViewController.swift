//
//  DetailViewController.swift
//  iOSEindprojectHonolulu
//
//  Created by Josine Buggenhout on 03/02/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var creatorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var accessLbl: UILabel!
    @IBOutlet weak var disciplineLbl: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    
    var artToDetail:PublicArt?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labels invullen met gegevens uit andere view controllers
        titleLbl.text = artToDetail?.title
        creatorLbl.text = artToDetail?.creator
        dateLbl.text = artToDetail?.date
        accessLbl.text = "Access: \(artToDetail!.access)"
        disciplineLbl.text = "Type: \(artToDetail!.discipline)"
        detailsTV.text = artToDetail?.details
    }
}
