//
//  mainTopTVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 1.03.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import ImageSlideshow

class mainTopTVC: UITableViewCell {

    @IBOutlet weak var ImageSlider: ImageSlideshow!
    
    
    let localSource = [ImageSource(imageString: "1.png")!, ImageSource(imageString: "2.png")!, ImageSource(imageString: "3.png")!, ImageSource(imageString: "4.png")!, ImageSource(imageString: "5.png")!, ImageSource(imageString: "6.png")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        
        //Image Slider END
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
