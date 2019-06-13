//
//  BookCollectionViewCell.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var originPrice: UILabel!
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
