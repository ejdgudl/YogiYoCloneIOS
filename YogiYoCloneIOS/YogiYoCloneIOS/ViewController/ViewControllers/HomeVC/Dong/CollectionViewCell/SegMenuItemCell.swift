//
//  SegMenuItemCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SegMenuItemCell: UICollectionViewCell {
    
    // MARK: Properties
    static let cellID = "SegMenuItemCellID"
    
    private var menuTitle = "육쌈 냉면"
    private var menuPrice = 10000
    
    let numberFormatter = NumberFormatter()
    
    private var menuImageButotn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "TopImageView"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(menuTitle)"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var menuPriceLabel: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: menuPrice))
        label.text = "\(price ?? "")원"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [menuTitleLabel, menuPriceLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        numberFormatter.numberStyle = .decimal
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [menuImageButotn, menuStackView].forEach {
            addSubview($0)
        }
        
        menuImageButotn.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.6)
        }
        
        menuStackView.snp.makeConstraints { (make) in
            make.top.equalTo(menuImageButotn.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(10)
        }
    }
}
