//
//  UITableViewDataSource.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


//MARK:-UITableViewDataSource
extension OderVC : UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:  //로그인 유무
      return 1
    case 1://주문자정보
      if open == false {
        return 2
      }else {
        return 2 + 1
      }
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
      switch indexPath.row {
      case 0:
        let InformationCell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        return InformationCell
      case 1:
        let CustomOderCell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderCell", for: indexPath) as! CustomOrderCell
        _ = false
        CustomOderCell.configure(title: "\(userString)")
        // print(userString)
        return CustomOderCell
        
      default:
        let unMembershipCell = tableView.dequeueReusableCell(withIdentifier: "unMembershipCell", for: indexPath) as!
          unMembershipCell
        return unMembershipCell
      }
    case 2:
      let PaywithCell = tableView.dequeueReusableCell(withIdentifier: "PaywithCell", for: indexPath) as! PaywithCell
      return PaywithCell
    case 3:
      let MembershipCell = tableView.dequeueReusableCell(withIdentifier: "MembershipCell", for: indexPath) as! MembershipCell
      return MembershipCell
    case 4:
      let OrderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListCell", for: indexPath) as! OrderListCell
      print("오더리스트셀 제발 알려주세요", indexPath)
      OrderListCell.orderData = orderList
      
      return OrderListCell
    case 5 :
      let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! paymentCell
      return paymentCell
    default:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    }
  }
}
