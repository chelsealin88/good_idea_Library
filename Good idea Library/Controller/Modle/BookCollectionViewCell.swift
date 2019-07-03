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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var originPrice: UILabel!
//    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(_ book: Book) {
       print(book)
//        imageView.image = UIImage(named:book.image)
        sellPrice.text = "優惠價格：\(book.sellPrice)元"
        originPrice.text = "原價：\(book.originPrice)元"
//        bookNameLabel.text = book.name
        guard let url = URL(string: book.image) else { return }
        imageView.kf.setImage(with: url)

    }

}

//extension UIImageView {
//    
//    func setImageFrom(url: String) {
//        guard let url = URL(string: url) else { return }
//        self.set(with: url)
//
//    }
//}
