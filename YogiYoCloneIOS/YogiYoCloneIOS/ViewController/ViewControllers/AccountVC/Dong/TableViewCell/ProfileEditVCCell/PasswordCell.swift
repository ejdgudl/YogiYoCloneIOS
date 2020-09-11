//
//  PasswordCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PasswordCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "PasswordCellID"
    
    private let topDeviderView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var passordTitle: UILabel = {
       let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()

    var passord: UILabel = {
       let label = UILabel()
        label.text = "SNS계정에서 변경하실 수 있습니다."
        return label
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [passordTitle, passord, topDeviderView].forEach {
            addSubview($0)
        }
        
        passordTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        passord.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(15)
        }
        
        topDeviderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.3)
        }
    }
}
