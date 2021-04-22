//
//  optionsController.swift
//  assign3
//
//  Created by Jezebel Torres on 2020-04-03.
//  Copyright © 2020 Jezebel Torres. All rights reserved.
//

import Foundation
import UIKit

class DetailVC: UIViewController {

    let theNum = ModelData.shared.num
    
    let backBtn = UIButton(frame: CGRect(x: 28, y:30, width: 90, height: 30))
    let heading = UILabel(frame: CGRect(x: 28, y: 70, width: 350, height: 50))
    let subheading = UILabel(frame: CGRect(x: 28, y: 100, width: 350, height: 50))
    let desc = UILabel(frame: CGRect(x: 28, y: 560, width: 350, height: 180))
    let careBtn = UIButton(frame: CGRect(x: 28, y: 770, width: 350, height: 40))

    let imageView = UIImageView(frame: CGRect(x: 28, y: 150, width: 350, height: 400))
    
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
        
        heading.numberOfLines = 2
        heading.font = .boldSystemFont(ofSize: 24)
        
        subheading.font = .italicSystemFont(ofSize: 17)
        subheading.textColor = .darkGray
        
        desc.numberOfLines = 11
        desc.adjustsFontSizeToFitWidth = true
        desc.minimumScaleFactor = 0.9
        
        careBtn.backgroundColor = .systemPink
        careBtn.setTitle("View Care Guide", for: .normal)
        careBtn.layer.cornerRadius = 10
        careBtn.addTarget(self, action: #selector(careBtnClick(_:)), for: .touchUpInside)
        
        view.addSubview(backBtn)
        view.addSubview(heading)
        view.addSubview(subheading)
        view.addSubview(imageView)
        view.addSubview(desc)
        view.addSubview(careBtn)
        
        let database = RealtimeDB()
        
        database.get(leaf: "option\(theNum)/details/") {(imageDictionary) in
            
            let htext = imageDictionary["heading"] as? String
            self.heading.text = htext
            
            let shtext = imageDictionary["subhead"] as? String
            self.subheading.text = shtext
            
            let dtext = imageDictionary["desc"] as? String
            self.desc.text = dtext
            
            let backgroundURL = imageDictionary["image"] as? String
        
            guard let url = URL(string: backgroundURL!) else{
                return
            }
            
            let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
                
            guard let data = data else {
                print(response)
                print(error)
                return
            }
                
            let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
             }
            
            dataTask.resume()
        }

    }
    
    @objc func backBtnClick(_ sender:UIButton!) {
        dismiss(animated: true, completion: nil)
        ModelData.shared.num = 0
    }
    @objc func careBtnClick(_ sender:UIButton!) {
        present(GuideVC(), animated: true, completion: nil)

    }
}
