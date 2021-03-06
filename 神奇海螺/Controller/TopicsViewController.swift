//
//  TopicsViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/10.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class TopicsVC: UIViewController,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = OrangeColor
        setupViews()
    }
    
    let topViewLayer : UIView = {
        let topview = UIView()
        topview.backgroundColor = UIColor.clear
        topview.translatesAutoresizingMaskIntoConstraints = false
        return topview
    }()
    
    let searchBar : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "搜索话题"
        textField.font = UIFont.init(name: "PingFang-SC-Semibold", size: 16.7)
        textField.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        textField.tintColor = UIColor.black
        
        let searchImage = UIImageView()
        searchImage.image = UIImage(named: "ios-search")
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        searchImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        textField.leftView = searchImage
        textField.leftViewMode = .always
        textField.returnKeyType = .search
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let topButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ios-text"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let switcherLayer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainLayer : UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let askButtonLayer : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "椭圆 泛光")
        imgView.isUserInteractionEnabled = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let askButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.setImage(UIImage(named: "椭圆 button"), for: .normal)
        button.addTarget(self, action: #selector(askTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let askLabel : UILabel = {
        let label = UILabel()
        label.text = "问"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 36.7)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topicsCollectionView : UICollectionView = {
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
    
    func setupViews(){
        view.addSubview(topViewLayer)
        topViewLayer.addSubview(searchBar)
        topViewLayer.addSubview(topButton)
        searchBar.delegate = self
        view.addSubview(switcherLayer)
        view.addSubview(mainLayer)
//      view.addSubview(askButton)
        
        view.addSubview(topicsCollectionView)
        topicsCollectionView.register(TopicsCell.self, forCellWithReuseIdentifier: "TopicsCell")
        topicsCollectionView.delegate = self
        topicsCollectionView.dataSource = self
        
        topicsCollectionView.addSubview(askButtonLayer)
        askButtonLayer.addSubview(askButton)
        askButton.addSubview(askLabel)
        
        topViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topViewLayer.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        searchBar.leadingAnchor.constraint(equalTo: topViewLayer.leadingAnchor, constant: 24).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: topViewLayer.trailingAnchor, constant: -72).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: topViewLayer.bottomAnchor, constant: -9).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        topButton.trailingAnchor.constraint(equalTo: topViewLayer.trailingAnchor, constant: -25).isActive = true
        topButton.topAnchor.constraint(equalTo: topViewLayer.topAnchor, constant: 8).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        switcherLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        switcherLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        switcherLayer.topAnchor.constraint(equalTo: topViewLayer.bottomAnchor).isActive = true
        switcherLayer.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        mainLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainLayer.topAnchor.constraint(equalTo: switcherLayer.bottomAnchor).isActive = true
        mainLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        askButtonLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        askButtonLayer.widthAnchor.constraint(equalToConstant: 116).isActive = true
        askButtonLayer.heightAnchor.constraint(equalToConstant: 116).isActive = true
        askButtonLayer.bottomAnchor.constraint(equalTo: mainLayer.bottomAnchor).isActive = true
        
        askButton.trailingAnchor.constraint(equalTo: askButtonLayer.trailingAnchor, constant: -14).isActive = true
        askButton.bottomAnchor.constraint(equalTo: askButtonLayer.bottomAnchor, constant: -27).isActive = true
        askButton.widthAnchor.constraint(equalToConstant: 77).isActive = true
        askButton.heightAnchor.constraint(equalToConstant: 77).isActive = true
        
        askLabel.centerXAnchor.constraint(equalTo: askButton.centerXAnchor).isActive = true
        askLabel.centerYAnchor.constraint(equalTo: askButton.centerYAnchor).isActive = true
        askLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        askLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        topicsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topicsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topicsCollectionView.topAnchor.constraint(equalTo: switcherLayer.bottomAnchor, constant: 14).isActive = true
        topicsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //TODO
        return true
    }
    
    @objc func askTouch(){
        let askVC = AskViewController()
        self.present(askVC, animated: true,completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 //TODO
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicsCell", for: indexPath) as! TopicsCell
        //TODO
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 48
        let height : CGFloat = 172
        return CGSize(width: width, height: height)
    }
    
}
