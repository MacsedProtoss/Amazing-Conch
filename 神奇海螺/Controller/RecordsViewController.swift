//
//  RecordsViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/10.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class RecordsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate {
    //TODO this
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = OrangeColor
        SetupViews()
    }
    
    let topViewLayer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topLabel : UILabel = {
        let label = UILabel()
        label.text = "记录"
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 16.7)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topEditButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "编辑点击后"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchBar : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "搜索记录"
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
    
    
    let mainViewLayer : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = false
        collectionView.backgroundColor = grayColor
        return collectionView
    }()
    
    let midView : UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    func SetupViews(){
        topViewLayer.addSubview(topLabel)
        topViewLayer.addSubview(topEditButton)
        topViewLayer.addSubview(searchBar)
        view.addSubview(topViewLayer)
        view.addSubview(mainViewLayer)
        view.addSubview(midView)
        mainViewLayer.register(RecordsCell.self, forCellWithReuseIdentifier: "RecordsCell")
        mainViewLayer.delegate = self
        mainViewLayer.dataSource = self
        searchBar.delegate = self
        
        topLabel.centerXAnchor.constraint(equalTo: topViewLayer.centerXAnchor).isActive = true
        topLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        topLabel.topAnchor.constraint(equalTo: topViewLayer.topAnchor, constant: 14).isActive = true
        
        topEditButton.trailingAnchor.constraint(equalTo: topViewLayer.trailingAnchor, constant: -24).isActive = true
        topEditButton.topAnchor.constraint(equalTo: topViewLayer.topAnchor, constant: 10).isActive = true
        topEditButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        topEditButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        searchBar.leadingAnchor.constraint(equalTo: topViewLayer.leadingAnchor, constant: 25).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: topViewLayer.trailingAnchor, constant: -24).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: topViewLayer.bottomAnchor, constant: -10).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        topViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topViewLayer.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        midView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        midView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        midView.topAnchor.constraint(equalTo: topViewLayer.bottomAnchor).isActive = true
        midView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        mainViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainViewLayer.topAnchor.constraint(equalTo: midView.bottomAnchor).isActive = true
        mainViewLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 48
        let height : CGFloat = 61
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }//TODO
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordsCell", for: indexPath) as! RecordsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //TODO
        return true
    }
    
}
