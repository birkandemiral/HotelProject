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
        
        return imageArray.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! mainTopTVC
            
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! mainBottomTVC
            
            cell.icon.image = UIImage(named: imageArray[indexPath.row - 1])
            
            cell.label.text = buttonArray[indexPath.row - 1]
            
            return cell
            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 275
        }
        else{
        
            return 80
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SVProgressHUD.show(withStatus: "Yükleniyor...")

        if indexPath.row == 1 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "OdalarNavVC") as! OdalarNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 2 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "RestaurantNavVC") as! RestaurantNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 3{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "ToplantiNavVC") as! ToplantiNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 4{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "BalayiNavVC") as! BalayiNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 6{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "EtkinliklerNavVC") as! EtkinliklerNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 7 {
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "KayakMerkeziNavVC") as! KayakMerkeziNavVC
            self.present(goVC,animated: true)
            
        }else if indexPath.row == 8{
            
            let goVC = self.storyboard?.instantiateViewController(withIdentifier: "IletisimNavVC") as! IletisimNavVC
            self.present(goVC,animated: true)
            
        }
    }
        

    
    @IBOutlet weak var tableView: UITableView!

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
        
        
        tableView.register(UINib(nibName: "mainTopTVC", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.register(UINib(nibName: "mainBottomTVC", bundle: nil), forCellReuseIdentifier: "cell2 ")
        
        
    }
    override var prefersStatusBarHidden: Bool{
        
        return true
        
    }

    
}
