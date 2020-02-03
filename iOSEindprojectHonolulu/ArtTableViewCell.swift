//
//  ArtTableViewCell.swift
//  iOSEindprojectHonolulu
//
//  Created by Josine Buggenhout on 03/02/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class ArtTableViewCell: UITableViewCell {

    @IBOutlet weak var artTitleLbl: UILabel!
    
    @IBOutlet weak var artDescrLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
