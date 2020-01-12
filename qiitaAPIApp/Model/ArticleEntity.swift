//
//  File.swift
//  qiitaAPIApp
//
//  Created by 板垣智也 on 2019/07/22.
//  Copyright © 2019 板垣智也. All rights reserved.
//

import Foundation

struct ArticleEntity: Codable {
    var title: String
    var updatedAt: String
    var articleBody: String
    var user: User
    var url: String
    struct User: Codable {
        var id: String
        var name: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case title, user, url
        case updatedAt = "updated_at"
        case articleBody = "rendered_body"
    }
}
