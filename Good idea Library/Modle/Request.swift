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
    // Singleton
    static let shared = Request()
    private init() {}
    
    private let apiString = "https://bookshelf.goodideas-studio.com/api"

    func getData(handle: @escaping (_ books: [Book]) -> Void) {
        
        let urlString = apiString
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            
            do {
                let decoderData = try JSONDecoder().decode(BookData.self, from: data)
                print("==========Data==========")
                print(decoderData)
                handle(decoderData.list)
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }

    
}

