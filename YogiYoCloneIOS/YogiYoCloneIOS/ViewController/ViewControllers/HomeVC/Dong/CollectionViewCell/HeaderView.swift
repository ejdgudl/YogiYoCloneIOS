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
<<<<<<< HEAD
=======
import Kingfisher
>>>>>>> develop

class HeaderView: UICollectionReusableView {
    
    // MARK: Priperties
<<<<<<< HEAD
=======
    var storeInfo: RestaurantInstanceData? {
        didSet {
            guard let storeInfo = storeInfo else { return }
            if let image = storeInfo.backImage {
                let url = URL(string: image)
                imageView.kf.setImage(with: url)
            }
            storeLabel.text = storeInfo.name
            cosmosView.rating = storeInfo.averageRating
            discountLabel.text = "\(numberFormatter.string(from: NSNumber(value: storeInfo.deliveryDiscount))!)원 할인"
            deliveryTime.text = "배달예상시간 \(storeInfo.deliveryTime)"
            cosmosView.text = "\(storeInfo.averageRating)"
        }
    }
    
>>>>>>> develop
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
<<<<<<< HEAD
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
=======
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
>>>>>>> develop
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
<<<<<<< HEAD
        view.settings.filledColor = .red
        view.settings.emptyBorderColor = .lightGray
        return view
    }()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "Discout Label"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
=======
        view.settings.emptyBorderColor = .lightGray
        view.settings.filledImage = UIImage(named: "star")
        return view
    }()
    
    let label = UILabel()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .systemRed
>>>>>>> develop
        return label
    }()
    
    let deliveryTime: UILabel = {
        let label = UILabel()
<<<<<<< HEAD
        label.text = "Delivery Time"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
=======
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
>>>>>>> develop
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeLabel, cosmosView, discountLabel, deliveryTime])
        stackView.axis = .vertical
        stackView.spacing = 2
<<<<<<< HEAD
        stackView.distribution = .equalSpacing
=======
        stackView.distribution = .fillProportionally
>>>>>>> develop
        stackView.alignment = .center
        stackView.addBackgroundWithShadow(color: .white)
        return stackView
    }()
    
<<<<<<< HEAD
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
=======
    let numberFormatter = NumberFormatter()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
>>>>>>> develop
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
<<<<<<< HEAD
=======
    // MARK: - Configure
    private func configure() {
        numberFormatter.numberStyle = .decimal
    }
    
>>>>>>> develop
    // MARK: ConfigureViews
    private func configureViews() {
        [imageView, stackView].forEach {
            addSubview($0)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
<<<<<<< HEAD
        stackView.snp.makeConstraints { (make) in
=======
        stackView.snp.makeConstraints { [weak self] (make) in
            
            guard let self = self else { return }
            
>>>>>>> develop
            if self.imageView.image == nil {
                print("no")
                make.centerY.equalTo(self.snp.bottom).offset(-80)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().inset(16)
            } else {
                print("yes")
<<<<<<< HEAD
                make.centerY.equalTo(self.snp.bottom).offset(20)
=======
                make.centerY.equalTo(self.snp.bottom).offset(10)
>>>>>>> develop
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().inset(16)
            }
        }
    }
}
