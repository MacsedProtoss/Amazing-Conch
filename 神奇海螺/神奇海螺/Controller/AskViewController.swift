//
//  AskViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/27.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class AskViewController: UIViewController,UITextViewDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    let TopView : UIView = {
        let view = UIView()
        view.backgroundColor = OrangeColor
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
    
    let topDoneButton : UIButton  = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        button.setTitle("完成", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneTouch), for: .touchUpInside)
        return button
    }()
    
    let mainView : UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let mainTitle : UITextView = {
        let textField = UITextView()
        textField.backgroundColor = UIColor.clear
        textField.text = "输入标题"
        textField.font = UIFont.init(name: "PingFang-SC-Semibold", size: 26.7)
        textField.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        textField.tintColor = UIColor.black
        textField.returnKeyType = .done
        textField.textContainer.maximumNumberOfLines = 1
        textField.textContainer.lineBreakMode = .byTruncatingHead
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainDescription : UITextView = {
        let textField = UITextView()
        textField.backgroundColor = UIColor.clear
        textField.text="输入内容"
        textField.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        textField.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
        textField.tintColor = UIColor.black
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func setUpViews(){
        view.backgroundColor = OrangeColor
        view.addSubview(TopView)
        view.addSubview(topBackButton)
        view.addSubview(topDoneButton)
        view.addSubview(mainView)
        mainView.addSubview(lineView)
        mainView.addSubview(mainTitle)
        mainView.addSubview(mainDescription)
        mainDescription.delegate = self
        mainTitle.delegate = self
        
        
        TopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        TopView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        TopView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        TopView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        topBackButton.leadingAnchor.constraint(equalTo: TopView.leadingAnchor, constant: 24).isActive = true
        topBackButton.topAnchor.constraint(equalTo: TopView.topAnchor, constant: 11).isActive = true
        topBackButton.heightAnchor.constraint(equalToConstant: 21).isActive = true
        topBackButton.widthAnchor.constraint(equalToConstant: 13).isActive = true
        
        topDoneButton.trailingAnchor.constraint(equalTo: TopView.trailingAnchor, constant: -24).isActive = true
        topDoneButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        topDoneButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        topDoneButton.topAnchor.constraint(equalTo: TopView.topAnchor, constant: 15).isActive = true
        
        mainView.topAnchor.constraint(equalTo: TopView.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainTitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24).isActive = true
        mainTitle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant : -24).isActive = true
        mainTitle.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5).isActive = true
        mainTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lineView.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor,constant : 10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        mainDescription.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24).isActive = true
        mainDescription.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant : -24).isActive = true
        mainDescription.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15).isActive = true
        mainDescription.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
    }
    
    
    
    @objc func backTouch(){
        let TopicVC = MainTabBarController()
        TopicVC.selectedIndex = 0
        self.present(TopicVC, animated: true,completion: nil)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0) ){
            textView.textColor = UIColor.black
            textView.text = nil
            
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView == mainDescription && textView.text == ""){
            textView.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
            textView.text = "输入内容"
        }else if (textView == mainTitle && textView.text == ""){
            textView.textColor = UIColor.init(red: 177/255, green: 177/255, blue: 177/255, alpha: 1.0)
            textView.text = "输入标题"
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            print("\(textView.text ?? "nothing") ")
        }
        return true
    }
    
    @objc func doneTouch(){
        
        let alert = UIAlertController(title: "Done", message: "Your question has been published", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let TopicVC = MainTabBarController()
            TopicVC.selectedIndex = 0
            self.present(TopicVC, animated: true,completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
