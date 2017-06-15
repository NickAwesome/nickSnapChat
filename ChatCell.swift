//
//  ChatView.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class ChatCell: DatasourceCell {
    
    lazy var maskLayer: CAShapeLayer = {
        let mp = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 18.0, height: 0.0))
        let ml = CAShapeLayer()
        ml.path = mp.cgPath
        return ml
    }()
    
    let chatStatusImage: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "send-button")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nick"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Nick"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        addSubview(chatStatusImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)

        chatStatusImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        nameLabel.anchor(self.topAnchor, left: chatStatusImage.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        descriptionLabel.anchor(nameLabel.bottomAnchor, left: chatStatusImage.rightAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
