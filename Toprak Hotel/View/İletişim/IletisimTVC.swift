//
//  IletisimTVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 9.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit
import GoogleMaps

class IletisimTVC: UITableViewCell {

    @IBOutlet weak var mapView: GMSMapView!
    

    @IBAction func facebook(_ sender: Any) {
        
        let Username =  "ekinatatoprakhotel" // Your Instagram Username here
        let appURL = URL(string: "fb://profile/\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://www.facebook.com/ekinatatoprakhotel/")!
            application.open(webURL)
        }

        
    }
    @IBAction func instagram(_ sender: Any) {
        

        let Username =  "ekinatagrandtoprak" // Your Instagram Username here
        let appURL = URL(string: "instagram://user?username=\(Username)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(Username)")!
            application.open(webURL)
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        GMSServices.provideAPIKey("AIzaSyDTw2kY9MlUQjsMcQYaucofMgEOOPhUWwk")
        
        let coord = CLLocationCoordinate2D(latitude: 40.320846, longitude: 42.61567)
        
        mapView.camera = GMSCameraPosition(target: coord, zoom: 18.0, bearing: 0, viewingAngle: 0)
        
        let marker = GMSMarker()
        marker.icon = UIImage(named: "ImageToSet")
        
        marker.appearAnimation = GMSMarkerAnimation(rawValue: 1)!
        marker.position = coord
        marker.title = "Türkiye"
        marker.snippet = "Kars"
        marker.map = mapView
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
