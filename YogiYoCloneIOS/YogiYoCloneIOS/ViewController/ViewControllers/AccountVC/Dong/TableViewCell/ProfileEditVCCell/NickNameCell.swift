//
//  NickNameCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/29.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class NickNameCell: UITableViewCell {
    
    // MARK: Properties
    var user: User? {
        didSet {
            nickName.text = user?.nickName
            print("in NickName\(nickName.text)")
        }
    }
    
    static let cellID = "NickNameCellID"
    
    private let topDeviderView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var nickNameTitle: UILabel = {
       let label = UILabel()
        label.text = "닉네임"
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()

    var nickName: UILabel = {
       let label = UILabel()
        label.text = "ㄴㅇㄹㄹ"
        return label
    }()
    
    private let changeButton: UIButton = {
       let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.4
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
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
        
        [nickNameTitle, nickName, changeButton, topDeviderView].forEach {
            addSubview($0)
        }
        
        nickNameTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(15)
        }
        
        nickName.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(15)
        }
        
        changeButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(30)
            make.width.equalTo(55)
        }
        
        topDeviderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.3)
        }
    }
}

