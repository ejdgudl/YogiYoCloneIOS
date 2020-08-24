//
//  BuyTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BuyTableViewCell: UITableViewCell {
  
  let buyLable: UILabel = {
     let l = UILabel()
     l.font = FontModel.toSize.customFont
     l.text = "수량"
     l.textColor = .black //ColorPiker.customDarkGray
     return l
   }()
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     
     contentView.addSubview(buyLable)
     setConstrain()
   }
   
   
   func setConstrain(){
     buyLable.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate([
       buyLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       buyLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
       buyLable.heightAnchor.constraint(equalToConstant: 48),
       buyLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
     ])
   }
   
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
}
