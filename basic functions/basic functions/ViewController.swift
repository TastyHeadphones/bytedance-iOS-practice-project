//
//  ViewController.swift
//  basic functions
//
//  Created by Magic Keegan on 11/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewLoaded")
        
        // Do any additional setup after loading the view.
        if let dataURL = Bundle.main.url(forResource: "userinfo", withExtension: "json"){
            if let data = try? Data(contentsOf: dataURL){
                let decoder = JSONDecoder()
                if let userInfo:UserInfo = try? decoder.decode(UserInfo.self, from: data){
                    print("\(userInfo.commentCount)")
                }
            }
            
        }
        
    }
    
    


}

