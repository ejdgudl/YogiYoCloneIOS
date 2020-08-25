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
    
    let firstCollectionHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    let firstHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "나의 입맛 저격!"
        label.font = UIFont(name: FontModel.customRegular, size: 20)
        return label
    }()
    let firstQueryButton: UIButton = {
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
    
    private let testCategory = ["전체보기", "1인분주문", "요기요플러스", "치킨", "중국집", "피자/양식", "한식", "분식", "카페/디저트", "족발/보쌈", "일식/돈가스"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .systemBackground
        
        motherScrollView.contentSize = CGSize(width: view.frame.width,
                                              height: firstCollection.frame.maxY)

        topBannerScrollView.contentSize = CGSize(width: topBannerView.frame.width * CGFloat(testCategory.count),
                                                 height: topBannerView.frame.height)
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
                          title: testCategory[indexPath.item]
            )
            
            return item
        case firstCollection:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCustomCell.identifier,
                                                                for: indexPath) as? RestaurantCustomCell else { fatalError() }
            item.setValue(image: "testRestaurant",
                          title: "버거킹-건대입구역점",
                          starPoint: 4.4,
                          review: 895,
                          explain: "버거킹은 불고기와퍼세트가 짜세지"
            )
            
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
        collectionView == categoryCollection ? categorySize(collectionView: collectionView) : restaurantSize(collectionView: collectionView)
    }
    private func categorySize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom) - (CollectionDesign.padding * (CollectionDesign.CateLineCount - 1))) / CollectionDesign.CateLineCount
        return CGSize(width: size * 0.78, height: size)
    }
    private func restaurantSize(collectionView: UICollectionView) -> CGSize {
        let size = (collectionView.frame.height - (CollectionDesign.edge.top + CollectionDesign.edge.bottom))
        return CGSize(width: size * 0.7, height: size)
    }
}
