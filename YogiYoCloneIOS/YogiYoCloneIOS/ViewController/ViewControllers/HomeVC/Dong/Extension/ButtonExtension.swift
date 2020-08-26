//
//  ButtonExtension.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureAttribute(firstText: String) {
        let attributedTitle = NSMutableAttributedString(string: firstText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "(필수)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func configureAttributeOption(firstText: String, secondText: String) {
        let attributedTitle = NSMutableAttributedString(string: firstText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: secondText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
