//
//  MyorderListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MyorderListVC: UIViewController,  CustomTopCategoryViewDelegate {
    func categoryButtonScrollAction(to index: Int) {
        print(index)
    }
    private var codeSegmented: CustomTopCategoryView?

    var login : Bool = true
    var touchorder : Int = 2
    var phoneorder : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorPiker.customSystem
        
        configure()
        
        if login == true{
            title = "회원 주문내역"
        } else  {
            title = "비회원 주문내역"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    MARK: Configure
    
    func configure() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["터치주문 \(touchorder)", "전화주문 \(phoneorder)"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
  
    }
    


}
