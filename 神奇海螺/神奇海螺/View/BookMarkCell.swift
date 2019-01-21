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
        setUpAllViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userIcon : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    
    func setUpAllViews(){
        
    }
    
}
