//
//  DetailCollectionViewCell.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/7/3.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    @IBOutlet weak var sellPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ book: Book) {
        sellPrice.text = "優惠價格：\(book.sellPrice)元"
        originPriceLabel.text = "原價：\(book.originPrice)元"
        nameLabel.text = book.name
        guard let url = URL(string: book.image) else { return }
        imageView.kf.setImage(with: url)

    }

}
