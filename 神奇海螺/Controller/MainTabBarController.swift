//
//  MainTabBarController.swift
//  神奇海螺
//
//  Created by MacsedProtoss on 2018/12/10.
//  Copyright © 2018 MacsedProtoss. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false //not 半透明
        setUpTabBar()
        setUpVC()
        self.selectedIndex = 0
    }
    
    fileprivate func setUpTabBar(){
        //根据颜色值画条线
        let screenWidth = view.frame.width
        let rect = CGRect(x:0,y:0,width:screenWidth,height:0.5)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.red.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        //这两个很主要缺一不可
        self.tabBar.shadowImage = image
        self.tabBar.backgroundImage = UIImage()
        
        // 设置文字偏移
        //UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0)
        

        //tabBar 底部工具栏背景颜色 (以下两个都行)
        //self.tabBar.barTintColor = UIColor.orange
        self.tabBar.backgroundColor = UIColor.white
        
        //self.tabBar.tintColor = OrangeColor
        
        
        
        
    }
    
    fileprivate func setUpVC(){
        let topicsVC = TopicsVC()
        let recordsVC = RecordsVC()
        let personInfoVC = PersonInfoVC()
        
        topicsVC.tabBarItem.image = UIImage(named: "首页点击前")
        topicsVC.tabBarItem.selectedImage = UIImage(named: "首页点击后")
        recordsVC.tabBarItem.image = UIImage(named: "记录点击前")
        recordsVC.tabBarItem.selectedImage = UIImage(named: "记录点击后")
        personInfoVC.tabBarItem.image = UIImage(named: "我的点击前")
        personInfoVC.tabBarItem.selectedImage = UIImage(named: "我的点击后")
        
        topicsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        recordsVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        personInfoVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        self.viewControllers = [topicsVC,recordsVC,personInfoVC]
        
    }
    
    
    
    
    
    
}
