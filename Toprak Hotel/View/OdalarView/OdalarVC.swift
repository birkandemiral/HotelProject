//
//  OdalarVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 3.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import SVProgressHUD

class OdalarVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let testImageArray = ["standart.jpg","junior.jpg","standart.jpg","junior.jpg","junior.jpg"]
    
    let roomNameArray = ["Standart Oda","Köşe Oda","Junior Suit","Suit Oda","King Suit  Oda"]
    
    let roomDescriptionArray = ["118 adet standart oda mevcut olup daireler 32 m2 ‘dir. Otelimizin standart ve connection odaları konforlu ve rahat bir şekilde konaklamanız için dizayn edilmiş olup tek oda ve tek banyodan oluşmaktadır ve connection odalar 2 standart odanın ara kapı ile birleşmesinden oluşmaktadır. Standart odalarımızda çift kişilik yatak, 2 adet tek kişilik yatak bulunmakta olup yatak ilavesiyle 3 kişiye kadar konaklama yapılabilir. Odalar otelin dağ ve pist tarafına cephe olup, yaklaşık 32 metrekareden oluşmaktadır ve toplamda 118 standart, 11 connection odamız mevcuttur. Standart Odalarımızda tv, uydu yayını, balkon, oturma grubu, yangın alarm sistemi, müzik yayını, kasa, mini bar ve banyoda saç kurutma makinesi, küvet, telefon mevcuttur. Oda zemini halı ile kaplıdır. Oda temizliği günlük olarak yapılmaktadır. Otelimizde sigara içilmeyen odalarımız mevcuttur. Odalardaki internet erişimi kablosuz olup, klima sistemi ise merkezi olarak çalışmaktadır. Mini bar günlük olarak doldurulmaktadır.","En az 2 yetişkin, en fazla 4 yetişkin ya da 3 yetişkin + 1 çocuk şeklinde konaklanabilir. 11 adet Köşe Oda mevcuttur. Standart odalardaki tüm özelliklere sahip 2 ayrı oda toplam 65 m² dir ( yatak odası + oturma odası ), maksimum konaklama 5 pax, tv, mutfak, yemek masası, oturma grubu, 1 adet wc, küvetli banyo, telefon, saç kurutma makinesi bulunmaktadır. Oda temizliği günlük olarak yapılmaktadır. Otelimizde sigara içilmeyen odalarımız mevcuttur. Odalardaki internet erişimi kablosuz olup, klima sistemi ise merkezi olarak çalışmaktadır. Mini bar günlük olarak doldurulmaktadır.","En az 2 yetişkin, en fazla 4 yetişkin ya da 3 yetişkin + 1 çocuk şeklinde konaklanabilir. 6 adet Junior Suit oda mevcuttur. Standart odalardaki tüm özelliklere sahip 2 ayrı oda toplam 65 m² dir ( yatak odası + oturma odası ), maksimum konaklama 5 pax, tv, mutfak, yemek masası, oturma grubu, 1 adet wc, küvetli banyo, telefon, saç kurutma makinesi bulunmaktadır. Oda temizliği günlük olarak yapılmaktadır. Otelimizde sigara içilmeyen odalarımız mevcuttur. Odalardaki internet erişimi kablosuz olup, klima sistemi ise merkezi olarak çalışmaktadır. Mini bar günlük olarak doldurulmaktadır.","5 adet suit oda mevcut olup daireler 60m2’dir. Suit odalarımız 1 adet yatak odası ve 1 adet salondan oluşmakta olup olup 6 kişiye kadar konaklama imkanı vardır. Odalar pist ve dağ tarafına cephe olup, yaklaşık 65 metrekareden oluşmaktadır ve toplamda 5 suit odamız mevcuttur.Suit odalarımızda 1’i plazma 2 adet tv, uydu yayını, merkezi ısıtma, kasa, mini bar, mutfak, deri oturma grubu, yemek masası ve banyoda saç kurutma makinesi, duşa kabin, jakuzi mevcuttur. Oda zemini halı ile kaplıdır. Oda temizliği günlük olarak yapılmaktadır. Otelimizde sigara içilmeyen odalarımız mevcuttur. Odalardaki internet erişimi kablosuz olup, klima sistemi ise merkezi olarak çalışmaktadır. Mini bar günlük olarak doldurulmaktadır.","En az 2 yetişkin, en fazla 4 yetişkin ya da 3 yetişkin + 1 çocuk şeklinde konaklanabilir. 4 adet Kral Suit oda mevcuttur. Standart odalardaki tüm özelliklere sahip 2 ayrı oda toplam 65 m² dir ( yatak odası + oturma odası ), maksimum konaklama 5 pax, tv, mutfak, yemek masası, oturma grubu, 1 adet wc, küvetli banyo, telefon, saç kurutma makinesi bulunmaktadır.Oda temizliği günlük olarak yapılmaktadır. Otelimizde sigara içilmeyen odalarımız mevcuttur. Odalardaki internet erişimi kablosuz olup, klima sistemi ise merkezi olarak çalışmaktadır. Mini bar günlük olarak doldurulmaktadır."]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OdalarTVC
        
        cell.roomType.text = roomNameArray[indexPath.row]
        
        cell.roomDescription.text = roomDescriptionArray[indexPath.row]
        
        cell.roomImage.image = UIImage(named: testImageArray[indexPath.row])
        
        cell.roomImage.layer.cornerRadius = 20.0
        
        cell.roomImage.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        roomImage = testImageArray[indexPath.row]
        
        roomName = roomNameArray[indexPath.row]
        
        print("selectedRow = \(indexPath.row)")
        
        let goVC = self.storyboard?.instantiateViewController(withIdentifier: "rezervasyonNavVC") as! rezervasyonNavVC
        self.present(goVC,animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.dismiss()
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        

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


}
