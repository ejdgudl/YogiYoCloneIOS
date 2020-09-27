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
    var lastRequest = ""
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

        let previousData: AllListData? = self.restaurantListData[categoryIndex]
        //"http://52.79.251.125/restaurants?categories=%;EC%B9%98%ED%82%A8&cursor=cD0yMQ%3D%3D&payment_methods=%ED%98%84%EA%B8%88" => next
        //"http://52.79.251.125/restaurants" => UrlBase.restaurantList
        
        var url: String?
        var parameters: [String: String] = ["": ""]
        
        /*
        조건1: previousData 이 nil 이면 첫페이지
            - 첫페이지에서 카테고리가 전체보기가 아닌경우만 querystring (parameter)을 넣어준다
        조건2: previousData가 존재하고 previousData.next 가 존재 하면 next 를 request한다.
            - next에는 querystring이 이미 존재 하기 때문에 paramerter를 비어둔다
        -- previousData가 존재하고 next가 nil이면 마지막 페이지다. 요청을 중지한다.
        */
        
        // 각 조건에 맞는 url 을 넣는다(previous 값이 있을때, 없을때 , next 가 있을때 없을때)
        if previousData == nil {
            url = UrlBase.restaurantList
            if categoryIndex > 0 {
                parameters = [
                    UrlBase.category: StoreinfoFetch.categories[categoryIndex],
                ]
            }
        } else if previousData != nil && previousData?.next != nil {
            url = (previousData?.next)!
            
        }
        
        // 조건문 : url 이 nil 값이면 모든데이터를 가져오고, previousData 가 있으면, lastRequest 값이 url 과 다르면, 아래 리퀘스트 실행하고, 아니면 중지하여 중복데이터 로딩 방지
        if url != nil && (previousData == nil || lastRequest != url) {
            print("category \(categoryIndex) - \(url)")
            lastRequest = url!
            AF.request(url!, method: .get , parameters: parameters
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
                        let reviewCount = restaurant["review_count"].intValue
                        let representativeMenus = restaurant["representative_menus"].stringValue
                        let deliveryCharge = restaurant["delivery_charge"].intValue
                        
                        rs.append(AllListData.Results(id: id, name: name, averageRating: averageRating, image: image, deliveryDiscount: deliveryDiscount, deliveryCharge: deliveryCharge, deliveryTime: deliveryTime, reviewCount: reviewCount, representativeMenus: [representativeMenus] ))
                    }
                    
                    self.restaurantListData[categoryIndex] = AllListData(
                        next: result["next"].stringValue,
                        previous: result["privious"].stringValue,
                        results: rs
                    )
                    
                    self.delegate?.restaurantRetrived(restaurants: rs, index: categoryIndex)

                }
            }
        }
    }
    
}






