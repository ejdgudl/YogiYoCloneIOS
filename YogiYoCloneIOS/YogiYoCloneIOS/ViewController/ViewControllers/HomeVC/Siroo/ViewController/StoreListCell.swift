//
//  StoreListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class StoreListCell: UITableViewCell {

//    MARK: Properties
    
    private let storeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testRestaurant")
        return imageView
    }()
    
    private let storeNameLabel : UILabel = {
        let label = UILabel()
        label.text = "버거킹 성수점"
        label.font = FontModel.toSize.customLargeFont
        return label
    }()
    
    private let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    private let storeRateLabel : UILabel = {
        let label = UILabel()
        label.text = "5.0"
        label.font = FontModel.toSize.customSmallFont
        label.textColor = ColorPiker.customrightGray
        return label
    }()
    
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.text = "리뷰 9"
        label.font = FontModel.toSize.customSmallFont
        label.textColor = ColorPiker.customrightGray

        return label
    }()
    
    private let reviewNumber : Int = 9
    
    private let bestMenuLabel : UILabel = {
        let label = UILabel()
        label.text = "불고기 와퍼 , 트러플 머쉬룸 와퍼"
        label.font = FontModel.toSize.customSmallFont
        label.textColor = ColorPiker.customrightGray

        return label
    }()
    
    private let estimatedTime : UILabel = {
       let label = UILabel()
        label.text = " 30~40분"
        label.font = FontModel.toSize.customSmallFont
        label.textColor = ColorPiker.customDarkGray

        return label
    }()
    
    private let cescoMark : UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private let deliveryDiscountLabel : UILabel = {
        let label = UILabel()
        label.textColor = ColorPiker.customMainRed
        label.text = "배달할인 2000원"
        return label
    }()
    
    private let deliveryDiscountPrice : Int = 2000
    
    

//    MARK:  LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: SetUIConstraints
    
    func setUIConstraints () {
        [storeImage,storeNameLabel,starImage,storeRateLabel,reviewLabel,bestMenuLabel,estimatedTime].forEach({
            self.addSubview($0)
        })
        
        storeImage.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-150)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        storeNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage)
            make.leading.equalTo(storeImage).offset(10)
            make.trailing.equalToSuperview().offset(-100)
            make.bottom.equalToSuperview().offset(-100)
        }
        
        
    }
    
    
    
    

}
