//
//  TopicsCell.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/15.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class TopicsCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setUpAllViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userIcon : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.clear
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let userLabel : UILabel = {
        let label = UILabel()
        label.text = "userLabel"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 13.3)
        label.textAlignment = .left
        label.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainQuestionLabel : UILabel = {
        let label = UILabel()
        label.text = "mainQuestionLabel"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 18.3)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subQuestionLabel : UILabel = {
        let label = UILabel()
        label.text = "subQuestionLabel"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 15)
        label.textAlignment = .left
        label.textColor = UIColor.init(red: 99/255, green: 99/255, blue: 99/255, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let starButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "star"), for: .normal)
        button.setImage(UIImage(named: "star_highlight"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let thumbButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "thumb"), for: .normal)
        button.setImage(UIImage(named: "thumb_highlight"), for: .highlighted)
        button.addTarget(self, action: #selector(btnTouched(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let arrayImg : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor.clear
        imgView.image = UIImage(named: "Right Accessory")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    func setUpAllViews(){
        self.addSubview(userIcon)
        self.addSubview(userLabel)
        self.addSubview(mainQuestionLabel)
        self.addSubview(subQuestionLabel)
        self.addSubview(lineView)
        self.addSubview(starButton)
        self.addSubview(thumbButton)
        self.addSubview(arrayImg)
        
        userIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        userIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        userIcon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        userLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 9).isActive = true
        userLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 19).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 12.3).isActive = true
        userLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        
        mainQuestionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
        mainQuestionLabel.topAnchor.constraint(equalTo: userIcon.bottomAnchor, constant: 9).isActive = true
        mainQuestionLabel.heightAnchor.constraint(equalToConstant: 17.3).isActive = true
        mainQuestionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        subQuestionLabel.leadingAnchor.constraint(equalTo: mainQuestionLabel.leadingAnchor).isActive = true
        subQuestionLabel.topAnchor.constraint(equalTo: mainQuestionLabel.bottomAnchor, constant: 13).isActive = true
        subQuestionLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        subQuestionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 137).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        starButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
        starButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 6).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        thumbButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 44).isActive = true
        thumbButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 6).isActive = true
        thumbButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        thumbButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        arrayImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21).isActive = true
        arrayImg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        arrayImg.heightAnchor.constraint(equalToConstant: 13).isActive = true
        arrayImg.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        
        
    }
    //TODO
    @objc func btnTouched (sender button : UIButton){
        //if(button.currentImage == UIImage(named: "thumb")){
            button.setImage(UIImage(named: "thumb_highlight"), for: .normal)
        //}
    }
}
