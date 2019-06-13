//
//  Data.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import Foundation


struct BookData : Codable {
    let image: URL
    let originPrice: Int
    let sellPrice: Int
    let name: String
    let link: URL
}
