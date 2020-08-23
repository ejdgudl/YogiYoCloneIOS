//
//  WalletCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class WalletCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "WalletCellID"
    
    private let myCouponButton: UIButton = {
        let button = UIButton()
        button.setTitle("쿠폰함\n-",
            for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let myPointButton: UIButton = {
        let button = UIButton()
        button.setTitle("포인트\n-",
            for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let myReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("리뷰관리\n0건",
            for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var deviderView1: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var deviderView2: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [myCouponButton, myPointButton, myReviewButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        [deviderView1, deviderView2].forEach {
            stackView.addSubview($0)
        }
        
        deviderView1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.myPointButton.snp.left)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(0.4)
        }
        
        deviderView2.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.myPointButton.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(0.4)
        }
    }
}
