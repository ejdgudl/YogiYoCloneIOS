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
    let starImage = UIImageView()
    let starPointLabel = UILabel()
    let reviewLabel = UILabel()
    let explanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setTitle()
        setStarImage()
        setStarPoint()
        setReviewLabel()
        setExplainLabel()
    }
    private func setImageView() {
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(imageView.snp.width)
        }
    }
    private func setTitle() {
        titleLabel.font = UIFont(name: FontModel.customLight, size: 18)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(contentView)
        }
    }
    private func setStarImage() {
        starImage.image = UIImage(named: "star")
        contentView.addSubview(starImage)
        
        starImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            $0.height.equalTo(starImage.snp.width)
        }
    }
    private func setStarPoint() {
        starPointLabel.font = UIFont(name: FontModel.customSemibold, size: 14)
        starPointLabel.textAlignment = .center
        contentView.addSubview(starPointLabel)
        
        starPointLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImage.snp.centerY)
            $0.leading.equalTo(starImage.snp.trailing)
        }
    }
    private func setReviewLabel() {
        reviewLabel.font = UIFont(name: FontModel.customLight, size: 14)
        reviewLabel.textAlignment = .center
        reviewLabel.textColor = .darkGray
        contentView.addSubview(reviewLabel)
        
        reviewLabel.snp.makeConstraints {
            $0.centerY.equalTo(starPointLabel.snp.centerY)
            $0.leading.equalTo(starPointLabel.snp.trailing)
        }
    }
    private func setExplainLabel() {
        explanLabel.font = UIFont(name: FontModel.customLight, size: 14)
        explanLabel.textAlignment = .center
        explanLabel.textColor = .gray
        contentView.addSubview(explanLabel)
        
        explanLabel.snp.makeConstraints {
            $0.top.equalTo(starImage.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    func setValue(image: String, title: String, starPoint: Double, review: Int, explain: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        starPointLabel.text = "\(starPoint)"
        reviewLabel.text = " ● 리뷰 \(review)"
        explanLabel.text = explain
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

