//
//  PersonViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/8.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
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
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "返回"), for: .normal)
        button.addTarget(self, action: #selector(backTouch), for: .touchUpInside)
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
    
    let accountTable : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.rowHeight = 61
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        self.accountTable.register(PersonInfoCell.self, forCellReuseIdentifier: "PersonInfoCell")
        tableView.delegate = self
        tableView.dataSource = self
        accountTable.delegate = self
        accountTable.dataSource = self
        backgroundView.addSubview(tableView)
        backgroundView.addSubview(accountTable)
        backgroundView.addSubview(quitAccountButton)
        
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
        
        accountTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        accountTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        accountTable.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        accountTable.heightAnchor.constraint(equalToConstant: 61).isActive = true
        
        quitAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        quitAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        quitAccountButton.topAnchor.constraint(equalTo: accountTable.bottomAnchor, constant: 19).isActive = true
        quitAccountButton.heightAnchor.constraint(equalToConstant: 61).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView != accountTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! settingCell
            cell.mainLabel.text = mainLabelArray[indexPath.row]
            cell.subLabel.text = subLabelArray[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoCell")as! PersonInfoCell
            cell.mainLabel.text = "账号与安全"
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == accountTable {
            return 1
        }else{
            return 3
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func backTouch(){
        let settingVC = MainTabBarController()
        settingVC.selectedIndex = 2
        self.present(settingVC, animated: true,completion: nil)
    }
    
}

