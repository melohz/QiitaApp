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
    var user: User
    struct User: Codable {
        var id: String
    }
}
