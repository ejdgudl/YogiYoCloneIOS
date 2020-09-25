//
//  LikeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LikeVC: UIViewController {
    
    private lazy var likeTableView: LikeTableView = {
        let view = LikeTableView()
        view.likeTable.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "찜"
        
        setUI()
        setLayout()
    }
    private func setUI() {
        
        view.addSubview(likeTableView)
    }
    private func setLayout() {
        
        likeTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
