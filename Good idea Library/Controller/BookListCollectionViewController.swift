//
//  BookListCollectionViewController.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BookListCollectionViewController: UICollectionViewController {
    
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Request.getData { (books) in
            self.books = books
            self.collectionView.reloadData()
        }

        registerNib(nibname: "BookCell")

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(books.count)
        return books.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCollectionViewCell
        
//        let book = bookData[indexPath.row]
//        cell.imageURL = book.list.image
//        cell.imageView.image = nil
//        Request.DownLoad.downloadImage(url: cell.imageURL!) { (image) in
//            if cell.imageURL == book.list.image, let image = image {
//                DispatchQueue.main.async {
//                    cell.imageView.image = image
//                }
//            }
//        }
    
    
        return cell
    }
    
    func registerNib(nibname: String) {
        let nib = UINib(nibName: nibname, bundle: .main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: nibname)
    }
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension BookListCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    // todo: layout

}
