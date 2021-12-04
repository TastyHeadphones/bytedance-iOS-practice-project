//
//  UserInfo.swift
//  basic functions
//
//  Created by Magic Keegan on 11/29/21.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userInfo = try? newJSONDecoder().decode(UserInfo.self, from: jsonData)

import Foundation

// MARK: - UserInfo
class UserInfo: Codable {
    let abstract: String
    let mediaInfo: MediaInfo
    let commentCount, shareCount, likeCount: Int
    let detailVideoLargeImage: DetailVideoLargeImage
    let videoURL: URL?
    let videoDuration: Int

    enum CodingKeys: String, CodingKey {
        case abstract
        case mediaInfo = "media_info"
        case commentCount = "comment_count"
        case shareCount = "share_count"
        case likeCount = "like_count"
        case detailVideoLargeImage = "detail_video_large_image"
        case videoURL = "video_url"
        case videoDuration = "video_duration"
    }
}

// MARK: - DetailVideoLargeImage
class DetailVideoLargeImage: Codable {
    let url: URL
    let width, height: Int
}

// MARK: - MediaInfo
class MediaInfo: Codable {
    let avatarURL: URL
    let name, verifiedContent: String
    let userVerified: Bool

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case name = "name"
        case verifiedContent = "verified_content"
        case userVerified = "user_verified"
    }
}
