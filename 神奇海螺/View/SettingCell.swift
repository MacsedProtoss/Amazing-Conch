//
//  ScrollVer.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/8.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class settingCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpSubViews(){
        self.addSubview(mainLabel)
        self.addSubview(subLabel)
        self.addSubview(switchButton)
        
        
        mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22).isActive = true
        mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 13).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        
        subLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22).isActive = true
        subLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
        subLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        subLabel.widthAnchor.constraint(equalToConstant: 232).isActive = true
        
        switchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        switchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
        switchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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
    
    let subLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 12)
        label.text = "sub"
        label.textColor = UIColor.init(displayP3Red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchButton : UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    //let lineImage : UIImageView = {
    //    let image = UIImageView()
    //    image.image = UIImage.init(named: "line")
    //    return image
    //}()
    
}
