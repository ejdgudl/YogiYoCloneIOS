//
//  OderModel.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

struct Oders {
        
 // var results: [restaurant]
  var restaurant : Int
  var order_menu : [orderMenu?]
  var address : String
  var delivery_requests : String
  var payment_method : String
  var total_price : Int
 
struct orderMenu {
  
  var menu : Int
  var name : String
  var count : Int
  var price : Int
  var order_option_group : [orderOptionGroup?]
}

struct orderOptionGroup {
  var mandatory : Bool
  var order_option : [orderOption?]
 
}
  struct orderOption {
    var name : String
    var price : Int
}
  
}
