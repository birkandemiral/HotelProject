//
//  ViewController.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 2.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class GirisVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0, execute: {
            
            self.performSegue(withIdentifier: "MainNavVC", sender: self)
            
        })

    }
    
    override var prefersStatusBarHidden: Bool{
        
        return true
        
    }


}

