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
            tableView.delegate = self
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

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let article = articles[indexPath.row]
        print(article.updatedAt)
        tableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard.init(name: "ArticleDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ArticleDetail") as! ArticleDetailViewController
        
        vc.titleString = article.title
        vc.userName = article.user.name
        vc.articleBody = article.articleBody
        
        self.present(vc, animated: true, completion: nil)
    }
}
