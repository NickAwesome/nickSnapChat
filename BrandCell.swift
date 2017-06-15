//
//  StoryView.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class BrandCell: DatasourceCell {
    
    let brandView: UIView = {
        let bv = UIView()
        bv.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        return bv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nick"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let separatorView: UIView = {
        let pv = UIView()
        pv.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        //self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        addSubview(brandView)
        addSubview(separatorView)
        brandView.fillSuperview()
        separatorView.anchor(brandView.topAnchor, left: nil, bottom: brandView.bottomAnchor, right: brandView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0.5, heightConstant: brandView.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
