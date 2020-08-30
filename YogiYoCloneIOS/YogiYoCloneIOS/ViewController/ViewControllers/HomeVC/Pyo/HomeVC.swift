//
//  HomeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class HomeVC: UIViewController, UIScrollViewDelegate {
    
    private let titleStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = CollectionDesign.textPadding
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    private let titleLogo: UIImageView = {
        let imageView = UIImageView()
        let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        imageView.addConstraints([imageViewWidth, imageViewHeight])
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let titleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("성수동2가 277-17 ▼", for: .normal)
        return button
    }()
    
    private let motherScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorPiker.customGray
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let topBannerView: UIView = {
        let view = UIView()
        return view
    }()
    private let topBannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private let topBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyAccountVCImage")
        return imageView
    }()
    
    private lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCustomCell.self, forCellWithReuseIdentifier: CategoryCustomCell.identifier)
        return collectionView
    }()
    
    private let firstCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let firstHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "나의 입맛 저격!"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private let firstQueryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "testQ"), for: .normal)
        return button
    }()
    private lazy var firstCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let twiceCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let twiceHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "우리동네 찜♡ 많은 음식점"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private lazy var twiceCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let middleBannerView: UIView = {
        let view = UIView()
        return view
    }()
    private let middleBannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .red
        scrollView.layer.cornerRadius = 5
        scrollView.clipsToBounds = true
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    private let middleBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "MyAccountVCImage")
        return imageView
    }()
    
    private let thirdCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let thirdHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "성수동2가 오늘만 할인!!"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private lazy var thirdCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let fourthCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let fourthHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "요즘 뜨는 우리동네 음식점"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private let fourthQueryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "testQ"), for: .normal)
        return button
    }()
    private lazy var fourthCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TripleRestaurantCustomCell.self, forCellWithReuseIdentifier: TripleRestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let fifthCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let fifthHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "성수동2가 배달비 무료"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private lazy var fifthCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let sixthCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let sixthHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "최근 7일 동안 리뷰가 많아요!"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private let sixthQueryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "testQ"), for: .normal)
        return button
    }()
    private lazy var sixthCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let seventhCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private let seventhHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "요기요플러스 맛집!"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private let seventhQueryButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 〉", for: .normal)
        button.titleLabel?.textColor = .darkGray
        return button
    }()
    private lazy var seventhCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantPlusCustomCell.self, forCellWithReuseIdentifier: RestaurantPlusCustomCell.identifier)
        return collectionView
    }()
    
    private let eighthCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let eighthHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "가장 빨리 배달돼요~"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private lazy var eighthCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        return collectionView
    }()
    
    private let ninthCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    private let ninthHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "새로 오픈했어요!"
        label.font = UIFont(name: FontModel.customSemibold, size: 20)
        return label
    }()
    private lazy var ninthCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RestaurantNewCustomCell.self, forCellWithReuseIdentifier: RestaurantNewCustomCell.identifier)
        return collectionView
    }()
    
    private let testCategory = ["전체보기", "1인분주문", "요기요플러스", "치킨", "중국집", "피자/양식", "한식", "분식", "카페/디저트", "족발/보쌈", "일식/돈가스"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .systemBackground
        
        motherScrollView.contentSize = CGSize(width: view.frame.width,
                                              height: ninthCollection.frame.maxY)

        topBannerScrollView.contentSize = CGSize(width: topBannerView.frame.width * CGFloat(testCategory.count),
                                                 height: topBannerView.frame.height)
        
        middleBannerScrollView.contentSize = CGSize(width: middleBannerView.frame.width * CGFloat(testCategory.count),
                                                    height: middleBannerView.frame.height)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: Set UI
    private func setUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        
        titleStack.addArrangedSubview(titleLogo)
        titleStack.addArrangedSubview(titleButton)
        navigationItem.titleView = titleStack
        
        motherScrollView.delegate = self
        view.addSubview(motherScrollView)
        
        motherScrollView.addSubview(topBannerView)
        
        topBannerScrollView.delegate = self
        topBannerView.addSubview(topBannerScrollView)
        topBannerScrollView.addSubview(topBannerImageView)
        
        motherScrollView.addSubview(categoryCollection)
        
        motherScrollView.addSubview(firstCollectionHeader)
        firstCollectionHeader.addSubview(firstHeaderTitle)
        firstCollectionHeader.addSubview(firstQueryButton)
        motherScrollView.addSubview(firstCollection)
        
        motherScrollView.addSubview(twiceCollectionHeader)
        twiceCollectionHeader.addSubview(twiceHeaderTitle)
        motherScrollView.addSubview(twiceCollection)
        
        motherScrollView.addSubview(middleBannerView)
        
        middleBannerScrollView.delegate = self
        middleBannerView.addSubview(middleBannerScrollView)
        middleBannerScrollView.addSubview(middleBannerImageView)
        
        motherScrollView.addSubview(thirdCollectionHeader)
        thirdCollectionHeader.addSubview(thirdHeaderTitle)
        motherScrollView.addSubview(thirdCollection)
        
        motherScrollView.addSubview(fourthCollectionHeader)
        fourthCollectionHeader.addSubview(fourthHeaderTitle)
        fourthCollectionHeader.addSubview(fourthQueryButton)
        motherScrollView.addSubview(fourthCollection)
        
        motherScrollView.addSubview(fifthCollectionHeader)
        fifthCollectionHeader.addSubview(fifthHeaderTitle)
        motherScrollView.addSubview(fifthCollection)
        
        motherScrollView.addSubview(sixthCollectionHeader)
        sixthCollectionHeader.addSubview(sixthHeaderTitle)
        sixthCollectionHeader.addSubview(sixthQueryButton)
        motherScrollView.addSubview(sixthCollection)
        
        motherScrollView.addSubview(seventhCollectionHeader)
        seventhCollectionHeader.addSubview(seventhHeaderTitle)
        seventhCollectionHeader.addSubview(seventhQueryButton)
        motherScrollView.addSubview(seventhCollection)
        
        motherScrollView.addSubview(eighthCollectionHeader)
        eighthCollectionHeader.addSubview(eighthHeaderTitle)
        motherScrollView.addSubview(eighthCollection)
        
        motherScrollView.addSubview(ninthCollectionHeader)
        ninthCollectionHeader.addSubview(ninthHeaderTitle)
        motherScrollView.addSubview(ninthCollection)
    }
    
    // MARK: Auto Layout
    private func setLayout() {

        motherScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        topBannerView.snp.makeConstraints {
            $0.top.leading.equalTo(motherScrollView)
            $0.width.equalTo(motherScrollView)
            $0.height.equalTo(topBannerView.snp.width).multipliedBy(0.31)
        }
        topBannerScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(topBannerView)
        }
        topBannerImageView.snp.makeConstraints {
            $0.top.leading.equalTo(topBannerScrollView)
            $0.width.height.equalTo(topBannerView)
        }
        
        categoryCollection.snp.makeConstraints {
            $0.top.equalTo(topBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(categoryCollection.snp.width).multipliedBy(0.61)
        }
        
        firstCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(categoryCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(firstCollection.snp.width).multipliedBy(0.15)
        }
        firstHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        firstQueryButton.snp.makeConstraints {
            $0.centerY.equalTo(firstHeaderTitle)
            $0.leading.equalTo(firstHeaderTitle.snp.trailing).offset(2)
        }
        firstCollection.snp.makeConstraints {
            $0.top.equalTo(firstCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(firstCollection.snp.width).multipliedBy(0.63)
        }
        
        twiceCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(firstCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(twiceCollection.snp.width).multipliedBy(0.15)
        }
        twiceHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        twiceCollection.snp.makeConstraints {
            $0.top.equalTo(twiceCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(twiceCollection.snp.width).multipliedBy(0.63)
        }
        
        middleBannerView.snp.makeConstraints {
            $0.top.equalTo(twiceCollection.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.equalTo(CollectionDesign.padding)
            $0.width.equalTo(motherScrollView).offset(-CollectionDesign.padding * 2)
            $0.height.equalTo(middleBannerView.snp.width).multipliedBy(0.31)
        }
        middleBannerScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(middleBannerView)
        }
        middleBannerImageView.snp.makeConstraints {
            $0.top.leading.equalTo(middleBannerScrollView)
            $0.width.height.equalTo(middleBannerView)
        }
        
        thirdCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(middleBannerView.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(thirdCollection.snp.width).multipliedBy(0.15)
        }
        thirdHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        thirdCollection.snp.makeConstraints {
            $0.top.equalTo(thirdCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(thirdCollection.snp.width).multipliedBy(0.63)
        }
        
        fourthCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(thirdCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fourthCollection.snp.width).multipliedBy(0.15)
        }
        fourthHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        fourthQueryButton.snp.makeConstraints {
            $0.centerY.equalTo(fourthHeaderTitle)
            $0.leading.equalTo(fourthHeaderTitle.snp.trailing).offset(2)
        }
        fourthCollection.snp.makeConstraints {
            $0.top.equalTo(fourthCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fourthCollection.snp.width).multipliedBy(0.83)
        }
        
        fifthCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(fourthCollection.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fifthCollectionHeader.snp.width).multipliedBy(0.15)
        }
        fifthHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        fifthCollection.snp.makeConstraints {
            $0.top.equalTo(fifthCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fifthCollection.snp.width).multipliedBy(0.63)
        }
        
        sixthCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(fifthCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(sixthCollection.snp.width).multipliedBy(0.15)
        }
        sixthHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        sixthQueryButton.snp.makeConstraints {
            $0.centerY.equalTo(sixthHeaderTitle)
            $0.leading.equalTo(sixthHeaderTitle.snp.trailing).offset(2)
        }
        sixthCollection.snp.makeConstraints {
            $0.top.equalTo(sixthCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(sixthCollection.snp.width).multipliedBy(0.63)
        }
        
        seventhCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(sixthCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(seventhCollection.snp.width).multipliedBy(0.15)
        }
        seventhHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        seventhQueryButton.snp.makeConstraints {
            $0.centerY.equalTo(seventhHeaderTitle)
            $0.trailing.equalToSuperview().inset(CollectionDesign.padding)
        }
        seventhCollection.snp.makeConstraints {
            $0.top.equalTo(seventhCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(seventhCollection.snp.width).multipliedBy(0.63)
        }
        
        eighthCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(seventhCollection.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(eighthCollectionHeader.snp.width).multipliedBy(0.15)
        }
        eighthHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        eighthCollection.snp.makeConstraints {
            $0.top.equalTo(eighthCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(eighthCollection.snp.width).multipliedBy(0.63)
        }
        
        ninthCollectionHeader.snp.makeConstraints {
            $0.top.equalTo(eighthCollection.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(ninthCollectionHeader.snp.width).multipliedBy(0.15)
        }
        ninthHeaderTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(CollectionDesign.padding)
        }
        ninthCollection.snp.makeConstraints {
            $0.top.equalTo(ninthCollectionHeader.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(ninthCollection.snp.width).multipliedBy(0.59)
        }
    }
}
// MARK: Collection Data, Delegate
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCustomCell.identifier,
                                                                for: indexPath) as? CategoryCustomCell else { fatalError() }
            item.setValue(image: "testCate",
                          title: testCategory[indexPath.item])
            
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
// MARK: Collection FlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    // 줄 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionDesign.padding
    }
    // 행 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionDesign.padding
    }
    // 테두리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return CollectionDesign.edge
    }
    // 아이템 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case categoryCollection:
            return categorySize(collectionView: collectionView)
        case fourthCollection:
            return restaurantTripleSize(collectionView: collectionView)
        case ninthCollection:
            return restaurantNewSize(collectionView: collectionView)
        default:
            return restaurantSize(collectionView: collectionView)
        }
    }
    private func categorySize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom) - (CollectionDesign.padding * (CollectionDesign.cateLineCount - 1))) / CollectionDesign.cateLineCount
        return CGSize(width: size * 0.78, height: size)
    }
    private func restaurantSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom))
        return CGSize(width: size * 0.7, height: size)
    }
    private func restaurantTripleSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom) - (CollectionDesign.padding * (CollectionDesign.tripleLineCount - 1))) / CollectionDesign.tripleLineCount
        return CGSize(width: size * 3.7, height: size)
    }
    private func restaurantNewSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom))
        return CGSize(width: size * 0.76, height: size)
    }
}
