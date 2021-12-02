//
//  UserInfoStore.swift
//  basic functions
//
//  Created by Magic Keegan on 12/2/21.
//

import Foundation
import UIKit

class UserInfoStore{
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchUserInfo(completion: @escaping ([UserInfo]) -> Void){
        let components = URLComponents(string: "https://getman.cn/mock/newcomer/feed")!
        let url = components.url!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            do {
            let decoder = JSONDecoder()
//                print(data!)
                let userInfos = try decoder.decode([UserInfo].self, from: data!)
//                print(userInfos[0].mediaInfo.name)
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


