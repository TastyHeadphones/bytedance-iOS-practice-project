//
//  UserInfo.swift
//  basic functions
//
//  Created by Magic Keegan on 11/29/21.
//

import Foundation

class UserInfo: Codable {
    let content: String
    let mediaInfo: MediaInfo
    let commentCount, shareCount, likeCount: Int
    let imageURL: URL
    enum CodingKeys: String, CodingKey {
        case content
        case mediaInfo = "media_info"
        case commentCount = "comment_count"
        case shareCount = "share_count"
        case likeCount = "like_count"
        case imageURL = "image_url"
    }
    
}

class MediaInfo: Codable {
    let avatarURL: URL
    let name, verifiedContent: String
    let userVerified: Bool

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case name
        case verifiedContent = "verified_content"
        case userVerified = "user_verified"
    }
}
