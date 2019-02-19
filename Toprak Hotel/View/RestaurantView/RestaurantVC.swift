//
//  RestaurantVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 3.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import ImageSlideshow

class RestaurantVC: UIViewController {

    @IBOutlet weak var Slider: ImageSlideshow!
    
        let localSourceRest = [ImageSource(imageString: "1r.jpg")!, ImageSource(imageString: "2r.jpg")!, ImageSource(imageString: "3r.jpg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        Slider.setImageInputs(localSourceRest)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MainVC.didTap))
        Slider.addGestureRecognizer(recognizer)
        
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
