//
//  CommunityModel.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/28.
//

import Foundation

struct PostModel: Codable {
    var idx: Int
    var userName: String
    var writeDate: String
    var category: String
    var subway: String
    var title: String
    var content: String
    
    //var categoryId: Int
    //var subwayLineId: Int
    
    
    enum CodingKeys: String, CodingKey {
        case idx
        case userName
        case writeDate
        case category
        case subway
        case title
        case content
    }
}

struct CommentModel: Codable {
    var idx: Int
    var userName: String
    var writeDate: String
    var comment: String
    
    enum CodingKeys: String, CodingKey {
        case idx
        case userName
        case writeDate
        case comment
    }
}
