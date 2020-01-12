//
//  ViewController.swift
//  qiitaAPIApp
//
//  Created by 板垣智也 on 2019/07/22.
//  Copyright © 2019 板垣智也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var tableView = UITableView()
    var articles: [ArticleEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Latest Articles"
        
        setUpTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self as UITableViewDataSource
            view.addSubview(tableView)
        }
        
        ArticleModel.fetchArticleViaAlamofire(completion: {(articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
