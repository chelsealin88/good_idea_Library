//
//  Request.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import UIKit


struct Request {
    
    static func getBookAPI(callback: @escaping ([BookData]) -> Void) {
        
        var bookData = [BookData]()
        
        let urlString = "https://bookshelf.goodideas-studio.com/api"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { print(error?.localizedDescription); return }
            guard let response = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let bookData = try decoder.decode([BookData].self, from: data)
                callback(bookData)
                
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()
    }
}


struct DownLoad {
    
    static func downloadImage(url: URL, callback: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                callback(image)
            } else {
                callback(nil)
            }
        }
        task.resume()
    }
}
