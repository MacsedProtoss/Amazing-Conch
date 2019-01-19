//
//  BookmarkViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/14.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class BookmarkVC : UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = OrangeColor
        setupAllViews()
    }
    
    func setupAllViews(){
        
        view.addSubview(topView)
        view.addSubview(mainView)
        topView.addSubview(topBackButton)
        topView.addSubview(topLabel)
        mainView.addSubview(BookmarkCV)
        BookmarkCV.delegate = self
        BookmarkCV.dataSource = self
        BookmarkCV.register(BookMarkCell.self, forCellWithReuseIdentifier: "BookMarkCell")
        
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        topBackButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 25).isActive = true
        topBackButton.widthAnchor.constraint(equalToConstant: 13).isActive = true
        topBackButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        topBackButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 11).isActive = true
        
        topLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        topLabel.widthAnchor.constraint(equalToConstant: 92).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        BookmarkCV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        BookmarkCV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        BookmarkCV.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 14).isActive = true
        BookmarkCV.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -14).isActive = true
        
        
    }
    
    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = OrangeColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topBackButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "返回"), for: .normal)
        button.addTarget(self, action: #selector(backTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topLabel : UILabel  = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.text = "收藏的问题"
        label.textAlignment = .center
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let BookmarkCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.isMultipleTouchEnabled = false
        collection.backgroundColor = grayColor
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    
    @objc func backTouch(){
        let TopicVC = MainTabBarController()
        TopicVC.selectedIndex = 2
        self.present(TopicVC, animated: true,completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookMarkCell", for: indexPath) as! BookMarkCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 48
        let height : CGFloat = 137
        return CGSize(width: width, height: height)
    }
    
    
    
}
