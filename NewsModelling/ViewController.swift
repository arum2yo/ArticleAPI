//
//  ViewController.swift
//  NewsModelling
//
//  Created by Ahreum CHO on 2020/07/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Alamofire
import ProgressHUD
import Kingfisher

let customCell = "customCell"

class ViewController: UIViewController{
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var articles = [Articles]()
    
    var articleModel = ArticleModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        articleModel.delegate = self //json parsing,
        ProgressHUD.show()
        print("1:articleModelling 로딩중!")
        
        articleModel.getNetWork()
        print("2:articleModelling에 getNetWork()호출")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = tableVIew.indexPathForSelectedRow
        
        guard index != nil else {
            return
        }
        let selectedArticle = articles[index!.row]
        
        let detailVC = segue.destination as! SecondViewController

        detailVC.url = selectedArticle.url
    }
}

extension ViewController: ArticleModelProtocol{
    
    func articleModelRetrieved(articles: [Articles]) {
        
        print("4:jsonDecoding된 데이터 뷰컨트롤러에 연결, 테이블뷰 reloadData")
        self.articles = articles
        OperationQueue.main.addOperation {
            self.tableVIew.reloadData()
            ProgressHUD.dismiss()
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell , for: indexPath) as! CustomTableViewCell
        
        let index = articles[indexPath.row]
        
        cell.didsplay(article: index)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
