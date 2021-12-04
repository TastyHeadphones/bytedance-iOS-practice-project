//
//  NewsTableViewCell.swift
//  basic functions
//
//  Created by Magic Keegan on 11/30/21.
//

import UIKit
import AVKit

class NewsCell: UITableViewCell{
    
    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userVerifiedContent: UILabel!
    @IBOutlet var newsPhoto: UIImageView!
    @IBOutlet var shareCount: UILabel!
    @IBOutlet var commentCount: UILabel!
    @IBOutlet var likeCount: UILabel!
    @IBOutlet var content: UILabel!
    @IBOutlet var videoView: UIView!
    var player = AVPlayer()
    var isLiked: Bool = false
    var isPlaying: Bool = false

    
    let emitterLayer:CAEmitterLayer! = {
        let emitterLayer = CAEmitterLayer()
            
        emitterLayer.emitterPosition = CGPoint(x: 0, y: 0)
            
        let cell = CAEmitterCell()
        cell.alphaSpeed = -1.0
        cell.alphaRange = 0.5
        cell.birthRate = 1
        cell.lifetime = 1
        cell.velocity = 40
        cell.scale = 0.5
        cell.emissionLongitude = -.pi / 2
        cell.emissionRange = .pi
        cell.contents = UIImage(named: "emoji_52")!.cgImage
        
        emitterLayer.emitterCells = [cell]
        return emitterLayer
    }()
    

    
    private func likeAnimation(button:UIButton){
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping:0.5, initialSpringVelocity: 0.5,options: [.allowUserInteraction],
        animations: {
            self.emitterLayer.birthRate = 5
            button.layer.addSublayer(self.emitterLayer)
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                self.emitterLayer.birthRate = 0
           }
            button.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            button.tintColor = .red
        }, completion:nil)
        
    }
    
    
    @IBAction func like(_ sender: UIButton){
        
        isLiked = !isLiked
//        print(isLiked)
        let image = UIImage(named: "u13_like_feed")?.withRenderingMode(.alwaysTemplate)
        sender.setImage(image, for: .normal)

        if isLiked{
           likeAnimation(button: sender)

        }
        else{
            sender.setImage(UIImage(named: "u13_like_feed"), for: .normal)
//            emitterLayer.removeFromSuperlayer()
        }
        
    }
    
    @IBAction func playVideo(_ button: UIButton){
        isPlaying = !isPlaying
        if isPlaying{
            player.play()
            button.setImage(nil, for: .normal)
        }
        else{
            player.pause()
            button.setImage(UIImage(named: "play.fill"), for: .normal)
        }
        
    }
}

extension NewsCell{
    func makeRound(){
        let image = self.userPhoto!
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
}

