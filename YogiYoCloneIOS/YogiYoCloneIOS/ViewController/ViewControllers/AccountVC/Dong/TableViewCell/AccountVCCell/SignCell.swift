//
//  MyAccountListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SignCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "SignCellID"
    
    private let signText: UILabel = {
        let label = UILabel()
        label.text = "로그인 하고 다양한 혜택을 받아보세요!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    private let singUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
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
        
        [signText, singInButton, singUpButton].forEach {
            addSubview($0)
        }
        
        signText.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.centerY)
            make.top.left.right.centerX.equalToSuperview()
        }
        
        singInButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.centerX).inset(6)
            make.left.bottom.equalToSuperview().inset(15)
        }
        
        singUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.centerX).offset(6)
            make.right.bottom.equalToSuperview().inset(15)
        }
    }
}
