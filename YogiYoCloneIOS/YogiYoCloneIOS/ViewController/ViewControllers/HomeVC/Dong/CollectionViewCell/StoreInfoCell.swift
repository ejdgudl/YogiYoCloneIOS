//
//  StoreInfoCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StoreInfoCell: UICollectionViewCell {
    
    // MARK: Properties
    static let cellID = "StoreInfoCellID"
    
    private var minPrice = 10000
    private var deliPrice = 10000
    private var payMent = "요기서 결제"
    
    let numberFormatter = NumberFormatter()
    
    private lazy var minOrderPrice: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: minPrice))
        let string = "최소주문  " + "\(price ?? "")" + "원"
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: NSRange(location: 0, length: 4))
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var payMentLbl: UILabel = {
        let label = UILabel()
        let string = "결제방법  \(payMent)"
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: NSRange(location: 0, length: 4))
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var deliveryPrice: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: deliPrice))
        let string = "배달요금  " + "\(price ?? "")" + "원"
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .semibold), range: NSRange(location: 0, length: 4))
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var payStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [minOrderPrice, payMentLbl, deliveryPrice])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .equalSpacing
//        stackView.alignment = .leading
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
        
        [payStackView].forEach {
            addSubview($0)
        }
        
        payStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(2)
            make.left.equalToSuperview().inset(2)
        }
    }
}
