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
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int
        let categories: [String]
        
        enum CodingKeys: String, CodingKey {
            case id, name, star, image, categories
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
        }

    }
}




struct RestaurantInstanceData: Codable {
    
    let id: Int
    let name: String
    let star: Double
    let image: String
    
    let notification: String
    let openingHours: String
    let telNumber: String
    let address: String
    
    let minOrder: Int
    let paymentMethods: [String]
    
    let businessName: String
    let companyRegistrationNumber: String
    let originInformation: String
    
    let deliveryDiscount: Int
    let deliveryCharge: Int
    let deliveryTime: String
    
    let backImage: String
    let lat: Double
    let lng: Double
    
    let menuGroup: [Menu_group]
    
    enum CodingKeys: String, CodingKey {
        case id, name, star, image, notification, address, lat, lng
        case openingHours = "opening_hours"
        case telNumber = "tel_number"
        case minOrder = "min_order"
        case paymentMethods = "payment_methods"
        case businessName = "business_name"
        case companyRegistrationNumber = "company_registration_number"
        case originInformation = "origin_information"
        case deliveryDiscount = "delivery_discount"
        case deliveryCharge = "delivery_charge"
        case deliveryTime = "delivery_time"
        case backImage = "back_image"
        case menuGroup = "menu_group"
    }
    
    struct Menu_group: Codable {
        
        let id: Int
        let name: String
        let restaurantId: Int
        let menu: [Menu]
        
        enum CodingKeys: String, CodingKey {
            case id, name, menu
            case restaurantId = "restaurant_id"
        }
        
        
        struct Menu: Codable {
            
            let id: Int
            let name: String
            let image: String?
            
            let caption: String
            let menuGroupId: Int
            let price: Int
            
            enum CodingKeys: String, CodingKey {
                case id, name, image, caption, price
                case menuGroupId = "menu_group_id"
            }
        }
    }
}



struct MenuInstanceData: Codable {
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let price: Int
    let optionGroup: [Option_group?]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case optionGroup = "option_group"
    }
    
    
    struct Option_group: Codable {
        
        let id: Int
        let name: String
        let menuId: Int
        
        let mandatory: Bool
        let option: [Option]
        
        enum CodingKeys: String, CodingKey {
            case id, name, mandatory, option
            case menuId = "menu_id"
        }
        
        struct Option: Codable {
            
            let id: Int
            let name: String
            let price: Int
            let optionGroupId: Int
            
            enum CodingKeys: String, CodingKey {
                case id, name, price
                case optionGroupId = "option_group_id"
            }
        }
    }
}



struct OrderData: Codable {
    
}



struct UrlBase {
    
    static let ip = "http://52.79.251.125/"
    
    static let listAll = "restaurants"
    static let category = "?category="
    static let instance = "restaurants/"
    
    static let menu = "menu/"
    
    static let payment = "?payment_methods="
    
    static let order = "order"
    static let ordering = "_by="
    
    static var lat = "37.545258"
    static var lon = "127.057174"
}

/*
// MARK: category
 
 ip주소/restaurants?category=치킨
 카테고리는 아래와 같이 요청을 보내주시면 됩니다
 1인분주문
 프랜차이즈
 치킨
 피자양식
 중식
 한식
 일식돈까스
 족발보쌈
 야식
 분식
 카페디저트
 편의점
 테이크아웃
 
// MARK: 결제방식 필터링
 
 ip주소/restuarants?payment_methods=현금
 현금
 신용카드
 요기서결제
 
// MARK: 오더링
 
 ip주소/restuarants?order_by=delivery_charge
 delivery_charge
 star
 review
 min_order_price
 쿼리파라미터 두개 이상 쓸 때
 ex) ip주소/restaurants?category=치킨&order_by=star
 */
