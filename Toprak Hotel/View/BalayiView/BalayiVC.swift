//
//  BalayiVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 3.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

import SVProgressHUD


class BalayiVC: UIViewController {
    @IBOutlet weak var isimTF: UITextField!
    
    @IBOutlet weak var tarihTF: UITextField!
    
    @IBOutlet weak var telefonTF: UITextField!
    
    @IBOutlet weak var mailTF: UITextField!
    
    @IBAction func gonderBTN(_ sender: Any) {
        
        let url = "https://api.sendgrid.com/api/mail.send.json?api_user=eyup.akky&api_key=2255629_Eyup&to=sales@ekinatagrandtoprakhotel.com&toname=Ekinata Grand Toprak Hotel&subject=Balayı İçin Rezervasyon. İsim : \(isimTF.text!), Tarih:\(tarihTF.text!), Telefon: \(telefonTF.text!), Mail : \(mailTF.text!)&from=\(mailTF.text!)"
        
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(encodedUrl!, method: .get).responseJSON { response  in
            
            switch response.result {
                
            case .success(let value):
                
                let json = JSON(value)
                
                print(json["message"])
                
                if json["message"].stringValue == "success"{
                    
                    SVProgressHUD.showSuccess(withStatus: "Bilgileriniz iletildi. Ekip arkadaşlarımız size en kısa zamanda ulaşacaktır.")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0 , execute: {
                        
                        SVProgressHUD.dismiss()
                        
                        self.performSegue(withIdentifier: "MainNavVC", sender: self)
                        
                    })
                }
                
            case .failure(let error):
                
                print(error)
                
            }
            
        }
    }
    @IBOutlet weak var gonderBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //Navigation Controller Transparent
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage() , for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        //Navigation Controller Transparent End
        
        let logo = UIImage(named: "ekinataLogo.png")
        
        let imageView = UIImageView(image:logo)
        
        self.navigationItem.titleView = imageView
        
    }


}
