//
//  News.swift
//
//
//  Created by Ilya Doroshkevitch on 04.03.2021.
//

import Foundation


struct Response: Codable {
    
    struct News: Codable, Hashable {
        var title: String?
        var description: String?
        var urlToImage: String?
        var publishedAt: String?
    }
    var articles: [News]
   
}
