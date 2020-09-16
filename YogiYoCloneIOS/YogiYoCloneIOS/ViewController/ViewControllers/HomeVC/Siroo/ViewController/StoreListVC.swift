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

protocol StoreListVCDelegate : class {
    func scrollViewAction(to index: Int)
}

private let reuseIdentifier = "StoreListCell"

public let scrollView = UIScrollView()


class StoreListVC: UIViewController, CustomTopCategoryViewDelegate, RestaurantModelProtocol , UIScrollViewDelegate{
    
    
//    MARK: Properties
    
    private let storeListCell = StoreListCell()
    private let scrollView = UIScrollView()
    public var categoryIndex : Int = 0
    
    private var scrollViewIndex : Int  = 0

    private let first = CategoryVC()
    private let second = CategoryVC()
    private let third = CategoryVC()
    private let fourth = CategoryVC()
    private let fifth = CategoryVC()
    
    private let categoryVC : [UIViewController] = []
    
    private let fetchModel = StoreinfoFetch()
    
    private var codeSegmented: CustomTopCategoryView?
    
    weak var delegate: StoreListVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
        
        fetchModel.delegate = self
        configure()
        configureScrollView()
        categoryButtonScrollAction(to: categoryIndex)
        codeSegmented?.indexChangedListener(categoryIndex)
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
        second.restaurants = restaurants
        second.reload()
        third.restaurants = restaurants
        third.reload()
        fourth.restaurants = restaurants
        fourth.reload()
        fifth.restaurants = restaurants
        fifth.reload()

    }
//    MARK: Configure
    func configure() {
        codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: 50), categoryTitles: ["전체보기","중국집","치킨","한식","피자/양식","카페/디저트"])
        codeSegmented?.backgroundColor = .white
        codeSegmented?.delegate = self
        view.addSubview(codeSegmented!)
        self.configureTableView()
    }
    
    func configureTableView() {
        self.scrollView.addSubview(self.first.configureTableView(index: 0))
        self.scrollView.addSubview(self.second.configureTableView(index: 1))
        self.scrollView.addSubview(self.third.configureTableView(index: 2))
        self.scrollView.addSubview(self.fourth.configureTableView(index: 3))
        self.scrollView.addSubview(self.fifth.configureTableView(index: 4))
            }
    
    @objc func testButtonAction(sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .clear
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
  
        }
        
        scrollView.delegate = self
         
        scrollView.contentSize = CGSize(width: self.view.frame.width * 5, height: scrollView.frame.height)
        print("table 뷰의 \(scrollView.frame.height)")
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
    }
    
    
//    MARK: Category에 따라 스크롤 이동 : category의 customView 를 delegate로 받음
    
    func categoryButtonScrollAction(to index: Int) {
        categoryIndex = index
        let offset: CGFloat = CGFloat(categoryIndex) * self.view.frame.width
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
    func setIndex(_ offset: CGFloat) -> Int {
        return Int(offset / self.view.frame.width)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = setIndex(scrollView.contentOffset.x)
        if scrollIndex != categoryIndex {
            categoryIndex = scrollIndex
            codeSegmented?.indexChangedListener(categoryIndex)
        }
    }
    
    // 스크롤의 인덱스 값을 categoryView에 델리게이트로 넘겨 받은 후, 구현.
    
}
            

