//
//  OderVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/02.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class OderVC : UIViewController {
  
  let tableView2 = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView2()
    
  }
  
  
  func setTableView2(){
    tableView2.dataSource = self
    tableView2.frame = view.frame
    tableView2.rowHeight = UITableView.automaticDimension //동적높이
    tableView2.backgroundColor = .white
    //tableView2.separatorStyle = .none
    tableView2.clipsToBounds = true
    view.addSubview(tableView2)
    
    tableView2.register(loginCell.self, forCellReuseIdentifier: "loginCell")//0
    tableView2.register(InformationCell.self, forCellReuseIdentifier: "InformationCell")//1
    tableView2.register(PaywithCell.self, forCellReuseIdentifier: "PaywithCell")//2
    tableView2.register(MembershipCell.self, forCellReuseIdentifier: "MembershipCell")//3
  }
  
}

extension OderVC : UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:  //로그인 유무
      return 1
    case 1: //주문자정보
      return 1
    case 2: //결제수단 선택
      return 1
    case 3: //할인방법 선택
      return 1
    case 4: //배달주문 내역
      return 1
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    case 1:
      let InformationCell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
      return InformationCell
    case 2:
      let PaywithCell = tableView.dequeueReusableCell(withIdentifier: "PaywithCell", for: indexPath) as! PaywithCell
      return PaywithCell
    case 3:
      let MembershipCell = tableView.dequeueReusableCell(withIdentifier: "MembershipCell", for: indexPath) as! MembershipCell
      return MembershipCell
    case 4:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    default:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    }
  }
  /*
   func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
   switch section {
   case 0:
   return " "
   case 1:
   return " "
   case 2:
   return " "
   case 3:
   return " "
   case 4:
   return " "
   default:
   return " "
   }
   }
   */
  /*
   func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
   switch section {
   case 0:
   return 1
   case 1:
   return 1
   case 2:
   return 1
   case 3:
   return 1
   case 4:
   return 1
   default:
   return 0
   }
   }*/
  
}

