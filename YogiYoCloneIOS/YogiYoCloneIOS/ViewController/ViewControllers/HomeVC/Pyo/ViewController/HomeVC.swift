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
    
    lazy var categoryCollection: UICollectionView = {
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
    lazy var firstCollection: UICollectionView = {
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
    lazy var twiceCollection: UICollectionView = {
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
    let middleBannerImageView: UIImageView = {
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
    lazy var thirdCollection: UICollectionView = {
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
    lazy var fourthCollection: UICollectionView = {
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
    lazy var fifthCollection: UICollectionView = {
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
    lazy var sixthCollection: UICollectionView = {
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
    lazy var seventhCollection: UICollectionView = {
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
    lazy var eighthCollection: UICollectionView = {
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
    lazy var ninthCollection: UICollectionView = {
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
    
    private let motherStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    private let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    
    private let twiceStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button4 = UIButton()
    private let button5 = UIButton()
    private let button6 = UIButton()
    
    private let thirdStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button7 = UIButton()
    private let button8 = UIButton()
    private let button9 = UIButton()
    
    private let fourthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button10 = UIButton()
    private let button11 = UIButton()
    private let button12 = UIButton()
    
    private let fifthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    private let button13 = UIButton()
    private let button14 = UIButton()
    private let button15 = UIButton()
    
    private let bottomView = BottomView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .systemBackground
        
        motherScrollView.contentSize = CGSize(width: view.frame.width,
                                              height: bottomView.frame.maxY)

        topBannerScrollView.contentSize = CGSize(width: topBannerView.frame.width * CGFloat(category.item.count),
                                                 height: topBannerView.frame.height)
        
        middleBannerScrollView.contentSize = CGSize(width: middleBannerView.frame.width * CGFloat(category.item.count),
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
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        titleStack.addArrangedSubview(titleLogo)
        
        titleButton.addTarget(self, action: #selector(mapPresent(_:)), for: .touchUpInside)
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
        
        setStackUI()
        
        motherScrollView.addSubview(bottomView)
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
            $0.top.equalTo(twiceCollection.snp.bottom).offset(CollectionDesign.padding / 2)
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
            $0.top.equalTo(middleBannerView.snp.bottom).offset(CollectionDesign.padding / 2)
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
            $0.top.equalTo(fourthCollection.snp.bottom).offset(CollectionDesign.padding / 2)
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
            $0.top.equalTo(seventhCollection.snp.bottom).offset(CollectionDesign.padding / 2)
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
            $0.top.equalTo(eighthCollection.snp.bottom).offset(CollectionDesign.padding / 2)
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
        
        motherStackView.snp.makeConstraints {
            $0.top.equalTo(ninthCollection.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(motherStackView.snp.width).multipliedBy(0.58)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(motherStackView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(bottomView.snp.width).multipliedBy(0.45)
        }
    }
    
    // MARK: Stack UI
    private func setStackUI() {
        
        motherScrollView.addSubview(motherStackView)
        
        var index = 0
        [button1, button2, button3, button4, button5,
         button6, button7, button8, button9, button10,
         button11, button12, button13, button14, button15].forEach {
            $0.backgroundColor = .systemBackground
            $0.setTitleColor(.black, for: .normal)
            $0.setTitle(category.item[index].name, for: .normal)
            $0.titleLabel?.font = UIFont(name: FontModel.customLight, size: 14)
            $0.addTarget(self, action: #selector(stackToggle(_:)), for: .touchUpInside)
            $0.tag = index
            index += 1
        }
        
        [button1, button2, button3].forEach {
            firstStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(firstStack)
        
        [button4, button5, button6].forEach {
            twiceStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(twiceStack)
        
        [button7, button8, button9].forEach {
            thirdStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(thirdStack)
        
        [button10, button11, button12].forEach {
            fourthStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(fourthStack)
        
        [button13, button14, button15].forEach {
            fifthStack.addArrangedSubview($0)
        }
        motherStackView.addArrangedSubview(fifthStack)
    }
    @objc func mapPresent(_ sender: UIButton) {
        let mapVC = MapVC()
        mapVC.modalPresentationStyle = .fullScreen
        present(mapVC, animated: true)
    }
    @objc func stackToggle(_ sender: UIButton) {
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
}
