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
        button.setTitleColor(.black, for: .normal)
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
    private let contentView = UIView()
    
    private let topBannerView: UIView = {
        let view = UIView()
        return view
    }()
    private let topBannerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
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
    
    lazy var categoryCV: CategoryCollection = {
        let category = CategoryCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(CategoryCustomCell.self, forCellWithReuseIdentifier: CategoryCustomCell.identifier)
        return category
    }()
    
    lazy var firstCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "나의 입맛 저격!", image: "questionmark.circle")
        return category
    }()
    lazy var twiceCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "우리동네 찜♡ 많은 음식점", image: nil)
        return category
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
    
    lazy var thirdCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "성수동2가 오늘만 할인!!", image: nil)
        return category
    }()
    lazy var fourthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(TripleRestaurantCustomCell.self, forCellWithReuseIdentifier: TripleRestaurantCustomCell.identifier)
        category.setValue(text: "요즘 뜨는 우리동네 음식점", image: "questionmark.circle")
        return category
    }()
    lazy var fifthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "성수동2가 배달비 무료", image: nil)
        return category
    }()
    lazy var sixthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "최근 7일 동안 리뷰가 많아요!", image: "questionmark.circle")
        return category
    }()
    lazy var seventhCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantPlusCustomCell.self, forCellWithReuseIdentifier: RestaurantPlusCustomCell.identifier)
        category.queryButton.addTarget(self, action: #selector(plusPush(_:)), for: .touchUpInside)
        category.setValue(text: "요기요플러스 맛집!", image: "더보기 〉")
        return category
    }()
    lazy var eighthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantCustomCell.self, forCellWithReuseIdentifier: RestaurantCustomCell.identifier)
        category.setValue(text: "요기요플러스 맛집!", image: nil)
        return category
    }()
    lazy var ninthCV: RecommendCollection = {
        let category = RecommendCollection()
        category.collection.dataSource = self
        category.collection.delegate = self
        category.collection.register(RestaurantNewCustomCell.self, forCellWithReuseIdentifier: RestaurantNewCustomCell.identifier)
        category.setValue(text: "새로 오픈했어요!", image: nil)
        return category
    }()
    
    private let buttonStack: BottomStack = {
        let view = BottomStack()
        view.buttons.forEach {
            $0.addTarget(self, action: #selector(stackPush(_:)), for: .touchUpInside)
        }
        return view
    }()
    
    private let bottomView = BottomView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        topBannerScrollView.contentSize = CGSize(width: topBannerView.frame.width * CGFloat(category.item.count),
                                                 height: topBannerView.frame.height)
        
        middleBannerScrollView.contentSize = CGSize(width: middleBannerView.frame.width * CGFloat(category.item.count),
                                                    height: middleBannerView.frame.height)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setUI()
        setLayout()
    }
    
    // MARK: Set UI
    private func setUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"),
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        titleStack.addArrangedSubview(titleLogo)
        
        titleButton.addTarget(self, action: #selector(mapPresent(_:)), for: .touchUpInside)
        titleStack.addArrangedSubview(titleButton)
        
        navigationItem.titleView = titleStack
        
        motherScrollView.delegate = self
        view.addSubview(motherScrollView)
        
        motherScrollView.addSubview(contentView)
        
        contentView.addSubview(topBannerView)
        
        topBannerScrollView.delegate = self
        topBannerView.addSubview(topBannerScrollView)
        topBannerScrollView.addSubview(topBannerImageView)
        
        contentView.addSubview(categoryCV)
        contentView.addSubview(firstCV)
        contentView.addSubview(twiceCV)
        
        contentView.addSubview(middleBannerView)
        
        middleBannerScrollView.delegate = self
        middleBannerView.addSubview(middleBannerScrollView)
        middleBannerScrollView.addSubview(middleBannerImageView)
        
        contentView.addSubview(thirdCV)
        contentView.addSubview(fourthCV)
        contentView.addSubview(fifthCV)
        contentView.addSubview(sixthCV)
        contentView.addSubview(seventhCV)
        contentView.addSubview(eighthCV)
        contentView.addSubview(ninthCV)
        
        contentView.addSubview(buttonStack)
        
        contentView.addSubview(bottomView)
    }
    
    // MARK: Auto Layout
    private func setLayout() {

        motherScrollView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.leading.centerX.trailing.bottom.equalTo(motherScrollView)
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
        
        
        categoryCV.snp.makeConstraints {
            $0.top.equalTo(topBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(categoryCV.snp.width).multipliedBy(0.61)
        }
        
        firstCV.snp.makeConstraints {
            $0.top.equalTo(categoryCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(firstCV.snp.width).multipliedBy(0.78)
        }
        
        twiceCV.snp.makeConstraints {
            $0.top.equalTo(firstCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(twiceCV.snp.width).multipliedBy(0.78)
        }
        
        
        middleBannerView.snp.makeConstraints {
            $0.top.equalTo(twiceCV.snp.bottom).offset(CollectionDesign.padding / 2)
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
        

        thirdCV.snp.makeConstraints {
            $0.top.equalTo(middleBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(thirdCV.snp.width).multipliedBy(0.78)
        }
        
        fourthCV.snp.makeConstraints {
            $0.top.equalTo(thirdCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fourthCV.snp.width).multipliedBy(0.98)
        }
        
        fifthCV.snp.makeConstraints {
            $0.top.equalTo(fourthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(fifthCV.snp.width).multipliedBy(0.78)
        }
        
        sixthCV.snp.makeConstraints {
            $0.top.equalTo(fifthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(sixthCV.snp.width).multipliedBy(0.78)
        }
        
        seventhCV.snp.makeConstraints {
            $0.top.equalTo(sixthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(seventhCV.snp.width).multipliedBy(0.78)
        }
        
        eighthCV.snp.makeConstraints {
            $0.top.equalTo(seventhCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(eighthCV.snp.width).multipliedBy(0.78)
        }
        
        ninthCV.snp.makeConstraints {
            $0.top.equalTo(eighthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(ninthCV.snp.width).multipliedBy(0.74)
        }
        
        
        buttonStack.snp.makeConstraints {
            $0.top.equalTo(ninthCV.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(buttonStack.snp.width).multipliedBy(0.58)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(buttonStack.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(bottomView.snp.width).multipliedBy(0.45)
            $0.bottom.equalTo(contentView)
        }
    }
    
    // MARK: Present, Push func
    @objc func mapPresent(_ sender: UIButton) {
        let mapVC = MapVC()
        mapVC.modalPresentationStyle = .fullScreen
        present(mapVC, animated: true)
    }
    @objc func stackPush(_ sender: UIButton) {
        guard sender.tag == 1 || sender.tag == 2 else {
            let listVC = StoreListVC()
            sender.tag < 3 ? (listVC.categoryIndex = sender.tag) : (listVC.categoryIndex = sender.tag - 2)
            navigationController?.pushViewController(listVC, animated: true)
            return
        }
        
        switch sender.tag {
        case 1:
            let plusVC = YogiyoPlusStoreListVC()
            navigationController?.pushViewController(plusVC, animated: true)
        case 2:
            print("take out")
        default:
            fatalError()
        }
    }
    @objc func plusPush(_ sender: UIButton) {
        let plusVC = YogiyoPlusStoreListVC()
        navigationController?.pushViewController(plusVC, animated: true)
    }
}
