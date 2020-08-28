//
//  BackView.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ShareView : UIView {
  
  let cancelButton : UIButton = {
    let b  = UIButton()
    b.backgroundColor = ColorPiker.customSystem
    b.setTitle("닫기", for: .normal)
    b.setTitleColor(ColorPiker.customDarkGray, for: .normal)
    b.contentMode = .center
    return b
  }()
  
  override init(frame: CGRect) {
  super.init(frame: frame)
   
    backgroundColor = .white
    addSubview(cancelButton)
    constrain()
  }
  
 @objc func cancelDidTap(_ sender: UIButton){
  print("ss")
  }
  
  func constrain(){
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      cancelButton.heightAnchor.constraint(equalToConstant: 44),
      cancelButton.widthAnchor.constraint(equalTo: widthAnchor),
      cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
}

