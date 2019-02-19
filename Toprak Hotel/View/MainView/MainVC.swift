//
//  MainVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 2.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import ImageSlideshow

import SVProgressHUD

let imageArray = ["calendarWithAClockTimeTools","cooking","toplanti","balayi","gallery","Etkinlikler","kayakMerkezi","iletisim"]

let buttonArray = ["Rezervasyon","Restaurantlar","Toplantı Salonu","Balayı", "Galeri","Etkinlikler","Kayak Merkezi","İletişim"]

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTVC
        
        cell.icon.image = UIImage(named: imageArray[indexPath.row])
        
        cell.label.text = buttonArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SVProgressHUD.show(withStatus: "Yükleniyor...")

        if indexPath.row == 0 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "OdalarNavVC") as! OdalarNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 1 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantNavVC") as! RestaurantNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 2{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "ToplantiNavVC") as! ToplantiNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 3{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "BalayiNavVC") as! BalayiNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 5{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "EtkinliklerNavVC") as! EtkinliklerNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 6 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "KayakMerkeziNavVC") as! KayakMerkeziNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 7{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "IletisimNavVC") as! IletisimNavVC
            self.present(goVC,animated: true)
            
        }
    }
        

    @IBOutlet weak var ImageSlider: ImageSlideshow!
    
    @IBOutlet weak var tableView: UITableView!
    
    let localSource = [ImageSource(imageString: "1.png")!, ImageSource(imageString: "2.png")!, ImageSource(imageString: "3.png")!, ImageSource(imageString: "4.png")!, ImageSource(imageString: "5.png")!, ImageSource(imageString: "6.png")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Image Slider
        
        ImageSlider.slideshowInterval = 5.0
        
        ImageSlider.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        
        ImageSlider.contentScaleMode = UIView.ContentMode.scaleToFill
        
        let pageControl = UIPageControl()
        
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        
        pageControl.pageIndicatorTintColor = UIColor.white
        
        ImageSlider.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        ImageSlider.activityIndicator = DefaultActivityIndicator()
        ImageSlider.currentPageChanged = { page in
        }
        
        ImageSlider.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MainVC.didTap))
        ImageSlider.addGestureRecognizer(recognizer)
        
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
        let fullScreenController = ImageSlider.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
}
