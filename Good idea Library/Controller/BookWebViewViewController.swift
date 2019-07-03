
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

        print(urlString)
    }
    

    func loadURL() {
        
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        print("Webpage Loaded Successfully")
        
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
