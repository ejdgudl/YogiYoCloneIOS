//
//  CellModel.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

// MARK: - Detail
struct Detail: Codable {
 //   let id: Int
    let name: String
    let image: String
    let caption: String
    let price: Int
    let optionGroup: [OptionGroup]

    enum CodingKeys: String, CodingKey {
        case name, image, caption, price
        case optionGroup = "option_group"
    }
}

// MARK: - OptionGroup
struct OptionGroup: Codable {
   // let id: Int
    let name: String
   // let menuID: Int
    let mandatory: Bool
    let option: [Option]

    enum CodingKeys: String, CodingKey {
        case name//id, name
     //   case menuID = "menu_id"
        case mandatory, option
    }
}

// MARK: - Option
struct Option: Codable {
    let id: Int
    let name: String
    let price, optionGroupID: Int

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case optionGroupID = "option_group_id"
    }
}


func test() {
  var request = URLRequest(url: URL(string: "http://54.180.126.71/menu/10")!)
  request.httpMethod = "GET"
  
  URLSession.shared.dataTask(with: request) { (data, _, _) in
    guard let data = data else { return }
    do {
      let detail = try JSONDecoder().decode(Detail.self, from: data)
      dump(detail)
      
    } catch  {
      print(error.localizedDescription)
    }
  }.resume()
}

//test()


