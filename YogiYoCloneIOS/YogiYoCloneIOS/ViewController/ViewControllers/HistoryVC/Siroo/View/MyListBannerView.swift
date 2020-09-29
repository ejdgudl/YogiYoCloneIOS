//
//  MyListBannerView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class MyOrderListBannerView: UIView {
    
    let MyOrderListbannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let MyOrderListbannerContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let MyOrderListbannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyListbanner1")
        return imageView
    }()
    
    private let MyOrderListbannerImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyListbanner2")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBannerScrollView()
        setContentView()
        setBannerImageView()
    }
    
    private func setBannerScrollView() {
        
        self.addSubview(MyOrderListbannerScrollView)
        
        MyOrderListbannerScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setContentView() {
        
        MyOrderListbannerScrollView.addSubview(MyOrderListbannerContentView)
        
        MyOrderListbannerContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.centerY.equalTo(MyOrderListbannerScrollView)
        }
    }
    private func setBannerImageView() {
        
        MyOrderListbannerContentView.addSubview(MyOrderListbannerImageView)
        
        MyOrderListbannerImageView.snp.makeConstraints {
            $0.top.width.leading.bottom.equalTo(MyOrderListbannerScrollView)
        }
        
        MyOrderListbannerContentView.addSubview(MyOrderListbannerImageView2)
        
        MyOrderListbannerImageView2.snp.makeConstraints {
            $0.top.width.bottom.equalTo(MyOrderListbannerScrollView)
            $0.leading.equalTo(MyOrderListbannerImageView.snp.trailing)
//            $0.trailing.equalTo(MyOrderListbannerContentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
