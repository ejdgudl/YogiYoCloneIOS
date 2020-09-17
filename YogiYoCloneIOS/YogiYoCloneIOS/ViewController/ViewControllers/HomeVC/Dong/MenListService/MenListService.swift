//
//  MenListService.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/13.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Alamofire

extension MenuListVC {
    
    func storeInfoService(selfVC: MenuListVC) {
        AF.request("http://52.79.251.125/restaurants/2", method: .get, encoding: URLEncoding.default).response { (response) in
            print(response)
            guard let data = response.data else {return}
            
            let json = try? JSONDecoder().decode(RestaurantInstanceData.self, from: data)
            guard let storeInfo = json else { return }
            self.storeInfo = storeInfo
        }
    }
}
