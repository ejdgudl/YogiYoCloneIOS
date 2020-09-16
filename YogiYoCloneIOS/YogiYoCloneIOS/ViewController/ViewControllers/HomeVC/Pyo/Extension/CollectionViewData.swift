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
        return category.item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCustomCell.identifier,
                                                                for: indexPath) as? CategoryCustomCell else { fatalError() }
            item.setValue(image: category.item[indexPath.item].image,
                          title: category.item[indexPath.item].name)
            
            return item
        case firstCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: nil,
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            
            return item
        case twiceCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: "♡ \(117)",
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            
            return item
        case thirdCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: "5,000원 할인",
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "배달비 무료")
            item.explanLabel.textColor = .systemRed
            
            return item
        case fourthCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TripleRestaurantCustomCell.identifier,
                                                                for: indexPath) as? TripleRestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          countText: "\(indexPath.item + 1)",
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지",
                          discountText: "2,000원 할인")
            
            return item
        case fifthCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: "배달비 무료",
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "최소주문 24,000원")
            
            return item
        case sixthCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: nil,
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            
            return item
        case seventhCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantPlusCustomCell.identifier,
                                                                for: indexPath) as? RestaurantPlusCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          title: "버거킹",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            
            return item
        case eighthCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: "15~25분",
                          title: "버거킹",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            item.imageLabel.backgroundColor = .systemGreen
            
            return item
        case ninthCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantNewCustomCell.identifier,
                                                                for: indexPath) as? RestaurantNewCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          imageText: "NEW",
                          title: "버거킹",
                          explain: "버거킹은 불고기와퍼세트가 짜세지")
            
            return item
        default:
            fatalError()
        }
    }
}
