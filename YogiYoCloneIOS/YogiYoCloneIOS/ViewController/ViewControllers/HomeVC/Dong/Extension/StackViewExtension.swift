//
//  StackViewExtension.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        
        subView.layer.shadowColor = UIColor.black.cgColor 
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        subView.layer.shadowRadius = 8
        subView.layer.shadowOpacity = 0.2
    }
}
