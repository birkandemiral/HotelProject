//
//  OdalarTVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 3.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class OdalarTVC: UITableViewCell {

    @IBOutlet weak var roomType: UILabel!
    
    @IBOutlet weak var roomDescription: UILabel!
    
    @IBOutlet weak var roomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
