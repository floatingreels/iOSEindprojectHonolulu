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
    @IBOutlet weak var creatorDateLbl: UILabel!
    @IBOutlet weak var accessLbl: UILabel!
    @IBOutlet weak var disciplineLbl: UILabel!
    @IBOutlet weak var detailsTV: UITextView!
    
    
    var artToDetail:PublicArt?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = artToDetail?.title
        creatorDateLbl.text = "\(artToDetail!.creator), \(artToDetail!.date)"
        accessLbl.text = artToDetail?.access
        disciplineLbl.text = artToDetail?.discipline
        detailsTV.text = artToDetail?.details
        
    }
}
