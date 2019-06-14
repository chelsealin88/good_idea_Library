//
//  Data.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BookData : Codable {
    
    let list : [Book]
    
}

struct Book : Codable {
    
    let image: String
    let originPrice: String
    let sellPrice: String
    let name: String
    let link: String
    
    init(json: JSON) {
        self.image = json["image"].stringValue
        self.originPrice = json["originPrice"].stringValue
        self.sellPrice = json["sellPrice"].stringValue
        self.name = json["name"].stringValue
        self.link = json["link"].stringValue
        
    }
}
