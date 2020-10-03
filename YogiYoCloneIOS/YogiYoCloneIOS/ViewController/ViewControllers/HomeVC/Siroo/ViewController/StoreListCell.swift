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
    var restaurant: AllListData.Results? {
        didSet {
            storeNameLabel.text = restaurant?.name
            print(restaurant?.name)
            storeRateLabel.text = String(format: "%.1f", restaurant?.averageRating as! CVarArg)
            setImage(from: restaurant!.image)
            reviewLabel.text = "리뷰 \(String(restaurant!.reviewCount))"
            deliveryDiscountLabel.text = "배달할인 \(String((restaurant?.deliveryDiscount)!))원"
            estimatedTime.text = restaurant?.deliveryTime
            bestMenuLabel.text = restaurant?.representativeMenus.joined()
            
        }
    }
    
    static let identifier = "StoreListCell"
    
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
        //        label.textAlignment = .center
        //        label.backgroundColor = .yellow
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
        
        return label
    }()
    
    private let bestMenuLabel : UILabel = {
        let label = UILabel()
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
        return label
    }()
    
    private let estimatedTime : UILabel = {
        let label = UILabel()
//        label.text = " 30~40분"
        //        label.backgroundColor = .systemPink
        label.textAlignment = .center
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .black
        
        return label
    }()
    
    let cescoMark : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cesco"), for: .normal)
        button.tintColor = .systemRed
        button.isSelected = true
        return button
    }()
    
    private let deliveryDiscountLabel : UILabel = {
        let label = UILabel()
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .red
   
        return label
    }()
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //    MARK:  LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setUIConstraints()
        print("deliveryDiscountLabel :\(String(describing: restaurant?.deliveryDiscount))")

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
//            make.width.equalToSuperview().multipliedBy(0.2)
//            make.height.equalTo(storeImage.snp.width)
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
            make.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(10)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.top.equalTo(bestMenuLabel.snp.top)
            make.leading.equalTo(bestMenuLabel.snp.trailing).offset(-20)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(bestMenuLabel.snp.bottom)
        }
    }
//    MARK:  Store Image Set
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        storeImage.kf.setImage(with: imageURL)
    }
    
    func setValue(image: String?, title: String?, starPoint: Double?, review: Int?, discount: Int?, explain: String?) {
        
        let discountText = formatter.string(from: discount as NSNumber? ?? 0)
        
        discountText != "0" ? (deliveryDiscountLabel.text = "배달할인 \(discountText ?? "0")원") :
                              (deliveryDiscountLabel.text = nil)
        
        setImage(from: image ?? "")
        storeNameLabel.text = title
        storeRateLabel.text = "\(starPoint ?? 0)"
        reviewLabel.text = "리뷰 \(review ?? 0)"
        bestMenuLabel.text = explain
        cescoMark.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
    }
}
