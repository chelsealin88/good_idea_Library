
//
//  BookWebViewViewController.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/7/3.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit
import WebKit

class BookWebViewViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadURL()
        settingNavigation()
    }
    

    func loadURL() {
        
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        print("Webpage Loaded Successfully")
    }
    
    func settingNavigation() {
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = .black
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    }
    
}
