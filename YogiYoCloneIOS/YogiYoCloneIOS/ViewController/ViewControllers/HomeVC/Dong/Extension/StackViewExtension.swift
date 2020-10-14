//
//  StackViewExtension.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension UIStackView {
<<<<<<< HEAD
=======
    
>>>>>>> develop
    func addBackgroundWithShadow(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        
        subView.layer.shadowColor = UIColor.black.cgColor 
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        subView.layer.shadowRadius = 8
        subView.layer.shadowOpacity = 0.2
<<<<<<< HEAD
=======
        subView.frame.size = CGSize(width: self.frame.width, height: self.frame.height + 25)
        subView.center.y = self.center.y
>>>>>>> develop
    }
    
    func addBackgroundButtonStack(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
<<<<<<< HEAD
        subView.layer.borderColor = UIColor.lightGray.cgColor
=======
        subView.layer.borderColor = ColorPiker.lightGray.cgColor
>>>>>>> develop
        subView.layer.borderWidth = 1
        insertSubview(subView, at: 0)
        
        let devideView = UIView()
<<<<<<< HEAD
        devideView.backgroundColor = .lightGray
=======
        devideView.backgroundColor = ColorPiker.lightGray
>>>>>>> develop
        subView.addSubview(devideView)
        devideView.snp.makeConstraints { (make) in
            make.top.bottom.centerX.equalToSuperview()
            make.width.equalTo(1)
        }
    }
<<<<<<< HEAD
=======
    
>>>>>>> develop
}
