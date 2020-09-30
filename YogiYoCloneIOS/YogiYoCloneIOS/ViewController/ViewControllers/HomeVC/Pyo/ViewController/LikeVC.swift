//
//  LikeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LikeVC: UIViewController {
    
    lazy var likeTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = ColorPiker.customGray
        tableView.dataSource = self
        tableView.register(NilViewCustomCell.self, forCellReuseIdentifier: NilViewCustomCell.identifier)
        tableView.register(LikeViewCustomCell.self, forCellReuseIdentifier: LikeViewCustomCell.identifier)
        return tableView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "찜"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        
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
    
    @objc func pushlistVC(_ sender: UIButton) {
        let listVC = StoreListVC()
        listVC.categoryIndex = sender.tag
        navigationController?.pushViewController(listVC, animated: true)
    }
}
