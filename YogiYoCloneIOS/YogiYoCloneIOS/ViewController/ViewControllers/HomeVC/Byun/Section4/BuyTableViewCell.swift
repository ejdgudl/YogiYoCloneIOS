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
  
  let minusButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "minus"), for: .normal)
    b.tintColor = ColorPiker.customDarkGray
    b.layer.borderWidth = 1
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    //b.tintColor = .black
    return b
  }()
  
  let countLable : UILabel = {
    let l = UILabel()
    l.text = "1"
    l.textAlignment = .center
    l.layer.borderWidth = 1
    l.layer.borderColor = ColorPiker.customDarkGray.cgColor
    return l
  }()
  
  let plusButton : UIButton = {
    let b = UIButton()
    b.setImage(UIImage(systemName: "plus"), for: .normal)
    b.layer.borderWidth = 1
    b.layer.borderColor = ColorPiker.customDarkGray.cgColor
    b.tintColor = .black
    return b
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstrain()
  }
  
  func setUI(){
    [buyLable,minusButton,countLable,plusButton].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
  }
  struct stackSize {
    static let stack: CGFloat = 40
  }
  
  func setConstrain(){
    NSLayoutConstraint.activate([
      buyLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      buyLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      buyLable.heightAnchor.constraint(equalToConstant: 48),
      buyLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      
      //   plusButton.centerYAnchor.constraint(equalTo: buyLable.centerYAnchor),
      plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      plusButton.widthAnchor.constraint(equalToConstant: stackSize.stack),
      plusButton.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
      countLable.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: 1),
      countLable.widthAnchor.constraint(equalToConstant: 60),
      countLable.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
      minusButton.trailingAnchor.constraint(equalTo: countLable.leadingAnchor, constant: 1),
      minusButton.widthAnchor.constraint(equalToConstant: stackSize.stack),
      minusButton.heightAnchor.constraint(equalToConstant: stackSize.stack),
      
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
