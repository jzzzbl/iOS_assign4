//
//  GuideVC.swift
//  iOS_assign4
//
//  Created by Jezebel Torres on 2020-04-08.
//  Copyright © 2020 Sandra Mannila. All rights reserved.
//

import Foundation
import UIKit

class GuideVC: UIViewController {
    
    let theNum = ModelData.shared.num
    
    let backBtn = UIButton(frame: CGRect(x: 28, y: 20, width: 90, height: 30))
    
    let heading = UILabel(frame: CGRect(x: 28, y: 55, width: 350, height: 50))
    let subheading = UILabel(frame: CGRect(x: 28, y: 80, width: 350, height: 80))
    let desc = UILabel(frame: CGRect(x: 28, y: 150, width: 350, height: 150))
    
    let generalBtn = UIButton(frame: CGRect(x: 28, y: 320, width: 170, height: 30))
    let propogateBtn = UIButton(frame: CGRect(x: 205, y: 320, width: 170, height: 30))
    
    let waterH = UILabel(frame: CGRect(x: 28, y: 360, width: 350, height: 50))
    let waterDS = UILabel(frame: CGRect(x: 28, y: 400, width: 350, height: 100))
    let wtpH = UILabel(frame: CGRect(x: 28, y: 510, width: 350, height: 50))
    let wtpDS = UILabel(frame: CGRect(x: 28, y: 545, width: 350, height: 140))
    let pairH = UILabel(frame: CGRect(x: 28, y: 700, width: 350, height: 50))
    let pairDS = UILabel(frame: CGRect(x: 28, y: 725, width: 350, height: 60))
   
