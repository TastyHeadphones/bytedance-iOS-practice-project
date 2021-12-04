//
//  ViewController.swift
//  basic functions
//
//  Created by Magic Keegan on 11/29/21.
//

import UIKit
import AVKit
class NewsTableViewController: UITableViewController {
//    var userInfo:UserInfo!
    var userInfos = [UserInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let store = UserInfoStore()
        store.fetchUserInfo{
            (infos) in
            self.userInfos = infos
            self.tableView.reloadData()
        }
        print("viewLoaded userInfocount = \(userInfos.count)")
        tableView.rowHeight = UITableView.automaticDimension
        
//        tableView.estimatedRowHeight = 160
        // Do any additional setup after loading the view.
//        if let dataURL = Bundle.main.url(forResource: "userinfo", withExtension: "json"){
//            if let data = try? Data(contentsOf: dataURL){
//                let decoder = JSONDecoder()
//                let info: UserInfo = try! decoder.decode(UserInfo.self, from: data)
//                self.userInfo = info
//            }
//        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell",for: indexPath) as! NewsCell
        cell.commentCount.text = "\(userInfos[indexPath.row].commentCount)"
        cell.likeCount.text = "\(userInfos[indexPath.row].likeCount)"
        cell.shareCount.text = "\(userInfos[indexPath.row].shareCount)"
        cell.userName.text = userInfos[indexPath.row].mediaInfo.name
        cell.userVerifiedContent.text = userInfos[indexPath.row].mediaInfo.verifiedContent
        cell.content.text = userInfos[indexPath.row].abstract
        cell.selectionStyle = .none
        cell.makeRound()
        
        let photo = Photo()
        photo.fetchImage(with:userInfos[indexPath.row].mediaInfo.avatarURL){
            (result) in
            switch result{
            case let .success(image):
                cell.userPhoto.image = image
            case let .failure(error):
                print(error)
            }
            return
        }
        
//        photo.fetchImage(with:userInfos[indexPath.row].detailVideoLargeImage.url){
//            (result) in
//            switch result{
//            case let .success(image):
//                cell.newsPhoto.image = image
//            case let .failure(error):
//                print(error)
//            }
//            return
//        }
        cell.newsPhoto.image = nil
        
        let url = userInfos[indexPath.row].videoURL!
        cell.player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: cell.player)
        playerLayer.frame = cell.videoView.bounds
        cell.videoView.layer.addSublayer(playerLayer)
        cell.player.pause()
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let url = userInfos[indexPath.row].videoURL {
//          let player = AVPlayer(url: url)
//          let playerViewController = AVPlayerViewController()
//          playerViewController.player = player
//          present(playerViewController, animated: true) {
//             player.play()
//          }
//       }
//    }
    
    
}

