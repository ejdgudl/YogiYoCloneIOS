//
//  OptionTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    let optionLable: UILabel = {
      let l = UILabel()
      l.font = FontModel.toSize.customFont
      l.text = "옵션"
      l.textColor = .black //ColorPiker.customDarkGray
      return l
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      contentView.addSubview(optionLable)
      setConstrain()
    }

    
    func setConstrain(){
      optionLable.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        optionLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        optionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        optionLable.heightAnchor.constraint(equalToConstant: 30),
        ])
    }

       required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
       }
}
