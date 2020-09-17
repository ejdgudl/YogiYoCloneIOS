//
//  StoreListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import Kingfisher

class StoreListCell: UITableViewCell {
    var restaurant: RestaurantListData.Results? {
        didSet {
            storeNameLabel.text = restaurant?.name
            storeRateLabel.text = String(format: "%.1f", restaurant?.star as! CVarArg)
            setImage(from: restaurant!.image)
        }
    }
    
    //    MARK: Properties
    private let storeImage : UIImageView = {
        let imageView = UIImageView()
        //        imageView.image = UIImage(named: "testRestaurant")
        return imageView
    }()
    
    private let storeNameLabel : UILabel = {
        let label = UILabel()
        //        label.backgroundColor = .red
        label.font = UIFont(name: FontModel.customLight, size: 20)
        return label
    }()
    
    private let starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        return imageView
    }()
    
    private let storeRateLabel : UILabel = {
        let label = UILabel()
        //        label.backgroundColor = .blue
        label.textAlignment = .center
        label.font = UIFont(name: FontModel.customSemibold, size: 13)
        label.textColor = .black
        return label
    }()
    
    private let squreView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        return view
    }()
    
    private let pointLabel : UILabel = {
        let label = UILabel()
        label.text = "・"
        label.font = UIFont(name: FontModel.customSemibold, size: 10)
        return label
    }()
    
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.text = "리뷰 1000"
        //        label.textAlignment = .center
        //        label.backgroundColor = .yellow
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
        
        return label
    }()
    
    private let reviewNumber : Int = 9
    
    private let bestMenuLabel : UILabel = {
        let label = UILabel()
        label.text = "불고기 와퍼 , 트러플 머쉬룸 와퍼"
        //        label.backgroundColor = .red
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
        
        return label
    }()
    
    private let estimatedTime : UILabel = {
        let label = UILabel()
        label.text = " 30~40분"
        //        label.backgroundColor = .systemPink
        label.textAlignment = .center
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .black
        
        return label
    }()
    
    private let cescoMark : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cesco")
        return imageView
    }()
    
    private let deliveryDiscountLabel : UILabel = {
        let label = UILabel()
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .red
        label.text = "배달할인 2,000원"
        return label
    }()
    
    private let deliveryDiscountPrice : Int = 2000
    
    
    
    //    MARK:  LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setUIConstraints()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: SetUIConstraints
    
    func setUIConstraints () {
        [storeImage,storeNameLabel,bestMenuLabel,estimatedTime,starImage,storeRateLabel,reviewLabel,pointLabel,deliveryDiscountLabel,cescoMark].forEach({
            contentView.addSubview($0)
        })
        
        storeImage.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-310)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        storeNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(storeImage.snp.trailing).offset(20)
            make.bottom.equalToSuperview().inset(67)
        }
        
        cescoMark.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage.snp.top)
            make.leading.equalTo(storeNameLabel.snp.trailing)
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.2)
            make.bottom.equalTo(storeNameLabel.snp.bottom)
        }
        
        starImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(42)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.width.height.equalTo(contentView.snp.width).multipliedBy(0.05)
            make.bottom.equalToSuperview().inset(40)
        }
        
        
        storeRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImage.snp.top)
            make.leading.equalTo(starImage.snp.trailing).offset(3)
            make.bottom.equalTo(starImage.snp.bottom)
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeRateLabel.snp.top)
            make.leading.equalTo(storeRateLabel.snp.trailing).offset(5)
            make.bottom.equalTo(storeRateLabel.snp.bottom)
        }
        
        reviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pointLabel.snp.top)
            make.leading.equalTo(pointLabel.snp.trailing).offset(2)
            make.trailing.equalToSuperview().inset(150)
            make.bottom.equalTo(pointLabel.snp.bottom)
        }
        
        deliveryDiscountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pointLabel.snp.bottom).offset(-20)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.bottom.equalToSuperview().inset(15)
        }
        
        bestMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pointLabel.snp.bottom).offset(15)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.bottom.equalToSuperview().inset(10)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.top.equalTo(bestMenuLabel.snp.top)
            make.leading.equalTo(bestMenuLabel.snp.trailing).offset(40)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(bestMenuLabel.snp.bottom)
        }
    }
//    MARK:  Store Image Set
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.storeImage.image = image
            }
        }
    }
}
