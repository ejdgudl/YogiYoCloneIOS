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
    let imageLabel = PaddingLabel()
    let truePadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    let falsePadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    let titleLabel = UILabel()
    
    let starImage = UIImageView()
    let starPointLabel = UILabel()
    let reviewLabel = UILabel()
    
    let explanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImageView()
        setImageLabel()
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
    private func setImageLabel() {
        imageLabel.font = UIFont(name: FontModel.customMedium, size: 14)
        imageLabel.textAlignment = .center
        imageLabel.backgroundColor = .red
        imageLabel.textColor = .white
        imageView.addSubview(imageLabel)
        
        imageLabel.snp.makeConstraints {
            $0.leading.bottom.equalTo(imageView)
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
        reviewLabel.font = UIFont(name: FontModel.customLight, size: 13)
        reviewLabel.textAlignment = .center
        reviewLabel.textColor = .darkGray
        contentView.addSubview(reviewLabel)
        
        reviewLabel.snp.makeConstraints {
            $0.centerY.equalTo(starPointLabel.snp.centerY)
            $0.leading.equalTo(starPointLabel.snp.trailing)
        }
    }
    private func setExplainLabel() {
        explanLabel.font = UIFont(name: FontModel.customLight, size: 13)
        explanLabel.textAlignment = .left
        explanLabel.textColor = .gray
        contentView.addSubview(explanLabel)
        
        explanLabel.snp.makeConstraints {
            $0.top.equalTo(starImage.snp.bottom).offset(CollectionDesign.collectionPadding)
            $0.leading.trailing.equalTo(contentView)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    func setValue(image: String, imageText: String? ,title: String, starPoint: Double, review: Int, explain: String) {
        imageText == nil ? (imageLabel.padding = truePadding) : (imageLabel.padding = falsePadding)
        imageView.image = UIImage(named: image)
        imageLabel.text = imageText
        titleLabel.text = title
        starPointLabel.text = "\(starPoint)"
        reviewLabel.text = " · 리뷰 \(review)"
        explanLabel.text = explain
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

