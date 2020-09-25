//
//  LikeTableView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class LikeTableView: UIView {
    
    let likeTable: UITableView = {
        let tableView = UITableView()
        tableView.register(NilViewCustomCell.self, forCellReuseIdentifier: NilViewCustomCell.identifier)
        tableView.register(LikeViewCustomCell.self, forCellReuseIdentifier: LikeViewCustomCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(likeTable)
        
        likeTable.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
