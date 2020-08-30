//
//  SecondViewController.swift
//  NewsModelling
//
//  Created by Ahreum CHO on 2020/08/30.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import WebKit
import ProgressHUD

class SecondViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        
        ProgressHUD.show()
        super.viewDidLoad()
        super.loadView()
        
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        self.view = self.webView
        let url = URL(string: self.url!)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        ProgressHUD.dismiss()

    }

}
