//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

private let reuseIdentifier = "StoreListCell"

class StoreListVC: UIViewController, CustomTopCategoryViewDelegate, RestaurantModelProtocol {
    
    func change(to index: Int) {
        print("click \(index)")
    }
    
//    MARK: Properties
    
    private let storeListCell = StoreListCell()
    private let scrollView = UIScrollView()
    
    private let first = CategoryVC()
    private let second = CategoryVC()
    private let third = CategoryVC()
    private let fourth = CategoryVC()
    private let fifth = CategoryVC()
    
    private let fetchModel = StoreinfoFetch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
        
        fetchModel.delegate = self
        configure()
        configureScrollView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK:  @objc
    @objc private func didTapNext() {
        let menuListVC = MenuListVC()
        navigationController?.pushViewController(menuListVC, animated: true)
    }
    
//    MARK: fetch event
    func restaurantRetrived(restaurants: [RestaurantListData.Results]) {
        first.restaurants = restaurants
        first.reload()
    }
//    MARK: Configure
    func configure() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체보기","1인주문","치킨","중국집","디저트"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
        self.configureTableView()
    }
    
    func configureTableView() {
        self.scrollView.addSubview(self.first.configureTableView(index: 0))
        self.scrollView.addSubview(self.second.configureTableView(index: 1))
        self.scrollView.addSubview(self.third.configureTableView(index: 2))
        self.scrollView.addSubview(self.fourth.configureTableView(index: 3))
        self.scrollView.addSubview(self.fifth.configureTableView(index: 4))
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .clear
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
        scrollView.contentSize = CGSize(width: 415 * 5, height: scrollView.frame.height)
        print("table 뷰의 \(scrollView.frame.height)")
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
    }
}
