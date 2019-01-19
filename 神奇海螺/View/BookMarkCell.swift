//
//  BookMarkCell.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2019/1/18.
//  Copyright © 2019 MacsedProtoss. All rights reserved.
//

import UIKit

class BookMarkCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        setUpAllViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userIcon : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 13
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "userName"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 13.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainTitle : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "mainTitle"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 18.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainDescribtion : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 99/255, green: 99/255, blue: 99/255, alpha: 1.0)
        label.textAlignment = .left
        label.text = "mainDescribtion"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setUpAllViews(){
        
        self.addSubview(userIcon)
        self.addSubview(userLabel)
        self.addSubview(mainTitle)
        self.addSubview(mainDescribtion)
        
        userIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        userIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 11).isActive = true
        userIcon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        userLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor,constant: 9).isActive = true
        userLabel.centerYAnchor.constraint(equalTo: userIcon.centerYAnchor).isActive = true
        userLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        mainTitle.leadingAnchor.constraint(equalTo: userIcon.leadingAnchor).isActive = true
        mainTitle.widthAnchor.constraint(equalToConstant: 294).isActive = true
        mainTitle.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 9).isActive = true
        mainTitle.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        mainDescribtion.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor).isActive = true
        mainDescribtion.widthAnchor.constraint(equalToConstant: 294).isActive = true
        mainDescribtion.heightAnchor.constraint(equalToConstant: 38).isActive = true
        mainDescribtion.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 13).isActive = true
        
    }
    
}
