//
//  BookListCollectionViewController.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit


class BookListCollectionViewController: UICollectionViewController {
    
    enum CellType : String {
        case simple = "BookCell"
        case detail = "DetailCell"
    }
//    var seletedbook : Book?
    var books = [Book]()
    var celltype = CellType.simple
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(seletedbook?.link)
        // get books data
        Request.shared.getData { (books) in
            self.books = books
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        registerNib(nibname: "BookCell")
        registerNib(nibname: "DetailCell")
        
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
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celltype.rawValue, for: indexPath)
        let book = books[indexPath.row]
        
        guard let bookCellType = CellType(rawValue: celltype.rawValue) else { return UICollectionViewCell()}
        switch bookCellType {
        case .simple:
            guard let simpleCell = cell as? BookCollectionViewCell else { return UICollectionViewCell() }
            simpleCell.updateCell(book)
            return simpleCell
        default:
            guard let detailCell = cell as? DetailCollectionViewCell else { return UICollectionViewCell() }
            detailCell.updateCell(book)
            return detailCell
        }
       
    }
    
    func registerNib(nibname: String) {
        let nib = UINib(nibName: nibname, bundle: .main)
        self.collectionView.register(nib, forCellWithReuseIdentifier: nibname)
    }
    
    
    // bar item button 
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func changeButton(_ sender: UIBarButtonItem) {
        activeButton(bool: !isOn)
    }
    
    func activeButton(bool: Bool) {
        isOn = bool
       
        if isOn == false {
            celltype = .simple
        } else {
            celltype = .detail
        }
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "BookWebViewViewController") as! BookWebViewViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.urlString = books[indexPath.row].link
        
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if celltype == .simple {
            let width = (collectionView.bounds.width - 30) / 2
            let height = width / 2 * 3
            return CGSize(width: width, height: height)
        } else {
            let width = collectionView.bounds.width
            let height = width / 3
            return CGSize(width: width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}


