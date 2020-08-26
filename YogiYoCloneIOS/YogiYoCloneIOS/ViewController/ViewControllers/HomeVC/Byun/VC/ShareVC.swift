//
//  ShardVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
//
class ShareVC: UIViewController {

  let shareView = ShareView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = ColorPiker.customAlpha2
      shareViewFrame()
    }
  
    func shareViewFrame(){
      shareView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 40, height: view.frame.height/3)
      shareView.center = view.center
      view.addSubview(shareView)
    }
  
}