    let propoT = UILabel(frame: CGRect(x: 28, y: 360, width: 350, height: 50))
    let propoGD = UILabel(frame: CGRect(x: 28, y: 400, width: 350, height: 75))
    let propoH = UILabel(frame: CGRect(x: 28, y: 475, width: 350, height: 50))
    let propoDS = UILabel(frame: CGRect(x: 28, y: 515, width: 350, height: 140))
    let propoH2 = UILabel(frame: CGRect(x: 28, y: 650, width: 350, height: 50))
    let propoDS2 = UILabel(frame: CGRect(x: 28, y: 680, width: 350, height: 130))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        backBtn.backgroundColor = .clear
        backBtn.layer.borderWidth = 1.2
        backBtn.layer.borderColor = UIColor.gray.cgColor
        backBtn.setTitle("< Back", for: .normal)
        backBtn.setTitleColor(.gray, for: .normal)
        backBtn.layer.cornerRadius = 15
        backBtn.addTarget(self, action: #selector(backBtnClick(_:)), for: .touchUpInside)

        heading.font = .boldSystemFont(ofSize: 24)

        subheading.numberOfLines = 2
        subheading.font = .italicSystemFont(ofSize: 17)
        subheading.textColor = .darkGray

        desc.numberOfLines = 0
        desc.adjustsFontSizeToFitWidth = true
        desc.minimumScaleFactor = 0.4

        generalBtn.backgroundColor = .systemPink
        generalBtn.layer.borderWidth = 1.2
        generalBtn.setTitle("General Care", for: .normal)
        generalBtn.layer.borderColor = UIColor.systemPink.cgColor
        generalBtn.setTitleColor(.white, for: .normal)
        generalBtn.layer.cornerRadius = 5
        generalBtn.addTarget(self, action: #selector(generalBtnClick(_:)), for: .touchUpInside)

        propogateBtn.backgroundColor = .clear
        propogateBtn.layer.borderWidth = 1.2
        propogateBtn.setTitle("Propogate Info", for: .normal)
        propogateBtn.setTitleColor(.gray, for: .normal)
        propogateBtn.layer.borderColor = UIColor.gray.cgColor
        propogateBtn.layer.cornerRadius = 5
        propogateBtn.addTarget(self, action: #selector(propogateBtnClick(_:)), for: .touchUpInside)

        waterH.font = .boldSystemFont(ofSize: 17)
        waterH.tag = 1

        waterDS.numberOfLines = 0
        waterDS.adjustsFontSizeToFitWidth = true
        waterDS.minimumScaleFactor = 0.4
        waterDS.tag = 2

        wtpH.font = .boldSystemFont(ofSize: 17)
        wtpH.tag = 3

        wtpDS.numberOfLines = 0
        wtpDS.adjustsFontSizeToFitWidth = true
        wtpDS.minimumScaleFactor = 0.4
        wtpDS.tag = 4
        
        pairH.font = .boldSystemFont(ofSize: 17)
        pairH.tag = 5
               
        pairDS.numberOfLines = 0
        pairDS.tag = 6
        
        propoT.font = .boldSystemFont(ofSize: 17)
        propoT.tag = 7
        
        propoGD.numberOfLines = 0
        propoGD.adjustsFontSizeToFitWidth = true
        propoGD.minimumScaleFactor = 0.4
        propoGD.tag = 8

        propoH.font = .boldSystemFont(ofSize: 17)
        propoH.tag = 9
        
        propoDS.numberOfLines = 0
        propoDS.adjustsFontSizeToFitWidth = true
        propoDS.minimumScaleFactor = 0.4
        propoDS.tag = 10
        
        propoH2.font = .boldSystemFont(ofSize: 17)
        propoH2.tag = 11
        
        propoDS2.numberOfLines = 0
        propoDS2.adjustsFontSizeToFitWidth = true
        propoDS2.minimumScaleFactor = 0.4
        propoDS2.tag = 12
        
        
        
        
        view.addSubview(backBtn)
        view.addSubview(heading)
        view.addSubview(subheading)
        view.addSubview(desc)
        
        view.addSubview(generalBtn)
        view.addSubview(propogateBtn)
        
        view.addSubview(waterH)
        view.addSubview(waterDS)
        view.addSubview(wtpH)
        view.addSubview(wtpDS)
        view.addSubview(pairH)
        view.addSubview(pairDS)
        
        let database = RealtimeDB()
        
        database.get(leaf: "option\(theNum)/details/care-guide/") {(imageDictionary) in
            
            let htext = imageDictionary["heading"] as? String
            self.heading.text = htext
            
            let shtext = imageDictionary["subhead"] as? String
            self.subheading.text = shtext
            
            let dtext = imageDictionary["desc"] as? String
            self.desc.text = dtext
            
        }
        database.get(leaf: "option\(theNum)/details/care-guide/watering/") {(imageDictionary) in
            
            let htext = imageDictionary["heading"] as? String
            self.waterH.text = htext
            
            let dtext = imageDictionary["desc"] as? String
            self.waterDS.text = dtext
            
        }
        database.get(leaf: "option\(theNum)/details/care-guide/where-to-plant/") {(imageDictionary) in
            
            let htext = imageDictionary["heading"] as? String
            self.wtpH.text = htext
            
            let dtext = imageDictionary["desc"] as? String
            self.wtpDS.text = dtext
            
        }
        database.get(leaf: "option\(theNum)/details/care-guide/pairs/") {(imageDictionary) in
            
            let htext = imageDictionary["heading"] as? String
            self.pairH.text = htext
            
            let dtext = imageDictionary["desc"] as? String
            self.pairDS.text = dtext
            
        }
        database.get(leaf: "option\(theNum)/details/care-guide/propogate/") {(imageDictionary) in
            
            let title = imageDictionary["title"] as? String
            self.propoT.text = title
            
            let gdesc = imageDictionary["gdesc"] as? String
            self.propoGD.text = gdesc
            
            let htext = imageDictionary["heading"] as? String
            self.propoH.text = htext
            
            let dtext = imageDictionary["desc"] as? String
            self.propoDS.text = dtext
            
            let htext2 = imageDictionary["heading2"] as? String
            self.propoH2.text = htext2
            
            let dtext2 = imageDictionary["desc2"] as? String
            self.propoDS2.text = dtext2
            
        }
    }
    
    @objc func backBtnClick(_ sender:UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    @objc func generalBtnClick(_ sender:UIButton!) {
        generalBtn.backgroundColor = .systemPink
        generalBtn.layer.borderColor = UIColor.systemPink.cgColor
        generalBtn.setTitleColor(.white, for: .normal)
        propogateBtn.backgroundColor = .clear
        propogateBtn.setTitleColor(.gray, for: .normal)
        propogateBtn.layer.borderColor = UIColor.gray.cgColor
        
       view.addSubview(waterH)
        view.addSubview(waterDS)
        view.addSubview(wtpH)
        view.addSubview(wtpDS)
        view.addSubview(pairH)
        view.addSubview(pairDS)
        
        if let subview = self.view.viewWithTag(7){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(8){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(9){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(10){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(11){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(12){
        subview.removeFromSuperview()
        }
    }
    @objc func propogateBtnClick(_ sender:UIButton!) {
        propogateBtn.backgroundColor = .systemPink
        propogateBtn.layer.borderColor = UIColor.systemPink.cgColor
        propogateBtn.setTitleColor(.white, for: .normal)
        generalBtn.backgroundColor = .clear
        generalBtn.setTitleColor(.gray, for: .normal)
        generalBtn.layer.borderColor = UIColor.gray.cgColor
        
        view.addSubview(propoT)
        view.addSubview(propoGD)
        view.addSubview(propoH)
        view.addSubview(propoDS)
        view.addSubview(propoH2)
        view.addSubview(propoDS2)
        
        if let subview = self.view.viewWithTag(1){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(2){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(3){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(4){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(5){
        subview.removeFromSuperview()
        }
        if let subview = self.view.viewWithTag(6){
        subview.removeFromSuperview()
        }
        
        
    }
}
