//
//  UserInfoStore.swift
//  basic functions
//
//  Created by Magic Keegan on 12/2/21.
//

import Foundation
import UIKit
import CoreData

class UserInfoStore{
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchUserInfo(completion: @escaping ([UserInfo]) -> Void){
        if(try! context.fetch(JsonData.fetchRequest()).isEmpty){
            print("Fetch from network")
            fetchWebUserInfo{
                (userInfos) in
                completion(userInfos)
            }
        }
        else {
            let data = try! context.fetch(JsonData.fetchRequest())[0].data
            let decoder = JSONDecoder()
            let userInfos = try! decoder.decode([UserInfo].self, from: data!)
            print("Fetch from CoreData")
            completion(userInfos)
        }
    }
    
    func fetchWebUserInfo(completion: @escaping ([UserInfo]) -> Void){
        let components = URLComponents(string: "https://getman.cn/mock/newcomer/feed")!
        let url = components.url!
       
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            do {
            let decoder = JSONDecoder()
//                print(data!)
                let userInfos = try decoder.decode([UserInfo].self, from: data!)
                let newJsonData = JsonData(context: self.context)
                newJsonData.data = data
                newJsonData.webURL = url
                try! self.context.save()
                OperationQueue.main.addOperation {
                    completion(userInfos)
                }
            }
            catch{
                print(error)
            }
        }
            task.resume()

    }
    
}


