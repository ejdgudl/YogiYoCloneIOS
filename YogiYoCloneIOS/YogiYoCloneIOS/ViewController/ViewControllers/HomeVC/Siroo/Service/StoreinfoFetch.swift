//
//  Network.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//


import Alamofire
import SwiftyJSON


struct Congig {
    static let baseURL = "http://54.180.126.71/restaurants"
}

struct UserData : Decodable {
    let name : String
    let star : Int
    let image : URL
}

//AF.request("http://54.180.126.71/restaurants").responseJSON { (response) in
//    switch response.result {
//    case .success(let value)
//    }
//}





