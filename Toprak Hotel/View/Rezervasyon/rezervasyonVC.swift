//
//  rezervasyonVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 15.02.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

import SVProgressHUD

var roomImage = ""

var roomName = ""

class rezervasyonVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var tarihTF: UITextField!
    
    @IBOutlet weak var telefonTF: UITextField!
    
    @IBOutlet weak var mailTF: UITextField!
    
    @IBAction func gonderBTN(_ sender: Any) {
        
        let url = "https://api.sendgrid.com/api/mail.send.json?api_user=eyup.akky&api_key=2255629_Eyup&to=sales@ekinatagrandtoprakhotel.com&toname=Ekinata Grand Toprak Hotel&subject=Oda Rezervasyonu&text=\(roomName) İçin Rezervasyon. İsim : \(nameTF.text!), Tarih:\(tarihTF.text!), Telefon: \(telefonTF.text!), Mail : \(mailTF.text!)&from=\(mailTF.text!)"
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: roomImage)
        
        
        
        //Navigation Controller Transparent
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage() , for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        //Navigation Controller Transparent End
        
        let logo = UIImage(named: "ekinataLogo.png")
        
        let imageView = UIImageView(image:logo)
        
        self.navigationItem.titleView = imageView

        // Do any additional setup after loading the view.
    }

    

}
