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
<<<<<<< HEAD

class StoreListCell: UITableViewCell {
    var restaurant: RestaurantListData.Results? {
        didSet {
            storeNameLabel.text = restaurant?.name
            storeRateLabel.text = String(format: "%.1f", restaurant?.star as! CVarArg)
            storeImage.image = UIImage(named: restaurant!.image)
            print(restaurant?.image)
            
=======
import Kingfisher

class StoreListCell: UITableViewCell {
    var restaurant: AllListData.Results? {
        didSet {
            storeNameLabel.text = restaurant?.name
            storeRateLabel.text = "\(restaurant?.averageRating ?? 0.0)"
            setImage(from: restaurant!.image)
            reviewLabel.text = " ・ 리뷰 \(String(restaurant!.reviewCount))"
            deliveryDiscountLabel.text = "배달할인 \(String((restaurant?.deliveryDiscount)!))원"
            estimatedTime.text = restaurant?.deliveryTime
            bestMenuLabel.text = restaurant?.representativeMenus.joined()
            
            if restaurant?.deliveryDiscount == 0 {
                    [estimatedTime, bestMenuLabel].forEach{
                      contentView.addSubview($0)
                    }
                    estimatedTime.snp.makeConstraints { (make) in
                      make.top.equalTo(reviewLabel.snp.bottom).offset(1)
                      make.trailing.equalToSuperview().inset(20)
                    }
                
                
                    bestMenuLabel.snp.makeConstraints { (make) in
                      make.top.equalTo(starImage.snp.bottom).offset(1)
                      make.leading.equalTo(starImage.snp.leading)
                      make.trailing.equalTo(self.estimatedTime.snp.leading)
                        make.width.equalTo(180)
                    }
                  } else {
                    [estimatedTime, bestMenuLabel, deliveryDiscountLabel].forEach{
                      contentView.addSubview($0)
                    }
                    deliveryDiscountLabel.snp.makeConstraints { (make) in
                      make.top.equalTo(starImage.snp.bottom).offset(1)
                      make.leading.equalTo(starImage.snp.leading)
                    }
                    estimatedTime.snp.makeConstraints { (make) in
                      make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
                      make.trailing.equalToSuperview().inset(20)
                    }
                    bestMenuLabel.snp.makeConstraints { (make) in
                      make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
                      make.leading.equalTo(deliveryDiscountLabel.snp.leading)
                      make.trailing.equalTo(estimatedTime.snp.leading)
                      make.bottom.equalToSuperview().inset(20)
                    make.width.equalTo(180)
                    }
                  }
>>>>>>> develop
            
        }
    }
    
<<<<<<< HEAD
//    MARK: Properties
    private let storeImage : UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "testRestaurant")
=======
    static let identifier = "StoreListCell"
    
    //    MARK: Properties
    private let storeImage : UIImageView = {
        let imageView = UIImageView()
>>>>>>> develop
        return imageView
    }()
    
    private let storeNameLabel : UILabel = {
        let label = UILabel()
<<<<<<< HEAD
//        label.backgroundColor = .red
=======
>>>>>>> develop
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
<<<<<<< HEAD
//        label.backgroundColor = .blue
=======
>>>>>>> develop
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
    
<<<<<<< HEAD
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

=======
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
        
        return label
    }()
    
    private let bestMenuLabel : UILabel = {
        let label = UILabel()
        label.font = FontModel.toSize.customSmallFont
        label.textColor = .systemGray
>>>>>>> develop
        return label
    }()
    
    private let estimatedTime : UILabel = {
<<<<<<< HEAD
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
        return imageView
=======
        let label = UILabel()
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
>>>>>>> develop
    }()
    
    private let deliveryDiscountLabel : UILabel = {
        let label = UILabel()
<<<<<<< HEAD
        label.textColor = ColorPiker.customMainRed
        label.text = "배달할인 2000원"
        return label
    }()
    
    private let deliveryDiscountPrice : Int = 2000
    
    

//    MARK:  LifeCycle
=======
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
>>>>>>> develop
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setUIConstraints()
<<<<<<< HEAD
        
        
        
=======
        print("deliveryDiscountLabel :\(String(describing: restaurant?.deliveryDiscount))")
>>>>>>> develop
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
<<<<<<< HEAD
//    MARK: SetUIConstraints
    
    func setUIConstraints () {
        [storeImage,storeNameLabel,bestMenuLabel,estimatedTime,starImage,storeRateLabel,reviewLabel,pointLabel].forEach({
=======
    //    MARK: SetUIConstraints
    
    
    
    private func setUIConstraints () {

        [storeImage,cescoMark,estimatedTime,storeNameLabel,starImage,storeRateLabel,deliveryDiscountLabel,reviewLabel,bestMenuLabel].forEach({
>>>>>>> develop
            contentView.addSubview($0)
        })
        
        storeImage.snp.makeConstraints { (make) in
<<<<<<< HEAD
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-300)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        storeNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(storeImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(67)
        }
        
        starImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(48)
            make.leading.equalToSuperview().offset(132)
            make.width.height.equalTo(contentView.snp.width).multipliedBy(0.05)
            make.bottom.equalToSuperview().inset(40)
        }
            
//        let stack = UIStackView(arrangedSubviews: [storeRateLabel,reviewLabel])
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.spacing = 0
//
//        contentView.addSubview(stack)
//        stack.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().inset(40)
//            make.leading.equalTo(starImage.snp.leading).offset(40)
//            make.trailing.equalToSuperview().inset(100)
//            make.bottom.equalToSuperview().inset(40)
//        }
=======
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(self.snp.width).multipliedBy(0.2)
            make.height.equalTo(storeImage.snp.width)
        }
        
        cescoMark.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage.snp.top)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            make.height.equalTo(storeImage.snp.height).multipliedBy(0.35)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.trailing.equalTo(cescoMark.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).inset(20)
        }
        
        storeNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeImage)
            make.leading.equalTo(storeImage.snp.trailing).offset(20)
            make.trailing.equalTo(cescoMark.snp.leading)
        }
        
        
        starImage.snp.makeConstraints { (make) in
            make.top.equalTo(storeNameLabel.snp.bottom).offset(1)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.width.height.equalTo(contentView.snp.width).multipliedBy(0.05)
        }
>>>>>>> develop
        
        storeRateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImage.snp.top)
            make.leading.equalTo(starImage.snp.trailing).offset(3)
<<<<<<< HEAD
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
        
        bestMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pointLabel.snp.bottom).inset(1)
            make.leading.equalTo(storeNameLabel.snp.leading)
            make.bottom.equalToSuperview().inset(15)
        }
        
        estimatedTime.snp.makeConstraints { (make) in
            make.top.equalTo(bestMenuLabel.snp.top)
            make.leading.equalTo(bestMenuLabel.snp.trailing).offset(40)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(bestMenuLabel.snp.bottom)
        }

    }

=======
        }
        
        
        reviewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storeRateLabel.snp.top)
            make.leading.equalTo(storeRateLabel.snp.trailing)
        }
        
        deliveryDiscountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(starImage.snp.bottom).offset(1)
            make.leading.equalTo(starImage.snp.leading)
        }
        
        bestMenuLabel.snp.makeConstraints { (make) in
            make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
            make.leading.equalTo(deliveryDiscountLabel.snp.leading)
            make.trailing.equalTo(estimatedTime.snp.leading)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    //    MARK:  Store Image Set
    
//        if restaurant?.deliveryDiscount == 0 {
//            print("\(restaurant?.deliveryDiscount)")
//            estimatedTime.snp.makeConstraints { (make) in
//                make.top.equalTo(reviewLabel.snp.bottom).offset(1)
//                make.trailing.equalToSuperview().inset(20)
//            }
//
//            bestMenuLabel.snp.makeConstraints { (make) in
//                make.top.equalTo(starImage.snp.bottom).offset(1)
//                make.leading.equalTo(starImage.snp.leading)
//            }
//        } else  {
//            deliveryDiscountLabel.snp.makeConstraints { (make) in
//                make.top.equalTo(starImage.snp.bottom).offset(1)
//                make.leading.equalTo(starImage.snp.leading)
//            }
//
//            estimatedTime.snp.makeConstraints { (make) in
//                make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
//                make.trailing.equalToSuperview().inset(20)
//            }
//
//            bestMenuLabel.snp.makeConstraints { (make) in
//                make.top.equalTo(deliveryDiscountLabel.snp.bottom).offset(1)
//                make.leading.equalTo(deliveryDiscountLabel.snp.leading)
//                make.trailing.equalTo(estimatedTime.snp.leading)
//                make.bottom.equalToSuperview().inset(20)
//            }
//
//        }
//    }
    
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
        reviewLabel.text = " ・ 리뷰 \(review ?? 0)"
        bestMenuLabel.text = explain
        cescoMark.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
    }
    
    func searchValue(image: String?, title: String?, starPoint: Double?, review: Int?, discount: Int?, explain: String?) {
        
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
>>>>>>> develop
}
