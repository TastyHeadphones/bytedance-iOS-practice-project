//
//  ViewController.swift
//  basic functions
//
//  Created by Magic Keegan on 11/29/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
//    var userInfo:UserInfo!
    var userInfo:UserInfo!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewLoaded")
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 160
        // Do any additional setup after loading the view.
        if let dataURL = Bundle.main.url(forResource: "userinfo", withExtension: "json"){
            if let data = try? Data(contentsOf: dataURL){
                let decoder = JSONDecoder()
                let info: UserInfo = try! decoder.decode(UserInfo.self, from: data)
                self.userInfo = info
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell",for: indexPath) as! NewsCell
        cell.commentCount.text = "\(userInfo.commentCount)"
        cell.likeCount.text = "\(userInfo.likeCount)"
        cell.shareCount.text = "\(userInfo.shareCount)"
        cell.userName.text = userInfo.mediaInfo.name
        cell.userVerifiedContent.text = userInfo.mediaInfo.verifiedContent
        cell.content.text = userInfo.content
        cell.makeRound()
        
        let photo = Photo()
        photo.fetchImage(with:userInfo.mediaInfo.avatarURL){
            (result) in
            switch result{
            case let .success(image):
                cell.userPhoto.image = image
            case .failure(_):
                print("error")
            }
            return
        }
        
        photo.fetchImage(with:userInfo.imageURL){
            (result) in
            switch result{
            case let .success(image):
                cell.newsPhoto.image = image
            case .failure(_):
                print("error")
            }
            return
        }
        
        
        
        return cell
    }
    
    
}

