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
    func restaurantRetrived(restaurants: [RestaurantListData.Results])
}

class StoreinfoFetch {
    
    var restaurantListData: RestaurantListData?
    var delegate: RestaurantModelProtocol?
    
    init() {
        getRestaurnatData()
    }
    
    func getRestaurnatData () {
        AF.request(UrlBase.restaurantList, method: .get , parameters:  [:]
        ).response { response in
            if response.data != nil {
                let result = JSON(response.data!)
                var rs: [RestaurantListData.Results] = []
                let restaurants = result["results"]
                for (_, restaurant) in restaurants {
                    let id = restaurant["id"].intValue
                    let name = restaurant["name"].stringValue
                    let star = restaurant["star"].doubleValue
                    let image = restaurant["image"].stringValue
                    let deliveryDiscount = restaurant["deliveryDiscount"].intValue
                    let categories = restaurant["categories"].stringValue
                    
                    
                    
                rs.append(RestaurantListData.Results(id: id, name: name, star: star, image: image, deliveryDiscount: deliveryDiscount, deliveryCharge: 4000, categories: [categories]))
                }
                
                self.restaurantListData = RestaurantListData(next: result["next"].stringValue, previous: result["privious"].stringValue, results: rs)
                self.delegate?.restaurantRetrived(restaurants: rs)
                
            }
        }
    }
    
}






