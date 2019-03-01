//
//  ToplantıVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 3.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import ImageSlideshow

import Alamofire

import SwiftyJSON

import SVProgressHUD

class ToplantiVC: UIViewController {

    @IBOutlet weak var isimTF: UITextField!
    @IBOutlet weak var tarihTF: UITextField!
    @IBOutlet weak var telefonTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    
    @IBAction func gonderBTN(_ sender: Any) {
        
        let url = "https://api.sendgrid.com/api/mail.send.json?api_user=eyup.akky&api_key=2255629_Eyup&to=sales@ekinatagrandtoprakhotel.com&toname=Ekinata Grand Toprak Hotel&subject=Toplantı Salonu İçin Rezervasyon. İsim : \(isimTF.text!), Tarih:\(tarihTF.text!), Telefon: \(telefonTF.text!), Mail : \(mailTF.text!)&from=\(mailTF.text!)"
        
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
    
    @IBOutlet weak var Slider: ImageSlideshow!
    
    let localSourceToplanti = [ImageSource(imageString: "1r.jpg")!, ImageSource(imageString: "2r.jpg")!, ImageSource(imageString: "3r.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        // Image Slider
        
        Slider.slideshowInterval = 5.0
        
        Slider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        
        Slider.contentScaleMode = UIView.ContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        
        pageControl.pageIndicatorTintColor = UIColor.white
        
        Slider.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        Slider.activityIndicator = DefaultActivityIndicator()
        Slider.currentPageChanged = { page in
        }
        
        Slider.setImageInputs(localSourceToplanti)
        
        //Image Slider END

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
    
    @objc func didTap() {
        let fullScreenController = Slider.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
