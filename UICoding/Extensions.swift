//
//  Extensions.swift
//  UICoding
//
//  Created by 陳 冠禎 on 14/09/2017.
//  Copyright © 2017 Chen, Guan-Jhen. All rights reserved.
//

import UIKit

extension UIView {
    /**
     For VFL
    */
    func addConstraintsWithFormat(format: String, view: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in view.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    /**
     For Anchor
     */
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?, right:  NSLayoutXAxisAnchor?,
                topPadding: CGFloat, leftPadding: CGFloat,
                bottomPadding: CGFloat, rightPadding: CGFloat,
                width: CGFloat, height: CGFloat
        ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    class var lightBlue: UIColor {
        return UIColor.rgb(red: 149, green: 204, blue: 244)
    }
    class var lightGray: UIColor {
        return UIColor.rgb(red: 140, green: 146, blue: 158)
    }
    class var lightGreen: UIColor {
        return UIColor.rgb(red: 45, green: 149, blue: 64)
    }
    class var heavyBlue: UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237)
    }
    class var FBBlue: UIColor {
        return UIColor.rgb(red: 55, green: 85, blue: 146)
    }
    class var grassGreen: UIColor {
        return UIColor.rgb(red: 85 , green: 177, blue: 114)
    }
    
    class var lightRed: UIColor {
        return UIColor.rgb(red: 218 , green: 52, blue: 53)
    }
    
}
