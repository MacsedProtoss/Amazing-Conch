//
//  TopicsCilpCell.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/13.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class PersonInfoCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpSubViews(){
        self.addSubview(mainLabel)
        self.addSubview(arrayImg)
        
        
        mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        arrayImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        arrayImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arrayImg.widthAnchor.constraint(equalToConstant: 8).isActive = true
        arrayImg.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
    }
    
    let mainLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 16.7)
        label.text = "main"
        label.textColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrayImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "Right Accessory")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //let lineImage : UIImageView = {
    //    let image = UIImageView()
    //    image.image = UIImage.init(named: "line")
    //    return image
    //}()
    
}
