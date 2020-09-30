//
//  CollectionViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCV.collection:
            
            return category.item.count
        case fourthCV.collection:
            
            return 9
        default:
            
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCustomCell.identifier,
                                                                for: indexPath) as? CategoryCustomCell else { fatalError() }
            item.setValue(image: category.item[indexPath.item].image,
                          title: category.item[indexPath.item].name)
            
            return item
        case firstCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            firstCV.collection.tag = 1
            loadDataCollection(listNum: "\(firstCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: nil,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            return item
        case twiceCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            twiceCV.collection.tag = 2
            loadDataCollection(listNum: "\(twiceCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "♡ \(RecommendData.results[indexPath.item].bookmarkCount)",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            
            return item
        case thirdCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.explanLabel.textColor = .systemRed
            thirdCV.collection.tag = 3
            loadDataCollection(listNum: "\(thirdCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "\(self.formatter.string(from: RecommendData.results[indexPath.item].deliveryDiscount as NSNumber) ?? "")원 할인",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: "배달비 무료")
                }
            }
            
            return item
        case fourthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TripleRestaurantCustomCell.identifier,
                                                                for: indexPath) as? TripleRestaurantCustomCell else { fatalError() }
            fourthCV.collection.tag = 4
            loadDataCollection(listNum: "\(fourthCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  countText: "\(indexPath.item + 1)",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus,
                                  discountText: "\(self.formatter.string(from: RecommendData.results[indexPath.item].deliveryDiscount as NSNumber) ?? "")원 할인")
                }
            }
            
            return item
        case fifthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            fifthCV.collection.tag = 5
            loadDataCollection(listNum: "\(fifthCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "배달비 무료",
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: "\(self.formatter.string(from: RecommendData.results[indexPath.item].minOrderPrice as NSNumber) ?? "")원 할인")
                }
            }
            
            return item
        case sixthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            sixthCV.collection.tag = 6
            loadDataCollection(listNum: "\(sixthCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: nil,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            
            return item
        case seventhCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantPlusCustomCell.identifier,
                                                                for: indexPath) as? RestaurantPlusCustomCell else { fatalError() }
            seventhCV.collection.tag = 7
            loadDataCollection(listNum: "\(seventhCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            
            return item
        case eighthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.imageLabel.backgroundColor = .systemGreen
            eighthCV.collection.tag = 8
            loadDataCollection(listNum: "\(eighthCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: RecommendData.results[indexPath.item].deliveryTime,
                                  title: RecommendData.results[indexPath.item].name,
                                  starPoint: RecommendData.results[indexPath.item].star,
                                  review: RecommendData.results[indexPath.item].reviewCount,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            
            return item
        case ninthCV.collection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantNewCustomCell.identifier,
                                                                for: indexPath) as? RestaurantNewCustomCell else { fatalError() }
            ninthCV.collection.tag = 9
            loadDataCollection(listNum: "\(ninthCV.collection.tag)") { (RecommendData) in
                DispatchQueue.main.async {
                    item.setValue(image: RecommendData.results[indexPath.item].image,
                                  imageText: "NEW",
                                  title: RecommendData.results[indexPath.item].name,
                                  explain: RecommendData.results[indexPath.item].representativeMenus)
                }
            }
            
            return item
        default:
            fatalError()
        }
    }
}
