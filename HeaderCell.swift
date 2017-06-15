//
//  HeaderCell.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class HeaderCell: DatasourceCell {
    
    lazy var maskLayer: CAShapeLayer = {
        let mp = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 18.0, height: 0.0))
        let ml = CAShapeLayer()
        ml.path = mp.cgPath
        return ml
    }()
    
    let addStoryImage: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "send-button")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headerView: UIView = {
        let hv = UIView()
        hv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return hv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "My Story"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to add a Snap!"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    let separatorView: UIView = {
        let sv = UIView()
        sv.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        headerView.layer.mask = maskLayer
        
        addSubview(headerView)
        addSubview(addStoryImage)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(separatorView)
        
        headerView.fillSuperview()
        addStoryImage.anchor(headerView.topAnchor, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        nameLabel.anchor(headerView.topAnchor, left: addStoryImage.rightAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        descriptionLabel.anchor(nameLabel.bottomAnchor, left: addStoryImage.rightAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        separatorView.anchor(nil, left: addStoryImage.leftAnchor, bottom: headerView.bottomAnchor, right: headerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: headerView.frame.width, heightConstant: 0.5)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
