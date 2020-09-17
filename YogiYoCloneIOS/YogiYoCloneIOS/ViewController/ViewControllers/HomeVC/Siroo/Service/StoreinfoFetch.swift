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
    func restaurantRetrived(restaurants: [AllListData.Results])
}

class StoreinfoFetch {
    
    var restaurantListData: AllListData?
    var delegate: RestaurantModelProtocol?
    
    init() {
        getRestaurnatData()
    }
    
    func getRestaurnatData () {
        AF.request(UrlBase.restaurantList, method: .get , parameters:  [:]
        ).response { response in
            if response.data != nil {
                let result = JSON(response.data!)
                var rs: [AllListData.Results] = []
                let restaurants = result["results"]
                for (_, restaurant) in restaurants {
                    let id = restaurant["id"].intValue
                    let name = restaurant["name"].stringValue
                    let star = restaurant["star"].doubleValue
                    let image = restaurant["image"].stringValue
                    let deliveryDiscount = restaurant["deliveryDiscount"].intValue
                    let deliveryTime = restaurant["deliveryTime"].stringValue
                    let reviewCount = restaurant["reviewCount"].intValue
                    let representativeMenus = restaurant["representativeMenus"].stringValue
                    let deliveryCharge = restaurant["deliveryCharge"].intValue
//                    let categories = restaurant["categories"].stringValue
                    
                    rs.append(AllListData.Results(id: id, name: name, star: star, image: image, deliveryDiscount: deliveryDiscount, deliveryCharge: deliveryCharge, deliveryTime: deliveryTime, reviewCount: reviewCount, representativeMenus: [representativeMenus]))
                }
                
                self.restaurantListData = AllListData(next: result["next"].stringValue, previous: result["privious"].stringValue, results: rs)
                self.delegate?.restaurantRetrived(restaurants: rs)
                
            }
        }
    }
    
}






