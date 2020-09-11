//
//  DataModel.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation

struct RestaurantListData: Codable {
    
    let next: String
    let previous: String?
    let results: [Results]
    
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let star: Double
        let image: String
        
        let delivery_discount: Int
        let delivery_charge: Int
        let categories: [String]
    }
}



struct RestaurantInstanceData: Codable {
    
    let id: Int
    let name: String
    let star: Double
    let image: String
    
    let notification: String
    let opening_hours: String
    let tel_number: String
    let address: String
    
    let min_order: Int
    let payment_methods: [String]
    
    let business_name: String
    let company_registration_number: String
    let origin_information: String
    
    let delivery_discount: Int
    let delivery_charge: Int
    let delivery_time: String
    
    let back_image: String
    let lat: Double
    let lng: Double
    
    let menu_group: [Menu_group]
    
    
    struct Menu_group: Codable {
        
        let id: Int
        let name: String
        let restaurant_id: Int
        let menu: [Menu]
        
        
        struct Menu: Codable {
            
            let id: Int
            let name: String
            let image: String?
            
            let caption: String
            let menu_group_id: Int
            let price: Int
        }
    }
}



struct MenuInstanceData: Codable {
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let price: Int
    let option_group: [Option_group?]
    
    
    struct Option_group: Codable {
        
        let id: Int
        let name: String
        let menu_id: Int
        
        let mandatory: Bool
        let option: [Option]
        
        
        struct Option: Codable {
            
            let id: Int
            let name: String
            let price: Int
            let option_group_id: Int
        }
    }
}



struct OrderData: Codable {
    
}



struct UrlBase {
    
    static let restaurantList = "http://54.180.126.71/restaurants"
    static let restaurantInstance = "http://54.180.126.71/restaurants/2"
    static let menuInstance = "http://54.180.126.71/menu/2"
    static let order = "http://54.180.126.71/order"
    
    static var lat = "37.545258"
    static var lon = "127.057174"
}
