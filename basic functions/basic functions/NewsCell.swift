//
//  NewsTableViewCell.swift
//  basic functions
//
//  Created by Magic Keegan on 11/30/21.
//

import UIKit

class NewsCell: UITableViewCell{
    
    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userVerifiedContent: UILabel!
    @IBOutlet var newsPhoto: UIImageView!
    @IBOutlet var shareCount: UILabel!
    @IBOutlet var commentCount: UILabel!
    @IBOutlet var likeCount: UILabel!
    @IBOutlet var content: UILabel!

    private func likeAnimation(button:UIButton){
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping:0.5, initialSpringVelocity: 0.5,options: [.allowUserInteraction],
        animations: {
            button.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            button.tintColor = .red
            
        }, completion:nil)
        
    }
    
    @IBAction func like(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        print(sender.isSelected)
        if sender.isSelected{
           likeAnimation(button: sender)
        }
        else{
            sender.setImage(UIImage(named: "u13_like_feed"), for: .normal)
//            sender.layer.removeAllAnimations()
//            sender.layer.transform = CATransform3DIdentity
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

