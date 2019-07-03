//
//  BookCollectionViewCell.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.shadowOffset = .zero
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var originPrice: UILabel!
    @IBOutlet weak var learnMoreButton: UIButton! {
        didSet {
            learnMoreButton.layer.borderWidth = 1
            learnMoreButton.layer.cornerRadius = 10
            learnMoreButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    override func awakeFromNib() { 
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ book: Book) {
        sellPrice.text = "優惠價格：\(book.sellPrice)元"
        originPrice.text = "原價：\(book.originPrice)元"
        guard let url = URL(string: book.image) else { return }
        imageView.kf.setImage(with: url)

        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.gray.cgColor
    }

}
