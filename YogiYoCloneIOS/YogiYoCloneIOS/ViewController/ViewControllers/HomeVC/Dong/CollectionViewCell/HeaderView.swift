//
//  HeaderView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos

class HeaderView: UICollectionReusableView {
    
    // MARK: Priperties
    static let cellID = "HeaderViewCellID"
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "TopImageView")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let storeLabel: UILabel = {
        let label = UILabel()
        label.text = "Store Name"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let cosmosView: CosmosView = {
       let view = CosmosView()
        view.settings.totalStars = 5
        view.rating = 3.2
        view.settings.starMargin = 1
        view.settings.fillMode = .precise
        view.settings.starSize = 15
        view.settings.filledColor = .red
        view.settings.emptyBorderColor = .lightGray
        return view
    }()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "Discout Label"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let deliveryTime: UILabel = {
        let label = UILabel()
        label.text = "Delivery Time"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeLabel, cosmosView, discountLabel, deliveryTime])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addBackgroundWithShadow(color: .white)
        return stackView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [imageView, stackView].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(16)
        }
    }
}
