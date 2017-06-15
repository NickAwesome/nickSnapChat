//
//  ChatViewController.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class ChatController: DatasourceController {
    
    private let cellId = "cellId"
    private let HeaderCellId = "HeaderCellId"
    private let FooterCellId = "FooterCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        collectionView?.register(ChatCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderCellId)
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: FooterCellId)
        
        setupNavigationItems()
    }
    
    fileprivate func setupNavigationItems() {
//        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let snapChatButton = UIButton(type: .system)
        snapChatButton.setImage(#imageLiteral(resourceName: "snapchat_logo").withRenderingMode(.alwaysOriginal), for: .normal)
        snapChatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let searchButton = UIButton(type: .system)
        searchButton.frame = CGRect(x: 0, y: 0, width: 90, height: 34)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.contentMode = .scaleAspectFit
        searchButton.setTitle("Chat", for: .normal)
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
        print("123")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatCell
        if indexPath.row == 0 {
            cell.layer.mask = cell.maskLayer
        }
        cell.nameLabel.text = "Nick"
        cell.descriptionLabel.text = "opened at 8 May"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCellId, for: indexPath) as! FooterCell
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCellId, for: indexPath) as! HeaderCell
        return header
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 60)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}

