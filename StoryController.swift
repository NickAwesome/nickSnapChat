//
//  StoryViewController.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class StoryController: DatasourceController {
    
    private let cellId = "cellId"
    private let BrandCellId = "BrandCellId"
    private let HeaderCellId = "HeaderCellId"
    private let FooterCellId = "FooterCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        collectionView?.register(StoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(BrandCell.self, forCellWithReuseIdentifier: BrandCellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderCellId)
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: FooterCellId)
        
        setupNavigationItems()
        setupGestureRecognizer()
    }
    
    fileprivate func setupGestureRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleDiscover))
        swipeRight.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func handleDiscover() {
        print("123")
        let discoverController = DiscoverController()
        navigationController?.pushViewController(discoverController, animated: true)
    }
    
    fileprivate func setupNavigationItems() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
//        navigationController?.navigationBar.barTintColor = UIColor.clear
//        navigationController?.navigationBar.isTranslucent = false
//        
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let snapChatButton = UIButton(type: .system)
        snapChatButton.setImage(#imageLiteral(resourceName: "snapchat_logo").withRenderingMode(.alwaysOriginal), for: .normal)
        snapChatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let searchButton = UIButton(type: .system)
        searchButton.frame = CGRect(x: 0, y: 0, width: 90, height: 34)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.contentMode = .scaleAspectFit
        searchButton.setTitle("Story", for: .normal)
        searchButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: snapChatButton), UIBarButtonItem(customView: searchButton)]
        
        let chatButton = UIButton(type: .system)
        chatButton.setImage(#imageLiteral(resourceName: "Combined Shape").withRenderingMode(.alwaysOriginal), for: .normal)
        chatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: chatButton)
    }
    
    func handleSearch() {
        print("555")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCellId, for: indexPath) as! BrandCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoryCell
        cell.nameLabel.text = "Nick"
        cell.descriptionLabel.text = "opened at 8 May"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
//            if indexPath.row != 0 {
//                return CGSize(width: view.frame.width / 2, height: 100)
//            }
            
            return CGSize(width: view.frame.width / 2, height: 200)
        }
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCellId, for: indexPath) as! FooterCell
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCellId, for: indexPath) as! HeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 60)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: view.frame.width, height: 150)
        }
        
        return CGSize.zero
    }
}



















