//
//  Data.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation

struct BookData : Codable {
    
    let list : [Book]
    
}

struct Book : Codable {
    
    let image: String
    let originPrice: String
    let sellPrice: String
    let name: String
    let link: String
    
}
