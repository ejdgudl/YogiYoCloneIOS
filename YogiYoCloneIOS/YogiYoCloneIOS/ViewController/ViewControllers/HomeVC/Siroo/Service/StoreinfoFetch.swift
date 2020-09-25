//
//  Network.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//


import Alamofire
import SwiftyJSON
import Foundation

protocol RestaurantModelProtocol {
    func restaurantRetrived(restaurants: [AllListData.Results], index: Int)
}

class StoreinfoFetch {
    
    var restaurantListData = [AllListData?](repeating: nil, count: 5)
    var delegate: RestaurantModelProtocol?
    static var categories: [String] = [
        "전체보기",
        "중식",
        "치킨",
        "한식",
        "피자양식",
    ]
    
    static var payment_methods: [String] = [
        "현금",
        "신용카드",
        "요기서 결제",
    ]
    
    func fetchAll() {
        for (index, _) in StoreinfoFetch.categories.enumerated() {
            self.getRestaurnatData(index)
        }   
    }
    
    func getRestaurnatData (_ categoryIndex: Int) {
    
        var parameters: [String: String] = ["": ""]
        if categoryIndex > 0 {
            parameters = [
                "categories": StoreinfoFetch.categories[categoryIndex],
            ]
        }
                    
        AF.request(UrlBase.restaurantList, method: .get , parameters: parameters
        ).response { response in
            if response.data != nil {
                let result = JSON(response.data!)
                var rs: [AllListData.Results] = []
                let restaurants = result["results"]
                for (_, restaurant) in restaurants {
                    let id = restaurant["id"].intValue
                    let name = restaurant["name"].stringValue
                    let averageRating = restaurant["average_rating"].doubleValue
                    let image = restaurant["image"].stringValue
                    let deliveryDiscount = restaurant["delivery_discount"].intValue
                    let deliveryTime = restaurant["delivery_time"].stringValue
                    let reviewCount = restaurant["-review_count"].intValue
                    let representativeMenus = restaurant["representative_menus"].stringValue
                    let deliveryCharge = restaurant["delivery_charge"].intValue
                    
                    rs.append(AllListData.Results(id: id, name: name, averageRating: averageRating, image: image, deliveryDiscount: deliveryDiscount, deliveryCharge: deliveryCharge, deliveryTime: deliveryTime, reviewCount: reviewCount, representativeMenus: [representativeMenus] ))
                }
                
                self.restaurantListData[categoryIndex] = AllListData(next: result["next"].stringValue, previous: result["privious"].stringValue, results: rs)
                
                self.delegate?.restaurantRetrived(restaurants: rs, index: categoryIndex)
                
                
                
            }
        }
    }
    
}






