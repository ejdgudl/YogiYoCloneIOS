//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

private let reuseIdentifier = "StoreListCell"




class StoreListVC: UIViewController, CustomTopCategoryViewDelegate{
    func change(to index: Int) {
        print("click \(index)")
    }
    

//    MARK: Properties
    
    private let storeListCell = StoreListCell()
    private let scrollView = UIScrollView()
    
    private let first = CategoryVC()
    private let second = CategoryVC()
    private let third = CategoryVC()
    private let fourth = CategoryVC()
    private let fifth = CategoryVC()

    private let testLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        label.backgroundColor = .systemBlue
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
        
        configure()
        configureScrollView()
//        configureTableView()


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK:  @objc
    @objc private func didTapNext() {
        let menuListVC = MenuListVC()
        navigationController?.pushViewController(menuListVC, animated: true)
    }
    
    
//    MARK: Configure
    func configure() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체보기","1인주문","치킨","중국집","디저트"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
        configureTableView()
                
    }
    
    func configureTableView() {
        
        scrollView.addSubview(first.configureTableView(index: 0))
        scrollView.addSubview(second.configureTableView(index: 1))
        scrollView.addSubview(third.configureTableView(index: 2))
        scrollView.addSubview(fourth.configureTableView(index: 3))
        scrollView.addSubview(fifth.configureTableView(index: 4))
        
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        
        scrollView.backgroundColor = .clear
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
        scrollView.contentSize = CGSize(width: 415 * 5, height: scrollView.frame.height)
        print("table 뷰의 \(scrollView.frame.height)")
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceVertical = false
    }
}
