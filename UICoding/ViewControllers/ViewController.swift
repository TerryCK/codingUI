//
//  ViewController.swift
//  UICoding
//
//  Created by 陳 冠禎 on 14/09/2017.
//  Copyright © 2017 Chen, Guan-Jhen. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellid = "cellid"
    
    // Normally UILabel created by a closure
    let myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightBlue
        label.text = "this is a label text"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        // initialize for myLabel propertys what you want
        return label
    }()
    
    // Created the Button with target action pattern and introduce the lazy keyword
    
    lazy var myButton: UIButton = {
       let button = UIButton(type: .system)
        button.backgroundColor = .grassGreen
        button.setTitle("myButton", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(myButtonPressed), for: .touchUpInside)
        // initialize for myButton propertys what you want
        
        return button
    }()
    
    
    
    var count: Int = 0
    
    @objc func myButtonPressed() {
        print("myButtonPressed")
        count += 1
        myLabel.text = "myButtonPressed \(count) "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        setupViewByAnchor()
        setupCollectionView()
        
       
        
    }
   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        
        if indexPath.item % 2 == 0 {
        cell.backgroundColor = .heavyBlue
        } else {
        cell.backgroundColor = .lightGreen
        }
        return cell
    }
    
    func setupCollectionView() {
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)
        
        
//        view.addSubview(collectionView!)
//        collectionView?.translatesAutoresizingMaskIntoConstraints = false
//        collectionView?.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: myButton.topAnchor, right: view.leftAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 0, width: 0, height: 0)
    }
    /**
     First approach with VFL(Visual Format Language)
     - Add contraint for autolayout
     - VFL symbol H: Horizontal, V: Vertical, |: bounds Of View, [v0]: Views with dictionary
     - (iOS 6 and above)
    */
    @available(iOS 6, *)
    func setupViewByHFL() {
        view.addSubview(myLabel)
        
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(60)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myLabel]))
        
        
        myLabel.text = "Constrained by setupViewByHFL()"
    
        view.addSubview(myButton)
        
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": myButton]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(60)]-10-[v1(60)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":myButton, "v1":myLabel]))
        
        // is equivalent:
//        view.addConstraintsWithFormat(format: "V:[v0(60)]-10-[v1(60)]|", view: [myButton, myLabel])
    }
    
    
    /**
     Second approach with Anchor System
     - Nicer readability
     - (iOS 9 and above)
     */
    @available(iOS 9, *)
    func setupViewByAnchor() {
        view.addSubview(myLabel)
        
        
        myLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        myLabel.text = "Constrained by setupViewByAnchor"
        
        view.addSubview(myButton)
        myButton.bottomAnchor.constraint(equalTo: myLabel.topAnchor).isActive = true
        myButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Is equivalent:
//        myButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topPadding: 0, leftPadding: 0, bottomPadding: 10, rightPadding: 0, width: 0, height: 60)
        
//        Addional function for reduce times of isActive = true
//        NSLayoutConstraint.activate(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
        
        
    }
    

    
    
}

