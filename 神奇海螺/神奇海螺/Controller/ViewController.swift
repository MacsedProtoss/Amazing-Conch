//
//  ViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/7.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = OrangeColor
        setUp()
    }
    
    let topViewLayer : UIView = {
        let topview = UIView()
        topview.backgroundColor = UIColor.clear
        topview.translatesAutoresizingMaskIntoConstraints = false
        return topview
    }()
    
    let topLabel : UILabel  = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.text = "设置"
        label.textAlignment = .center
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let topButton : UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)//TODO 等待切图后获取素材改成 图片
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = grayColor
        return view
    }()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 61
        table.isScrollEnabled = false
        return table
    }()
    
    let midViewLayer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 16.7)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.text = "账号与安全"
        return label
    }()
    
    let accountImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.clear
        //image.image = //TODO
        return image
    }()
    
    let quitAccountButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("退出我的账号", for: .normal)
        button.setTitle("退出我的账号", for: .highlighted)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.init(name: "PingFang-SC-Medium", size: 16.7)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setUp(){
        topViewLayer.addSubview(topLabel)
        topViewLayer.addSubview(topButton)
        view.addSubview(topViewLayer)
        view.addSubview(backgroundView)
        self.tableView.register(settingCell.self, forCellReuseIdentifier: "SettingCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        midViewLayer.addSubview(accountLabel)
        midViewLayer.addSubview(accountImage)
        view.addSubview(midViewLayer)
        view.addSubview(quitAccountButton)
        
        topLabel.centerXAnchor.constraint(equalTo: topViewLayer.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topViewLayer.centerYAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        topLabel.widthAnchor.constraint(equalTo: topViewLayer.widthAnchor, multiplier: 0.2).isActive = true
        
        topButton.leadingAnchor.constraint(equalTo: topViewLayer.leadingAnchor).isActive = true
        topButton.widthAnchor.constraint(equalTo: topViewLayer.widthAnchor, multiplier: 0.2).isActive = true
        topButton.centerYAnchor.constraint(equalTo: topViewLayer.centerYAnchor).isActive = true
        topButton.heightAnchor.constraint(equalTo: topViewLayer.heightAnchor, multiplier: 0.5).isActive = true
        
        topViewLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topViewLayer.heightAnchor.constraint(equalToConstant: 44).isActive = true
        topViewLayer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topViewLayer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topViewLayer.bottomAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 19).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 183).isActive = true
        
        accountLabel.leadingAnchor.constraint(equalTo: midViewLayer.leadingAnchor, constant: 22).isActive = true
        accountLabel.centerYAnchor.constraint(equalTo: midViewLayer.centerYAnchor).isActive = true
        accountLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        accountLabel.widthAnchor.constraint(equalToConstant: 84).isActive = true
        
        accountImage.trailingAnchor.constraint(equalTo: midViewLayer.trailingAnchor, constant: -25).isActive = true
        accountImage.centerYAnchor.constraint(equalTo: midViewLayer.centerYAnchor).isActive = true
        accountImage.heightAnchor.constraint(equalToConstant: 13).isActive = true
        accountImage.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        midViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        midViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        midViewLayer.heightAnchor.constraint(equalToConstant: 61).isActive = true
        midViewLayer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        
        quitAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        quitAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        quitAccountButton.topAnchor.constraint(equalTo: midViewLayer.bottomAnchor, constant: 19).isActive = true
        quitAccountButton.heightAnchor.constraint(equalToConstant: 61).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! settingCell
        cell.mainLabel.text = mainLabelArray[indexPath.row]
        cell.subLabel.text = subLabelArray[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

