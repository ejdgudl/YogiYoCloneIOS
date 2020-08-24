//
//  RestaurantCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class RestaurantCustomCell: UICollectionViewCell {
    
    static let identifier = "RestaurantCustomItem"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let starLabel = UILabel()
    let reviewLabel = UILabel()
    let explanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setTitle()
    }
    private func setImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(imageView.snp.width)
        }
    }
    private func setTitle() {
        titleLabel.font = UIFont(name: FontModel.customLight, size: 12)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.bottom.equalTo(contentView)
        }
    }
    private func setStar() {
        starLabel.font = UIFont(name: FontModel.customLight, size: 12)
        starLabel.textAlignment = .left
        contentView.addSubview(starLabel)
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(CollectionDesign.textPadding)
            $0.leading.trailing.bottom.equalTo(contentView)
        }
    }
    
    func setValue(image: String, title: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

