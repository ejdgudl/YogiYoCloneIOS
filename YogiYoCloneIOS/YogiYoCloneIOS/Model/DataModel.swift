//
//  DataModel.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation

<<<<<<< HEAD
struct RestaurantListData: Codable {
    
    let next: String
    let previous: String?
    let results: [Results]
    
=======
struct RecommendData: Codable {
    
    let results: [Results]
    
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let star: Double
        let image: String
        let foodImage: String?
        
        
        let deliveryDiscount: Int
        let deliveryCharge: Int
        let deliveryTime: String
        
        let bookmarkCount: Int
        let reviewCount:Int
        
        let representativeMenus: String
        let minOrderPrice:Int
        
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            case foodImage = "back_image"
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            case bookmarkCount = "bookmark_count"
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case minOrderPrice = "min_order_price"
        }
    }
}


struct LikeData: Codable {
    
    let next: String?
    let previous: String?
    let results: [Results]
    
    
>>>>>>> develop
    struct Results: Codable {
        
        let id: Int
        let name: String
        let star: Double
        let image: String
<<<<<<< HEAD
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int
        let categories: [String]
        
        enum CodingKeys: String, CodingKey {
            case id, name, star, image, categories
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
        }

=======
        let foodImage: String?
        
        let deliveryDiscount: Int
        let deliveryCharge: Int
        let deliveryTime: String
        
        let reviewCount:Int
        let representativeMenus: String
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            case foodImage = "back_image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
    }
}
struct SearchData : Codable{
  let id : Int?
  let name : String?

  init(id: Int, name: String) {
        self.id = id
        self.name = name
}
  enum CodingKeys: String, CodingKey {
      case id = "id"
      case name = "name"
}
}
struct DidSearchData: Codable {
    
    let next: String?
    let previous: String?
    var results: [Results]?
    
    
    struct Results: Codable {
        
        let id: Int?
        let name: String?
        let star: Double?
        let image: String?
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int?
        let deliveryTime: String?
        
        let reviewCount:Int?
        let representativeMenus: String?
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
    }
}
struct SearchDataload: Codable {
    
    let next: String?
    let previous: String?
    var results: [Results]?
    
    
    struct Results: Codable {
        
        let id: Int?
        let name: String?
        let star: Double?
        let image: String?
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int?
        let deliveryTime: String?
        
        let reviewCount:Int?
        let representativeMenus: String?
        let ownerCommentCount:Int?
        
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case star = "average_rating"
            case image = "image"
            
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
            case ownerCommentCount = "owner_comment_count"
        }
>>>>>>> develop
    }
}


<<<<<<< HEAD
=======
struct AllListData: Codable {
    
    let next: String?
    let previous: String?
    let results: [Results]
    
    struct Results: Codable {
        
        let id: Int
        let name: String
        let averageRating: Double
        let image: String
        
        let deliveryDiscount: Int?
        let deliveryCharge: Int
        let deliveryTime: String
        let reviewCount: Int
        let representativeMenus: [String]
        
        enum CodingKeys: String, CodingKey {
            case id, name, image
            case averageRating = "average_rating"
            case deliveryDiscount = "delivery_discount"
            case deliveryCharge = "delivery_charge"
            case deliveryTime = "delivery_time"
            case reviewCount = "review_count"
            case representativeMenus = "representative_menus"
        }
        
    }
}
>>>>>>> develop


struct RestaurantInstanceData: Codable {
    
    let id: Int
    let name: String
<<<<<<< HEAD
    let star: Double
    let image: String
    
    let notification: String
    let openingHours: String
=======
    
    let averageRating: Double
    let averageTaste: Double
    let averageDelivery: Double
    let averageAmount: Double
    
    let image: String
    let backImage: String?
    
    let notification: String
    let openingTime: String
    let closingTime: String
>>>>>>> develop
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
    
<<<<<<< HEAD
    let backImage: String
    let lat: Double
    let lng: Double
    
    let menuGroup: [Menu_group]
    
    enum CodingKeys: String, CodingKey {
        case id, name, star, image, notification, address, lat, lng
        case openingHours = "opening_hours"
        case telNumber = "tel_number"
        case minOrder = "min_order"
=======
    //    let lat: Double
    //    let lng: Double
    
    
    let photoMenu: [PhotoMenu]
    let menuGroup: [MenuGroup]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, notification, address
        
        case averageRating = "average_rating"
        case averageTaste = "average_taste"
        case averageDelivery = "average_delivery"
        case averageAmount = "average_amount"
        
