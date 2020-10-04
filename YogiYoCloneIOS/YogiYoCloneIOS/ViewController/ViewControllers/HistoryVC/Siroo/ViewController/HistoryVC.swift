//
//  HistoryVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

protocol HistoryVCDelegate : class {
    func historyVCScrollIndex(to index : Int)
}

class HistoryVC: UIViewController,  CustomTopCategoryViewDelegate , UIScrollViewDelegate, HistoryEmptyViewdelegate {
    
    let orderTypes = ["터치주문", "전화주문"]
    let orderCounts = [2, 0]
    private let topBannerImages = [UIImage(named: "MyListbanner1"),UIImage(named: "MyListbanner2")]

    private var categoryIndex : Int = 0
    
    private var codeSegmented: CustomTopCategoryView?
    private let storeListVC = StoreListVC()
    
    private lazy var wrapperScrollView: UIScrollView = {
       return getWrapperScrollView()
    }()
    
    weak var historyVCDelegate : HistoryVCDelegate?
    
    var login : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        configurecodeSegmented()
        
        // 컨텐츠 view 만들기
        configureContentView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //    MARK: Configure
    
    func configurecodeSegmented() {
        codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: orderTypeTitle())
        codeSegmented?.backgroundColor = .white
        codeSegmented?.delegate = self
        view.addSubview(codeSegmented!)
    }
    
    /**
        segment 메뉴 타이틀 가져오기
     */
    func orderTypeTitle() -> [String] {
        var titles: [String] = []
        for (index, title) in orderTypes.enumerated() {
            titles.append("\(title) \(orderCounts[index])")
        }
        return titles
    }
    
    func orderTapButton() {
        navigationController?.pushViewController(storeListVC, animated: true)
        print("orderTapButton")
    }
    
    
    // MARK: view 셋팅 (autolayout 포함)
    func configureContentView() {
        view.addSubview(wrapperScrollView)
        configureWrapperScrollView()
        for index in 0 ..< orderTypes.count {
            let pageView = configurePageContentView(page: index)
            congifureBannerView(parentView: pageView, index: index)
//            configureEmptyView(parentView: pageView, index : index)
            configureTableView(parentView: pageView, index: index)
            
        }
    }
    
    /**
        스크롤뷰 기본셋팅하여 반환
     */
    func getWrapperScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorPiker.customGray
        scrollView.contentSize = CGSize(width: Int(view.frame.width) * orderTypes.count, height: Int(scrollView.frame.size.height))
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }
    
    /**
        스크롤뷰 autolayout 설정
        return: contentsView
     */
    func configureWrapperScrollView() {
        wrapperScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(55)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    /**
        페이지마다 전체를 감싸줄 contentView 설정
     */
    func configurePageContentView(page: Int) -> UIView {
        
        let xPosition = page * Int(view.frame.width)
        let pageView = UIView()
        
        if page == 0 {
            pageView.backgroundColor = .systemBlue
        } else {
            pageView.backgroundColor = .red
        }
        
        pageView.frame = CGRect(x: CGFloat(xPosition), y: 0, width: view.frame.width, height: view.frame.height)
        wrapperScrollView.addSubview(pageView)
        return pageView
        
        
    }
    
    /**
        bannerView 설정
     */
    func congifureBannerView(parentView: UIView, index: Int) {
        let imageView = UIImageView()
        imageView.image = topBannerImages[index]
        parentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(parentView)
            make.width.equalTo(parentView)
            make.height.equalTo(parentView.frame.width * 0.18)
        }
    }
    
    func configureEmptyView(parentView: UIView, index : Int) {
//        let emptyView = HistoryEmptyView()
//        emptyView.historyEmptyViewdelegate = self
//        emptyView.congigSetUI(index: index)
//        parentView.addSubview(emptyView)
//        emptyView.snp.makeConstraints { (make) in
//            make.bottom.leading.trailing.equalTo(parentView)
//            make.width.equalTo(parentView)
//            make.height.equalTo(parentView.frame.height - (parentView.frame.width * 0.18))
//        }

    }
    
//    MARK: Category에 따라 스크롤 이동 : category의 customView 를 delegate로 받음

    func historycategoryButtonScrollAction(to index: Int) {
        categoryIndex = index
        let offset: CGFloat = CGFloat(index) * self.view.frame.width
        wrapperScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        print("\(categoryIndex)")
        
    }
    
    func setIndex(_ offset: CGFloat) -> Int {
        return Int(offset / self.view.frame.width)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = setIndex(wrapperScrollView.contentOffset.x)
        if scrollIndex != categoryIndex {
            categoryIndex = scrollIndex
            codeSegmented?.indexChangedListener(categoryIndex)
        }
    }
    
    func categoryButtonScrollAction(to index: Int) {
        historycategoryButtonScrollAction(to: index)
        codeSegmented?.indexChangedListener(index)
    }
    
    func historyTableVCDelegate(id: Int) {
        print("TableviewDelegate")
    }
    
    func configureTableView(parentView : UIView, index : Int) {
        let historyTableView = HistoryTableVC()
        historyTableView.configureTableView(index: index)
        parentView.addSubview(historyTableView.view)
        historyTableView.view.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalTo(parentView)
            make.width.equalTo(parentView)
            make.height.equalTo(parentView.frame.height - (parentView.frame.width * 0.18))
        }
        
        
        
        
        
//                emptyView.snp.makeConstraints { (make) in
//                    make.bottom.leading.trailing.equalTo(parentView)
//                    make.width.equalTo(parentView)
//                    make.height.equalTo(parentView.frame.height - (parentView.frame.width * 0.18))
//                }
    }




}
