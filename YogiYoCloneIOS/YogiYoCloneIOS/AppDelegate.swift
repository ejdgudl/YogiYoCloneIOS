//
//  AppDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import Firebase
import NaverThirdPartyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        KakaoSDKCommon.initSDK(appKey: "4885bdd8a886942a7d87a2767de2b999")
        
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        
        instance?.isNaverAppOauthEnable = true
        instance?.isInAppOauthEnable = true
        instance?.serviceUrlScheme = kServiceAppUrlScheme
        instance?.consumerKey = kConsumerKey
        instance?.consumerSecret = kConsumerSecret
        instance?.appName = kServiceAppName
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DetailMenuVC())
//        window?.rootViewController = MainTabVC()
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        } else {
            NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
        }
        return false
    }

}
