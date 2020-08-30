//
//  ArticleInfo.swift
//  NewsModelling
//
//  Created by Ahreum CHO on 2020/07/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation

struct NewsAPI:Codable {
    var status: String?
    var totalResults:Int?
    var articles:[Articles]?
}

struct Articles:Codable {
    var author:String?
    var title:String?
    var description:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    var url:String!
}
