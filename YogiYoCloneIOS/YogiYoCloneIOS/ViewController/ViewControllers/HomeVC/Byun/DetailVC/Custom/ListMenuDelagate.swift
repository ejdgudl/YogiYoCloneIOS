//
//  ListMenuDelagate.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

//MARK:- ListMenuDelagate
//선택사항
extension DetailMenuVC : ListMenuDelagate {
  
  func menuCheckdidTap(_ cell: UITableViewCell, check: Bool) {
    // 체크 ===> 필수값을 유저가 선택했는지 (참/거짓을 전달)
    guard let indexPath = tableView.indexPath(for: cell)
    else {return}
     let item = data!.optionGroup[indexPath.section-2]!.option[indexPath.row-1]
     let optionItem = OrderData.Option(id: item.id, name: item.name, price: item.price, optionGroupId: item.optionGroupId, selectPos: item.selectPos)
    
    if check {
      self.orderlist?.option.append(optionItem)
      print("self.orderlist?.option : \(self.orderlist?.option)")
      reCalculatePriceAndDisplay()
    }else {
      orderlist?.option.enumerated().forEach { (index, myItem) in
        print("삭제 좀 하고 싶어요")
        if myItem.name == item.name {
          orderlist?.option.remove(at: index)
        }
      }
      reCalculatePriceAndDisplay()
    }
    
  }
}
