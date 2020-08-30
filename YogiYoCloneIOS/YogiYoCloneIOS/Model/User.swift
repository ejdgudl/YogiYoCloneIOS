//
//  User.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import Foundation

struct User {
    
    var nickName: String?
    var phoneNum: String?
    var email: String?
    
    init(nickName: String, phoneNum: String, email: String = " ") {
        self.nickName = nickName
        self.phoneNum = phoneNum
        self.email = email
    }
}
