//
//  HistoryVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class HistoryVCBackup: UIViewController,  CustomTopCategoryViewDelegate , UIScrollViewDelegate, HistoryEmptyViewdelegate {
    func categoryButtonScrollAction(to index: Int) {
        print(index)
    }
    
    private var codeSegmented: CustomTopCategoryView?
    private let storeListVC = StoreListVC()
    private let historyEmptyViews : [HistoryEmptyView] = [HistoryEmptyView(), HistoryEmptyView()]
    private let myorderbanner : [MyOrderListBannerView] = [MyOrderListBannerView(),MyOrderListBannerView()]
    
    
    var login : Bool = true
    var touchorder : Int = 2
    var phoneorder : Int = 0
    
    private lazy var MyOrderListtopBannerView: MyOrderListBannerView = {
        let view = MyOrderListBannerView()
        view.myOrderListbannerScrollView.delegate = self
        return view
    }()
    
    private lazy var MyOrderListBigScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorPiker.customGray
        scrollView.contentSize = CGSize(width: self.view.frame.width * 2, height: scrollView.frame.height)
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorPiker.customSystem
        
        configurecodeSegmented()
        configureMyOrderListScrollview()
        congigureTopbanner()
        
        
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
    
    func configurecodeSegmented() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["터치주문 \(touchorder)", "전화주문 \(phoneorder)"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
        
    }
    
    func configureMyOrderListScrollview(){
        view.addSubview(MyOrderListBigScrollView)
        MyOrderListBigScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(55)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func congigureTopbanner() {
//        MyOrderListtopBannerView.setContentView(width: Int(view.frame.width))
        
        MyOrderListBigScrollView.addSubview(MyOrderListtopBannerView)
        MyOrderListtopBannerView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(MyOrderListBigScrollView)
            make.width.equalTo(MyOrderListBigScrollView)
            make.height.equalTo(MyOrderListtopBannerView.snp.width).multipliedBy(0.18)
        }
        
        configureEmptyViews()
    }
    
    func configureEmptyViews() {
        for (index, vc) in historyEmptyViews.enumerated() {
            let emptyView = vc.congigSetUI(index: index)
            MyOrderListBigScrollView.addSubview(emptyView)
            emptyView.snp.makeConstraints { (make) in
                make.top.equalTo(MyOrderListtopBannerView.snp.bottom).offset(10)
                make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
                
            }
        }
        
    }
    
    func orderTapButton() {
        navigationController?.pushViewController(storeListVC, animated: true)
    }
}
