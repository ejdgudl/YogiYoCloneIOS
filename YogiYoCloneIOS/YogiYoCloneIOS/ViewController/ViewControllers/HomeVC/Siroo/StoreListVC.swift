//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class StoreListVC: UIViewController {

    
    private var interfaceSegmented: CustomTopCategoryView! {
        didSet{
            interfaceSegmented.setButtonTitles(categoryTitles: ["전체보기","1인주문","치킨","중국집"])
            interfaceSegmented.selectorViewColor = .systemRed
            interfaceSegmented.selectorTextColor = .systemRed
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .purple
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
//        configure()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK:  @objc
    @objc private func didTapNext() {
        let menuListVC = MenuListVC()
        navigationController?.pushViewController(menuListVC, animated: true)
    }
    
    
//    MARK: Configure
    func configure() {
        
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체보기","1인주문","치킨","중국집"])
        codeSegmented.backgroundColor = .gray
        view.addSubview(codeSegmented)





    }
    
    
    
}
