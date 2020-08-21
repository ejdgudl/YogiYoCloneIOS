//
//  DetailMenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailMenuVC: UIViewController {
// test용
//  let testsLable : UILabel = {
//    let l = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 90))
//  //  l.font = UIFont(name: FontModel.customSemibold, size: 20)
//    l.font = FontModel.toSize.customFont
//    l.numberOfLines = 2
//    l.text = "전화주문"//"피자알볼로(POSMENU FINAL)"
//    l.textColor = .black//ColorPiker.customDarkGray
//    return l
//  }()
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
 //   testsLable.center = self.view.center
 //   view.addSubview(testsLable)
    
  //  tableView.backgroundView = .red
    tableView.frame = UIScreen().bounds
    view.addSubview(tableView)
  }
  
        //
}

