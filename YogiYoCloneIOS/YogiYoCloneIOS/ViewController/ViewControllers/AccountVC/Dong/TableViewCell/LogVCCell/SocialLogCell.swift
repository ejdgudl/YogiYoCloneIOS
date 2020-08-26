//
//  SocialLogCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SocialLogCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "SocialLogCellID"
    
    let kakaoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Kakao"), for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private let naverButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Naver"), for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .red
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Apple"), for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .blue
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
        
        [kakaoButton, naverButton, appleButton].forEach {
            addSubview($0)
        }
        
        kakaoButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        
        naverButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.kakaoButton.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        
        appleButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.naverButton.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
    }
}