        case backImage = "back_image"
        
        case openingTime = "opening_time"
        case closingTime = "closing_time"
        case telNumber = "tel_number"
        case minOrder = "min_order_price"
>>>>>>> develop
        case paymentMethods = "payment_methods"
        case businessName = "business_name"
        case companyRegistrationNumber = "company_registration_number"
        case originInformation = "origin_information"
        case deliveryDiscount = "delivery_discount"
        case deliveryCharge = "delivery_charge"
        case deliveryTime = "delivery_time"
<<<<<<< HEAD
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
=======
        
        case photoMenu = "photo_menu"
        case menuGroup = "menu_group"
    }
}

struct PhotoMenu: Codable {
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let menuGroupID: Int
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case menuGroupID = "menu_group_id"
    }
    
}

struct MenuGroup: Codable {
    
    let name: String
    var menu: [Menu]
    
    
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

struct MenuData: Codable {
>>>>>>> develop
    
    let id: Int
    let name: String
    let image: String
    let caption: String
    let price: Int
<<<<<<< HEAD
    let optionGroup: [Option_group?]
=======
    var optionGroup: [OptionGroup?]
>>>>>>> develop
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, caption, price
        case optionGroup = "option_group"
    }
    
    
<<<<<<< HEAD
    struct Option_group: Codable {
=======
    struct OptionGroup: Codable {
>>>>>>> develop
        
        let id: Int
        let name: String
        let menuId: Int
        
        let mandatory: Bool
<<<<<<< HEAD
        let option: [Option]
=======
        var option: [Option]
>>>>>>> develop
        
        enum CodingKeys: String, CodingKey {
            case id, name, mandatory, option
            case menuId = "menu_id"
        }
        
        struct Option: Codable {
            
            let id: Int
            let name: String
            let price: Int
            let optionGroupId: Int
<<<<<<< HEAD
=======
            var selectPos: Bool = false
>>>>>>> develop
            
            enum CodingKeys: String, CodingKey {
                case id, name, price
                case optionGroupId = "option_group_id"
            }
        }
    }
}



struct OrderData: Codable {
<<<<<<< HEAD
    
}



struct UrlBase {
    
    static let restaurantList = "http://54.180.126.71/restaurants"
    static let restaurantInstance = "http://54.180.126.71/restaurants/2"
    static let menuInstance = "http://54.180.126.71/menu/2"
    static let order = "http://54.180.126.71/order"
    
    static var lat = "37.545258"
    static var lon = "127.057174"
}
=======
    var menu: Int
    var name: String
    var count: Int
    var price: Int
    var option: [Option] = []
    var totalPrice: Int?
  init(menu: Int, name: String, count: Int, price: Int) {
        self.name = name
        self.menu = menu
        self.count = count
        self.price = price
        //self.option = option //초기화될경우 nil됨 ?때문에
    }
    struct Option: Codable {
      let id: Int
      let name: String
      let price: Int
      let optionGroupId: Int
      var selectPos: Bool = false
      enum CodingKeys: String, CodingKey {
          case id, name, price
          case optionGroupId = "option_group_id"
      }
  }
}
   
struct OrderListData : Codable {
        let next: String?
        let previous: String?
        let results: [Results]
        
        struct Results: Codable {
            
            let id: Int
            let orderMenu: String
            let restaurantName: String
            let restaurantImage: String
            let status : String
            let orderTime : String
            let reviewWritten : Bool
            
            enum CodingKeys: String, CodingKey {
                case id, status
                case orderMenu = "order_menu"
                case restaurantName = "restaurant_name"
                case restaurantImage = "restaurant_image"
                case orderTime = "order_time"
                case reviewWritten = "review_written"
            }
        }
    }


struct UrlBase {
        
        
        static let ip = "http://52.79.251.125/"
        
        static let recomend = "restaurants/home_view_"
        static let bookmarks = "bookmarks"
        
        static let listAll = "restaurants"
        static let category = "categories"
        static let instance = "restaurants/"
        
        static let menu = "menu/"
        
        static let payment = "payment_methods"
        
        static let ordering = "ordering"
        
        
        static let restaurantList = "http://52.79.251.125/restaurants"
        static let restaurantInstance = "http://52.79.251.125/restaurants/2"
        
        static let menuInstance = "http://52.79.251.125/menu/2"
        static let order = "http://52.79.251.125/orders"
        
        
        
        static var lat = "37.545258"
        static var lon = "127.057174"
    }
>>>>>>> develop
