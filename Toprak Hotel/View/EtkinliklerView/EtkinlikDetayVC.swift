//
//  EtkinlikDetayVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 8.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit


class EtkinlikDetayVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text
        
        image.image = UIImage(named: img)

        //Navigation Controller Transparent
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage() , for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        //Navigation Controller Transparent End
        
        let logo = UIImage(named: "ekinataLogo.png")
        
        let imageView = UIImageView(image:logo)
        
        self.navigationItem.titleView = imageView
        
    }
    override var prefersStatusBarHidden: Bool{
        
        return true
        
    }
}
