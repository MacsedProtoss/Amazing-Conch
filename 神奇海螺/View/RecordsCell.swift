//
//  RecordsCell.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/10.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class RecordsCell: UICollectionViewCell {
    override  init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "椭圆 1")
        image.backgroundColor = UIColor.clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 13.3)
        label.text = "timeLabel"
        label.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 16.7)
        label.text = "mainLabel"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpViews(){
        self.addSubview(imageView)
        self.addSubview(timeLabel)
        self.addSubview(mainLabel)
        
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -12).isActive = true
        
        mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -12).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -11).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        
    }
    
}
