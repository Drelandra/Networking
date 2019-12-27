//
//  ViewController.swift
//  Networking
//
//  Created by Andre Elandra on 19/08/19.
//  Copyright © 2019 Andre Elandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageUnsplash: UIImageView!
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.global().async {
//            self.loadData()
//        }
        
    }
    
    
    func loadData() {
        
        if let url = URL(string: "https://api.darksky.net/forecast/4f1614986edb1dc678414b8c00817a50/37.8267,-122.4233") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(Welcome.self, from: data)
                        DispatchQueue.main.async {
                            self.labelText.text = res.timezone
                        }

                    } catch let error {
                        print(error)
                    }
                }
                }.resume()
        }
        
        //            darksky.net secret key: 4f1614986edb1dc678414b8c00817a50
        
        //MARK:     Unsplash API
//        if let url = URL.with(string: "photos/random") {
//            var urlRequest = URLRequest(url: url)
//            urlRequest.setValue("Client-ID d70d8e19a021e5b91b1c86d6a92c19b143c17ae9e3d833ff56423b94b136a190", forHTTPHeaderField: "Authorization")
//
//            // ... URLSession
//            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//                if let data = data {
//
//                    do {
//                        let image = try JSONDecoder().decode(Image.self, from: data)
//                        DispatchQueue.main.async {
//                            self.imageUnsplash.image = UIImage(data: data)
//                        }
//                        print("this is image print: \(image)")
//                        print("\n\nthis is image urls print: \(image.urls)")
//                        print("\n\nthis is image url raw: \(image.urls.raw)")
//                    } catch let error {
//                        print(error)
//                    }
//
////                    if let jsonString = String(data: data, encoding: .utf8) {
////                        print(jsonString)
////                    }
//                }
//                }.resume()
//        }
        
//        if let url = URL.with(string: "photos/random?count=2") {
//            var urlRequest = URLRequest(url: url)
//            urlRequest.setValue("Client-ID YOUR_ACCESS_KEY", forHTTPHeaderField: "Authorization")
//
//            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//                if let data = data {
//                    do {
//                        let images = try JSONDecoder().decode([Image].self, from: data)
//                        print(images)
//                    } catch let error {
//                        print(error)
//                    }
//                }
//                }.resume()
//
//        }
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        
        loadData()
        
    }
    
}


