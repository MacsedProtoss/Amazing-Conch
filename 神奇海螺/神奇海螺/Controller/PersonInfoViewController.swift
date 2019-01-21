//
//  PersonInfoViewController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/10.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class PersonInfoVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainSettingTable {
            return 3
        }else{
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoCell") as! PersonInfoCell
        if tableView == mainSettingTable {
            cell.mainLabel.text = personInfoLabelArray[indexPath.row]
        }else if tableView==subSettingTable1 {
            cell.mainLabel.text = "关注的人"
        }else{
            cell.mainLabel.text = "历史浏览"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = OrangeColor
        setUpViews()
    }
    
    let topViewLayer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainViewLayer : UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topButton : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "设置"), for: .normal)
        button.addTarget(self, action: #selector(settingTouch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topLabel : UILabel  = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.text = "我"
        label.textAlignment = .center
        label.font = UIFont.init(name: "PingFang-SC-Semibold", size: 18.3)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let personLayer : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "矩形")
        image.backgroundColor = UIColor.clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let whiteCover : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "椭圆 3")
        image.backgroundColor = UIColor.clear
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let IDLabel : UILabel = {
        let label = UILabel()
        label.text = "IDLabel"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 24)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let schooolLabel : UILabel = {
        let label = UILabel()
        label.text = "schoolLabel"
        label.font = UIFont.init(name: "PingFang-SC-Medium", size: 13)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let acceptNumLabel : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 16)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerNumLabel : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 16)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fansNumLabel : UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 16)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let acceptLabel : UILabel = {
        let label = UILabel()
        label.text = "采纳数"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 24)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerLabel : UILabel = {
        let label = UILabel()
        label.text = "答题数"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 24)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fansLabel : UILabel = {
        let label = UILabel()
        label.text = "粉丝数"
        label.font = UIFont.init(name: "PingFang-SC-Heavy", size: 24)
        label.textColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainSettingTable : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.rowHeight = 44
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let subSettingTable1 : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.rowHeight = 44
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let subSettingTable2 : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.rowHeight = 44
        table.isScrollEnabled = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    
    func setUpViews(){
        view.addSubview(topViewLayer)
        view.addSubview(mainViewLayer)
        topViewLayer.addSubview(topButton)
        topViewLayer.addSubview(topLabel)
        view.addSubview(personLayer)
        personLayer.addSubview(whiteCover)
        personLayer.addSubview(IDLabel)
        personLayer.addSubview(schooolLabel)
        personLayer.addSubview(acceptLabel)
        personLayer.addSubview(acceptNumLabel)
        personLayer.addSubview(answerLabel)
        personLayer.addSubview(answerNumLabel)
        personLayer.addSubview(fansLabel)
        personLayer.addSubview(fansNumLabel)
        view.addSubview(mainSettingTable)
        view.addSubview(subSettingTable1)
        view.addSubview(subSettingTable2)
        mainSettingTable.delegate = self
        mainSettingTable.dataSource = self
        subSettingTable1.delegate = self
        subSettingTable1.dataSource = self
        subSettingTable2.delegate = self
        subSettingTable2.dataSource = self
        self.mainSettingTable.register(PersonInfoCell.self, forCellReuseIdentifier: "PersonInfoCell")
        self.subSettingTable1.register(PersonInfoCell.self, forCellReuseIdentifier: "PersonInfoCell")
        self.subSettingTable2.register(PersonInfoCell.self, forCellReuseIdentifier: "PersonInfoCell")
        
        topViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topViewLayer.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        topLabel.centerXAnchor.constraint(equalTo: topViewLayer.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topViewLayer.centerYAnchor).isActive = true
        topLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        topLabel.widthAnchor.constraint(equalTo: topViewLayer.widthAnchor, multiplier: 0.2).isActive = true
        
        mainViewLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainViewLayer.topAnchor.constraint(equalTo: topViewLayer.bottomAnchor).isActive = true
        mainViewLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        topButton.trailingAnchor.constraint(equalTo: topViewLayer.trailingAnchor, constant: -24).isActive = true
        topButton.centerYAnchor.constraint(equalTo: topViewLayer.centerYAnchor).isActive = true
        topButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        personLayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        personLayer.topAnchor.constraint(equalTo: topViewLayer.bottomAnchor, constant: 16).isActive = true
        personLayer.widthAnchor.constraint(equalToConstant: 352).isActive = true
        personLayer.heightAnchor.constraint(equalToConstant: 257).isActive = true
        
        
        whiteCover.leadingAnchor.constraint(equalTo: personLayer.leadingAnchor, constant: 32).isActive = true
        whiteCover.topAnchor.constraint(equalTo: personLayer.topAnchor, constant: 29).isActive = true
        whiteCover.widthAnchor.constraint(equalToConstant: 100).isActive = true
        whiteCover.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        IDLabel.leadingAnchor.constraint(equalTo: whiteCover.trailingAnchor, constant: 21).isActive = true
        IDLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        IDLabel.topAnchor.constraint(equalTo: personLayer.topAnchor, constant: 61).isActive = true
        IDLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        schooolLabel.leadingAnchor.constraint(equalTo: IDLabel.leadingAnchor).isActive = true
        schooolLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        schooolLabel.topAnchor.constraint(equalTo: personLayer.topAnchor, constant: 97).isActive = true
        schooolLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        acceptLabel.leadingAnchor.constraint(equalTo: personLayer.leadingAnchor, constant: 62).isActive = true
        acceptLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        acceptLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        acceptLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -51).isActive = true
        
        answerLabel.leadingAnchor.constraint(equalTo: personLayer.leadingAnchor, constant: 152).isActive = true
        answerLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -51).isActive = true
        
        fansLabel.leadingAnchor.constraint(equalTo: personLayer.leadingAnchor, constant: 243).isActive = true
        fansLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fansLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        fansLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -51).isActive = true
        
        acceptNumLabel.centerXAnchor.constraint(equalTo: acceptLabel.centerXAnchor).isActive = true
        acceptNumLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        acceptNumLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        acceptNumLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -78).isActive = true
        
        answerNumLabel.centerXAnchor.constraint(equalTo: answerLabel.centerXAnchor).isActive = true
        answerNumLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        answerNumLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        answerNumLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -78).isActive = true
        
        fansNumLabel.centerXAnchor.constraint(equalTo: fansLabel.centerXAnchor).isActive = true
        fansNumLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        fansNumLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        fansNumLabel.bottomAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: -78).isActive = true
        
        mainSettingTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainSettingTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainSettingTable.topAnchor.constraint(equalTo: personLayer.bottomAnchor, constant: 18).isActive = true
        mainSettingTable.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        subSettingTable1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subSettingTable1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subSettingTable1.topAnchor.constraint(equalTo: mainSettingTable.bottomAnchor, constant: 19).isActive = true
        subSettingTable1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        subSettingTable2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subSettingTable2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subSettingTable2.topAnchor.constraint(equalTo: subSettingTable1.bottomAnchor, constant: 19).isActive = true
        subSettingTable2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    @objc func settingTouch(){
        let settingVC = SettingVC()
        self.present(settingVC, animated: true,completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)//TODO
    }
    
    
    
}
