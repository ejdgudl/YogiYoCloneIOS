//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class StoreListVC: UIViewController, CustomTopCategoryViewDelegate{
    func change(to index: Int) {
        print("click \(index)")
    }
    

//    MARK: Properties
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = ColorPiker.customSystem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))

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
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체보기","1인주문","치킨","중국집","디저트"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
    }
    
    
    
    
}
