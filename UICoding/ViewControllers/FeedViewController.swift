//
//  FeedViewController.swift
//  UICoding
//
//  Created by 陳 冠禎 on 15/09/2017.
//  Copyright © 2017 Chen, Guan-Jhen. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    lazy var seacherButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "Image"), landscapeImagePhone: #imageLiteral(resourceName: "Image"), style: .plain, target: self, action: #selector(searchButtonPressed))
        button.tintColor = .white

        return button
    }()

    lazy var friendButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "friend"), landscapeImagePhone: #imageLiteral(resourceName: "friend"), style: .plain, target: self, action: #selector(friendButtonPressed))
        button.tintColor = .white
        
        return button
    }()
    
    let newPostButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.imageView?.contentMode = .scaleAspectFit
        myButton.setImage(#imageLiteral(resourceName: "newPost"), for: .normal)
        myButton.tintColor = .lightGray
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        myButton.setTitle(" Status", for: .normal)
        return myButton
    }()
    
    
    let photoButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.imageView?.contentMode = .scaleAspectFit
        myButton.setImage(#imageLiteral(resourceName: "photos"), for: .normal)
        myButton.tintColor = .lightGray
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        myButton.setTitle(" Photo", for: .normal)
        return myButton
    }()
    
    let checkinButton: UIButton = {
        let myButton = UIButton(type: .system)
        myButton.imageView?.contentMode = .scaleAspectFit
        myButton.setImage(#imageLiteral(resourceName: "checkin"), for: .normal)
        myButton.tintColor = .lightGray
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        myButton.setTitle(" Check In", for: .normal)
        return myButton
    }()
    
    @objc func friendButtonPressed() {
        print("friends Button Pressed")
    }
    
    let myTabButton: CustomTabButton = {
        let button = CustomTabButton(type: .system)
        button.myImageView.image = UIImage(named: "image")
        button.myLabel.text = "search"
    return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.textColor = .white
        label.text = "News Feed"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    let separatorLine: UIView =  {
        let myView = UIView()
        myView.backgroundColor = .lightGray
        myView.anchor(top: nil, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 1, height: 20)
        return myView
    }()
    let separatorLine2: UIView =  {
        let myView = UIView()
        myView.backgroundColor = .lightGray
        myView.anchor(top: nil, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 1, height: 20)
        return myView
    }()
    
   
    lazy var topButtonStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [self.newPostButton, self.separatorLine, self.photoButton, self.separatorLine2, self.checkinButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        return stackView
    }()
    
    @objc func searchButtonPressed() {
        print("searchButtonPressed")
    }

    
    let viewContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    
      let images: [UIImage] = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "image4"), #imageLiteral(resourceName: "image5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigateItem()
        setupCollectionView()
        setupNavigationTitle()
        let keyWindows = UIApplication.shared.keyWindow
        keyWindows?.addSubview(viewContainer)
        viewContainer.anchor(top: titleLabel.bottomAnchor, left: keyWindows?.leftAnchor, bottom: nil, right: keyWindows?.rightAnchor, topPadding: -20, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 40)
        
        viewContainer.addSubview(topButtonStackView)
        topButtonStackView.anchor(top: viewContainer.topAnchor, left: viewContainer.leftAnchor, bottom: viewContainer.bottomAnchor, right: viewContainer.rightAnchor, topPadding: 0, leftPadding: 20, bottomPadding: 0, rightPadding: 20, width: 0, height: 0)
        
    }

//    let topStackView: UIStackView = {
//        let topViews = []
//    let stackView = UIStackView(arrangedSubviews: <#T##[UIView]#>)
//    }()
    
    let cellid = "cellid"
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as? CoustomCollectionViewCell else { return CoustomCollectionViewCell() }
        cell.postImageView.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 10, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func setupNavigationTitle() {
        let keyWindows = UIApplication.shared.keyWindow
        
        keyWindows?.addSubview(titleLabel)
        titleLabel.anchor(top: keyWindows?.topAnchor, left: nil, bottom: nil, right: nil, topPadding: 0, leftPadding: 0, bottomPadding: 0, rightPadding: 0, width: 0, height: 80)
        titleLabel.centerXAnchor.constraint(equalTo: (keyWindows?.centerXAnchor)!).isActive = true
        
        
    }
    
    
    func setupNavigateItem() {
        navigationItem.leftBarButtonItem = seacherButton
        navigationItem.rightBarButtonItem = friendButton
        
    }
    
    
    func setupCollectionView() {
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .lightGray

//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        collectionView?.register(CoustomCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        collectionView?.contentInset = UIEdgeInsets(top: 45, left: 5, bottom: 10, right: 5)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 45, left: 5, bottom: 10, right: 5)
    }
}
