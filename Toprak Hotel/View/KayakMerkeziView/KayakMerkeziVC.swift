//
//  KayakMerkeziVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 9.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import ImageSlideshow

class KayakMerkeziVC: UIViewController {


    @IBOutlet weak var imageViewKM: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localSource = [ImageSource(imageString: "SkiMap.jpg")!]
        
        // Image Slider
        
        imageViewKM.slideshowInterval = 5.0
        
        imageViewKM.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        
        imageViewKM.contentScaleMode = UIView.ContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        
        pageControl.pageIndicatorTintColor = UIColor.white
        
        imageViewKM.pageIndicator = pageControl
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        imageViewKM.activityIndicator = DefaultActivityIndicator()
        imageViewKM.currentPageChanged = { page in
        }
        
        imageViewKM.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MainVC.didTap))
        imageViewKM.addGestureRecognizer(recognizer)
        
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
        let fullScreenController = imageViewKM.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

}
