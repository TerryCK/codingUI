//
//  CustomTabButton.swift
//  UICoding
//
//  Created by 陳 冠禎 on 15/09/2017.
//  Copyright © 2017 Chen, Guan-Jhen. All rights reserved.
//

import UIKit
class CustomTabButton: UIButton {
    
    let myLabel: UILabel = {
        let label = UILabel()
//        label.tintColor = .gray
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubview(myLabel)
        addSubview(myImageView)
        myImageView.anchor(top: self.topAnchor, left: nil, bottom: nil, right: nil, topPadding: 5, leftPadding: 5, bottomPadding: 0, rightPadding: 5, width: 44, height: 0)
        
        myLabel.anchor(top: myImageView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topPadding: 1, leftPadding: 0, bottomPadding: 1, rightPadding: 0, width: 0, height: 0)
    
    }
    
    
    override var isHighlighted: Bool {
        didSet {

            myImageView.tintColor = isHighlighted ? .blue : .gray
            myLabel.textColor = myImageView.tintColor
        }
    }
    override var isSelected: Bool {
        didSet {
            
            myImageView.tintColor = isSelected ? .blue : .gray
            myLabel.textColor = myImageView.tintColor
        }
    }
    
    
    
    func setupView() {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

