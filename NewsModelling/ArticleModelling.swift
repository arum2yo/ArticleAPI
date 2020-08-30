//
//  ArticleModelling.swift
//  NewsModelling
//
//  Created by Ahreum CHO on 2020/07/16.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Alamofire

//networking에 프로토콜 필요.

protocol ArticleModelProtocol {
    func articleModelRetrieved(articles:[Articles])
    
}

class ArticleModel {
    
    var delegate : ArticleModelProtocol?
    
    func getNetWork(){
        
        let url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=32610683850b40b7a948d7f5ef79f14d"
        
        guard let newsURL = URL(string: url) else {
            return
        }
        let request = URLRequest(url: newsURL)
        
        AF.request(request).responseData { (result) in
            if result.error != nil {
                print(result.error?.localizedDescription)
            } else {
                if let data = result.data{
                    
                    do{
                        let decoder = JSONDecoder()
                        
                        let jsonNews = try decoder.decode(NewsAPI.self, from: data)
                        print("3:data Json Decoding")
                        
                        DispatchQueue.main.async {
                            self.delegate?.articleModelRetrieved(articles: jsonNews.articles!)
                            print("5: 네트워킹 데이터 종료.")
                        }
                        
                    }catch{
                        print(error)
                        return
                    }
                }
                
            }
        }
    }
}
