//
//  CoustomCollectionViewCell.swift
//  UICoding
//
//  Created by 陳 冠禎 on 15/09/2017.
//  Copyright © 2017 Chen, Guan-Jhen. All rights reserved.
//

import UIKit

class CoustomCollectionViewCell: UICollectionViewCell {
//
//    let avatarView: UIImageView = {
//
//    }
//
//    let postConstentImageView: UIImageView = {
//
//    }
//
//    let likesLabel: UILabel = {
//
//    }
//
//    let userLabel: UILabel = {
//
//    }
//
//    let statusLabel: UILabel = {
//
//    }
//
//    let buttonStackView: UIStackView = {
//
//    }
//
//    let likeButton: UIButton = {
//
//    }
//
//    let commentButton: UIButton = {
//
//    }
//
//    let shareButton: UIButton = {
//
//    }
//
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    func setupView() {
        addSubview(postImageView)
        postImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topPadding: 0, leftPadding: 10, bottomPadding: 0, rightPadding: 10, width: 0, height: 0)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    let orientation = UIDevice().orientation
        if orientation == .landscapeRight {
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
