//
//  CustomTableViewCell.swift
//  NewsModelling
//
//  Created by Ahreum CHO on 2020/07/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleIMG: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articlePublished: UILabel!
    @IBOutlet weak var articleDesc: UILabel!
    
    var displayCell :Articles?
    
    func didsplay(article: Articles){
        
        self.displayCell = article
        
        let url = URL(string: (displayCell?.urlToImage)!)
        articleIMG.kf.setImage(with: url!)
        
        articleTitle.text = displayCell?.title
        articlePublished.text = displayCell?.publishedAt
        articleDesc.text = displayCell?.description
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
