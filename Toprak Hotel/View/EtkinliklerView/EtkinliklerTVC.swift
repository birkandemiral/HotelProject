//
//  EtkinliklerTVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 7.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class EtkinliklerTVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nameLBL: UILabel!
    
    @IBOutlet weak var descLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
