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
