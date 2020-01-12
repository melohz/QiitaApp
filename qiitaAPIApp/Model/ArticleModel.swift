//
//  ArticleModel.swift
//  qiitaAPIApp
//
//  Created by 板垣智也 on 2019/07/22.
//  Copyright © 2019 板垣智也. All rights reserved.
//

import Foundation
import Alamofire

struct ArticleModel {
    static func fetchArticle(completion: @escaping ([ArticleEntity]) -> ()) {
        
        let url = "https://qiita.com/api/v2/items"
        
        guard var urlComponents = URLComponents(string: url) else {
                return
            }
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([ArticleEntity].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchArticleViaAlamofire(completion: @escaping ([ArticleEntity]) -> ()) {
        let url = "https://qiita.com/api/v2/items"
        Alamofire.request(url).response { res in
            guard let data = res.data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let articles: [ArticleEntity] = try decoder.decode([ArticleEntity].self, from: data)
                completion(articles)
            } catch {
                print(error)
            }
        }
    }
}
