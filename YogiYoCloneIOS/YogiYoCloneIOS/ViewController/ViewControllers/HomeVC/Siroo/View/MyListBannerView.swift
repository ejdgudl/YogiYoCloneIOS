//
//  MyListBannerView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MyListBannerView: UIView {
    
    private let MyOrderListScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
