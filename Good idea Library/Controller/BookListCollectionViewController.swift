//
//  BookListCollectionViewController.swift
//  Good idea Library
//
//  Created by Chelsea Lin on 2019/5/27.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

// todo: up to top button

class BookListCollectionViewController: UICollectionViewController {
    
    enum CellType : String {
        case simple = "BookCell"
        case detail = "DetailCell"
    }
    var books = [Book]()
    var filterBooks = [Book]()
    var searchController: UISearchController!
    var celltype = CellType.simple
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get books data
        Request.shared.getData { (books) in
            self.books = books
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        registerNib(nibname: "BookCell")
        registerNib(nibname: "DetailCell")
        
        setFloatButton()
        setSearchBar()
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        // todo: 寫function
        return books.filter({ (book) -> Bool in
           isfiltering(book)
        }).count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celltype.rawValue, for: indexPath)
        
        let book = books.filter({ (book) -> Bool in
           isfiltering(book)
        })[indexPath.row]
        
    
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
        activeSearch(bool: !isOn)
    }
    
    func activeSearch(bool: Bool) {
        isOn = bool
        
        if isOn == false {
            if searchController.isActive { return }
            self.present(searchController, animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func changeButton(_ sender: UIBarButtonItem) {
        activeButton(bool: !isOn)
    }
    
    
    // change cell layout
    func activeButton(bool: Bool) {
        isOn = bool
        
        if isOn == false {
            celltype = .simple
        } else {
            celltype = .detail
        }
        self.collectionView.reloadData()
    }
    
    // setting search bar
    func setSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.tintColor = .black
        searchController.searchBar.placeholder = "搜尋書名..."
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    // setting float button
    func setFloatButton() {
        
        let button = UIButton(frame: CGRect(x: 300, y: 720, width: 50, height: 50))
        button.backgroundColor = UIColor(red: 183/255, green: 217/255, blue: 220/255, alpha: 1)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "icons8-collapse_arrow"), for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(scrollToTop), for: .touchUpInside)
        
        self.view.addSubview(button)
        
    }
    
    @objc func scrollToTop() {
        
        collectionView.setContentOffset(CGPoint(x: 0, y: -250), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // todo: filter
        let vc = storyboard?.instantiateViewController(withIdentifier: "BookWebViewViewController") as! BookWebViewViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.urlString = books.filter({ (book) -> Bool in
            isfiltering(book)
        })[indexPath.row].link
        
    }
    
    
    func isfiltering(_ book: Book) -> Bool{
        guard let text = searchController.searchBar.text, !text.isEmpty else { return true  }
        return  book.name.lowercased().contains(text.lowercased())
    }
    
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


extension BookListCollectionViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        collectionView.reloadData()
    }
}

