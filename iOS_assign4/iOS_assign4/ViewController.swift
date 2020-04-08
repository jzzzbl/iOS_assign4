//
//  ViewController.swift
//  iOS_assign4
//
//  Created by Sandra Mannila on 2020-03-26.
//  Copyright © 2020 Sandra Mannila. All rights reserved.
//

import UIKit

class ModelData: NSObject {
    static let shared: ModelData = ModelData()
    var num = 0
}

class ViewController: UIViewController {
    let heading = UILabel(frame: CGRect(x: 28, y: 60, width: 350, height: 50))
    let subhead = UILabel(frame: CGRect(x: 28, y: 98, width: 350, height: 50))
    
    let imageView1 = UIImageView(frame: CGRect(x: 28, y: 160, width: 170, height: 180))
    let itemName1 = UILabel(frame: CGRect(x: 28, y: 335, width: 170, height: 50))
    let itemBtn1 = UIButton(frame: CGRect(x: 28, y: 160, width: 170, height: 220))
    
    let imageView2 = UIImageView(frame: CGRect(x: 215, y: 160, width: 170, height: 180))
    let itemName2 = UILabel(frame: CGRect(x: 215, y: 335, width: 170, height: 50))
    let itemBtn2 = UIButton(frame: CGRect(x: 215, y: 160, width: 170, height: 220))
 
    let imageView3 = UIImageView(frame: CGRect(x: 28, y: 405, width: 170, height: 180))
    let itemName3 = UILabel(frame: CGRect(x: 28, y: 580, width: 170, height: 50))
    let itemBtn3 = UIButton(frame: CGRect(x: 28, y: 405, width: 170, height: 220))
    
    let imageView4 = UIImageView(frame: CGRect(x: 215, y: 405, width: 170, height: 180))
    let itemName4 = UILabel(frame: CGRect(x: 215, y: 580, width: 170, height: 50))
    let itemBtn4 = UIButton(frame: CGRect(x: 215, y: 405, width: 170, height: 220))
    
    let imageView5 = UIImageView(frame: CGRect(x: 28, y: 650, width: 170, height: 180))
    let itemName5 = UILabel(frame: CGRect(x: 28, y: 825, width: 170, height: 50))
    let itemBtn5 = UIButton(frame: CGRect(x: 28, y: 650, width: 170, height: 220))
    
    let imageView6 = UIImageView(frame: CGRect(x: 215, y: 650, width: 170, height: 180))
    let itemName6 = UILabel(frame: CGRect(x: 215, y: 825, width: 170, height: 50))
    let itemBtn6 = UIButton(frame: CGRect(x: 215, y: 650, width: 170, height: 220))
    
   override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white
    
    heading.text = "Succulent Care Guides"
    heading.numberOfLines = 2
    heading.font = .boldSystemFont(ofSize: 24)
    heading.textAlignment = .center
    
    subhead.text = "Tap on a succulent type to begin."
    subhead.numberOfLines = 1
    subhead.font = .italicSystemFont(ofSize: 16)
    subhead.textAlignment = .center
    subhead.textColor = .gray
    
    
    let itemNames = [itemName1, itemName2, itemName3, itemName4, itemName5, itemName6]
    
    for name in itemNames {
        name.textColor = .gray
        name.textAlignment = .center
    }
    
    let itemBtns = [itemBtn1, itemBtn2, itemBtn3, itemBtn4, itemBtn5, itemBtn6]

    for btn in itemBtns {
        btn.backgroundColor = .clear
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.cornerRadius = 2
    }
    
    itemBtn1.addTarget(self, action: #selector(buttonClick1(_:)), for: .touchUpInside)
    itemBtn2.addTarget(self, action: #selector(buttonClick2(_:)), for: .touchUpInside)
    itemBtn3.addTarget(self, action: #selector(buttonClick3(_:)), for: .touchUpInside)
    itemBtn4.addTarget(self, action: #selector(buttonClick4(_:)), for: .touchUpInside)
    itemBtn5.addTarget(self, action: #selector(buttonClick5(_:)), for: .touchUpInside)
    itemBtn6.addTarget(self, action: #selector(buttonClick6(_:)), for: .touchUpInside)
    
    view.addSubview(heading)
    view.addSubview(subhead)
    
    let viewImgs = [imageView1, imageView2, imageView3, imageView4, imageView5, imageView6]
    for image in viewImgs {
        
        view.addSubview(image)
    }
    
    let viewItems = [itemName1, itemName2, itemName3, itemName4, itemName5, itemName6]
    for item in viewItems {
           view.addSubview(item)
       }
    
    let viewBtns = [itemBtn1, itemBtn2, itemBtn3, itemBtn4, itemBtn5, itemBtn6]
    for ibtn in viewBtns {
              view.addSubview(ibtn)
          }
    
        let database = RealtimeDB()
        database.get(leaf: "option1"){(imageDictionary) in
                   
                   let htext = imageDictionary["title"] as? String
                   self.itemName1.text = htext
        
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
                           self.imageView1.image = image
                       }
                    }
                   
                   dataTask.resume()
               }
    
        database.get(leaf: "option2"){(imageDictionary) in
            
                    let htext = imageDictionary["title"] as? String
                    self.itemName2.text = htext
                    
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
                            self.imageView2.image = image
                        }
                     }
                    
                    dataTask.resume()
                }
        database.get(leaf: "option3"){(imageDictionary) in
            
                    let htext = imageDictionary["title"] as? String
                    self.itemName3.text = htext
                    
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
                            self.imageView3.image = image
                        }
                     }
                    
                    dataTask.resume()
                }
            database.get(leaf: "option4"){(imageDictionary) in
            
                    let htext = imageDictionary["title"] as? String
                    self.itemName4.text = htext
                    
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
                            self.imageView4.image = image
                        }
                     }
                    
                    dataTask.resume()
                }
            database.get(leaf: "option5"){(imageDictionary) in
            
                    let htext = imageDictionary["title"] as? String
                    self.itemName5.text = htext
                    
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
                            self.imageView5.image = image
                        }
                     }
                    
                    dataTask.resume()
                }
            database.get(leaf: "option6"){(imageDictionary) in
            
                    let htext = imageDictionary["title"] as? String
                    self.itemName6.text = htext
                    
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
                            self.imageView6.image = image
                        }
                     }
                    
                    dataTask.resume()
                }
            }
        
        
        @objc func buttonClick1(_ sender:UIButton!) {
            ModelData.shared.num = 1
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)

        }
        @objc func buttonClick2(_ sender:UIButton!) {
            ModelData.shared.num = 2
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)
            
        }
        @objc func buttonClick3(_ sender:UIButton!) {
            ModelData.shared.num = 3
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)
            
        }
        @objc func buttonClick4(_ sender:UIButton!) {
            ModelData.shared.num = 4
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)
          
        }
        @objc func buttonClick5(_ sender:UIButton!) {
            ModelData.shared.num = 5
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)
             
        }
        @objc func buttonClick6(_ sender:UIButton!) {
            ModelData.shared.num = 6
            print(ModelData.shared.num)
            present(DetailVC(), animated: true, completion: nil)
             
        }

}
