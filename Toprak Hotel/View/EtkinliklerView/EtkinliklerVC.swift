//
//  EtkinliklerVC.swift
//  Toprak Hotel
//
//  Created by birkan demiral on 7.01.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

var text = ""

var img = ""

class EtkinliklerVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let etkinlikImageArray = ["e1.jpg","e2.jpg","e3.jpg","e4.jpg"]
    
    let etkinlikNameArray = ["Kayak - Snowboard", "SPA", "Ani - Çıldır Turu","Çocuk Kulübü"]
    
    let etkinlikDescArray = ["Kars Havaalanına 40 dk uzaklıktaki kayak merkezimizde sadece 2.100-2.700 metre arasında yetişen tek tür olan sarıçamlarla kaplı dünyadaki tek pist olan Sarıkamış'ta dünyada eşine nadir rastlanan kristal karüzerinde eşsiz manzaraya karşı benzersiz biz kayak keyfi yaşayabilirsiniz.Aynı zamanda Grand Toprak Otel'in kayak merkezinde size sunduğu ekipman kiralama, kayak kursları vb. olanaklarıyla kusursuz bir kayak deneyimi sizleri bekliyor.","Grand Toprak Otel, tam donanımlı SPA merkezi ile yaşamın stresini geride bırakıp, ruhunuzu vebedeninizi yenilemek için suyun dinlendirici etkisini hissetmenizi sağlıyor. İşinin ehli uzmanlarımızın yapacağı masajlar, bedensel yorgunluğunuzu atmanızı sağlarken, ruhunuza da zindelik kazandırıyor. Sarıkamış'ın bembeyaz kristal karlarla örtülü manzarasına hakim ısıtmalı kapalı havuzunda, saunada,fitness merkezinde kendinize sağlık, güzellik ve iyilik katın.","GRAND TOPRAK OTEL, sizleri Ermenistan sınırında UNESCO DÜNYA KÜLTÜR MİRASI Listesi'nde bulunan Ani Tarihi Arkeolojik Alanı'nın ve 2000 metredeki buz tutmuş Çıldır gölünün muhteşem manzarasına tanık ediyor. Gün içerisindeki turlarımızla ve deneyimli rehberlerimizle Ani Harabeleri'nde kendinizi tarihin içinde hissetmeye ve Çıldır'da buz tutmuş gölde at arabalarıyla benzersiz bir geziye hazır olun..","Grand Toprak Otel, çocuklarınız için de birbirinden eğlenceli imkanlar sağlayarak, çocuklarınızın güzel bir tatil geçirmesine olanak sağlıyor. Çocuklarınız eğlenirken siz de Grand Toprak Otel'in sizlere sunduğu diğer hizmetlerin tadını çıkarın."]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return etkinlikNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EtkinliklerTVC
        
        cell.img.image = UIImage(named: etkinlikImageArray[indexPath.row])
        
        cell.img.layer.cornerRadius = 15.0
        
        cell.img.clipsToBounds = true
        
        cell.nameLBL.text = etkinlikNameArray[indexPath.row]
        
        cell.descLBL.text = etkinlikDescArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        text = etkinlikDescArray[indexPath.row]
        
        img = etkinlikImageArray[indexPath.row]
        
        
        
        let goVC = self.storyboard?.instantiateViewController(withIdentifier: "EtkinlikDetayNavVC") as! EtkinlikDetayNavVC
        self.present(goVC,animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
