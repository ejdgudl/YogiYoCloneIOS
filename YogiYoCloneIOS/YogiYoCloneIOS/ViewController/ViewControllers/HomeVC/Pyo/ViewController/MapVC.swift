//
//  MapVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class MapVC: UIViewController {
    
    let topView: TopSearchView = {
        let view = TopSearchView()
        return view
    }()
    
    private lazy var addressTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NearestCustomCell.self, forCellReuseIdentifier: NearestCustomCell.identifier)
        tableView.register(NearestListCustomCell.self, forCellReuseIdentifier: NearestListCustomCell.identifier)
        tableView.register(ExplainCustomCell.self, forCellReuseIdentifier: ExplainCustomCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    private func setUI() {
        
        view.backgroundColor = ColorPiker.customGray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismiss(_:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
        title = "배달 주소 설정"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:16, weight: .light)]
        
        view.addSubview(topView)
        
        view.addSubview(addressTableView)
    }
    private func setLayout() {
        
        topView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(topView.snp.width).multipliedBy(0.32)
        }
        
        addressTableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(CollectionDesign.padding / 2)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    @objc func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
