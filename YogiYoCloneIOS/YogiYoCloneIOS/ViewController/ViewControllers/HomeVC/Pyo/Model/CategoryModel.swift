//
//  CategoryModel.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation

struct Category {
    let item: [item]
    
    struct item {
        let name: String
        let image: String
    }
}

let category = Category(
    item: [Category.item(name: "전체보기",
                         image: "전체보기"),
           
           Category.item(name: "요기요플러스",
                         image: "요기요플러스"),
           
           Category.item(name: "테이크아웃",
                         image: "테이크아웃"),
           
           Category.item(name: "중국집",
                         image: "중국집"),
           
           Category.item(name: "치킨",
                         image: "치킨"),
           
           Category.item(name: "한식",
                         image: "한식"),
           
           Category.item(name: "피자/양식",
                         image: "피자"),
           
           Category.item(name: "카페/디저트",
                         image: "카페"),
           
           Category.item(name: "분식",
                         image: "분식"),
           
           Category.item(name: "1인분주문",
                         image: "1인분주문"),
           
           Category.item(name: "일식/돈가스",
                         image: "일식"),
           
           Category.item(name: "야식",
                         image: "야식"),
           
           Category.item(name: "족발/보쌈",
                         image: "족발"),
           
           Category.item(name: "프랜차이즈",
                         image: "프랜차이즈"),
           
           Category.item(name: "편의점/마트",
                         image: "편의점"),
    ]
)
