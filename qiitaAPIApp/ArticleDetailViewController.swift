//
//  ArticleDetailViewController.swift
//  qiitaAPIApp
//
//  Created by 板垣智也 on 2020/01/12.
//  Copyright © 2020 板垣智也. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var articleBodyText: UITextView!
    
    var titleString = ""
    var userName = ""
    var publishDate = ""
    var articleBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleString
        userNameLabel.text = userName
        publishDateLabel.text = publishDate
        articleBodyText.attributedText = getNSAttrbutedString(articleBodyString: articleBody)
    }
    
    func getNSAttrbutedString(articleBodyString: String) -> NSAttributedString {
        
        let encodeData = articleBodyString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        let attributedOptions = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html as AnyObject,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue as AnyObject
            ]
        
        var attributedString = NSAttributedString()
        if let encodeData = encodeData {
            do {
                attributedString = try NSAttributedString(
                    data: encodeData,
                    options: attributedOptions,
                    documentAttributes: nil
                )
            } catch _ {

            }
        }

        return attributedString
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
