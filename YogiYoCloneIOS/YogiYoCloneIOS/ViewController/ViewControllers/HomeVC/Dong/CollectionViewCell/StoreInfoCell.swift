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
    let numberFormatter = NumberFormatter()
    
    private let minOrderPriceTitle: UILabel = {
       let label = UILabel()
        label.text = "최소주문"
        return label
    }()
    
    private lazy var minOrderPrice: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: minPrice))
        label.text = "\(price ?? "")" + "원"
        return label
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
        backgroundColor = .black
        
    }
}
