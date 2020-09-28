//
//  MyorderListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MyorderListVC: UIViewController,  CustomTopCategoryViewDelegate , UIScrollViewDelegate {
    func categoryButtonScrollAction(to index: Int) {
        print(index)
    }
    private var codeSegmented: CustomTopCategoryView?

    var login : Bool = true
    var touchorder : Int = 2
    var phoneorder : Int = 0
    
    private lazy var MyOrderListtopBannerView: MyOrderListBannerView = {
        let view = MyOrderListBannerView()
        view.MyOrderListbannerScrollView.delegate = self
        return view
    }()
    
    private lazy var MyOrderListBigScrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.backgroundColor = ColorPiker.customGray
        scrollView.backgroundColor = .systemBlue
        scrollView.alwaysBounceVertical = true
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
        
//        codeSegmented.snp.makeConstraints { (make) in
//            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(codeSegmented.snp.height)
//        }

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
        MyOrderListBigScrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.leading.centerX.trailing.bottom.equalTo(MyOrderListBigScrollView)
        }
        contentView.addSubview(MyOrderListtopBannerView)
        MyOrderListtopBannerView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(MyOrderListBigScrollView)
            make.width.equalTo(MyOrderListBigScrollView)
            make.height.equalTo(MyOrderListtopBannerView.snp.width).multipliedBy(0.18)

        }
    }
    
    
    


}
