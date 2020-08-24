//
//  MenuTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
  
  let menuLable: UILabel = {
    let l = UILabel()
    l.font = FontModel.toSize.customFont
    l.text = "추가 / 변경 선택"
    l.textColor = .black //ColorPiker.customDarkGray
    return l
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(menuLable)
    setConstrain()
  }
  
  
  func setConstrain(){
    menuLable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      menuLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      menuLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      menuLable.heightAnchor.constraint(equalToConstant: 30),
    ])
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
