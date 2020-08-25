//
//  LogCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LogCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "RestCellID"
    
    private lazy var emailTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "    이메일 주소 입력"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
    }()
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "    비밀번호 입력"
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
    }()
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "EmptyBox"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -45, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
        button.setTitle("자동 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private let deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let findPwButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private lazy var findStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findIdButton, findPwButton])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하기", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    private let signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("로그인 하기", for: .normal)
        button.backgroundColor = .lightGray
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
    
    // MARK: @objc
    @objc private func didTapCheckBoxButton() {
        switch checkBoxButton.isSelected {
        case false:
            checkBoxButton.setImage(UIImage(named: "NonEmptyBox"), for: .normal)
            checkBoxButton.isSelected = true
        case true:
            checkBoxButton.setImage(UIImage(named: "EmptyBox"), for: .normal)
            checkBoxButton.isSelected = false
        }
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        [emailTF, passwordTF, findStackView, signInButton].forEach{
            addSubview($0)
        }
        
        contentView.addSubview(checkBoxButton)

        emailTF.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(55)
        }
        
        passwordTF.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(self.emailTF.snp.bottom).offset(10)
            make.height.equalTo(55)
        }
        
        checkBoxButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTF.snp.bottom).offset(15)
            make.left.equalToSuperview().inset(10)
            make.height.equalTo(27)
        }
        
        findStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTF.snp.bottom).offset(15)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(27)
            self.findStackView.addSubview(self.deviderView)
            self.deviderView.snp.makeConstraints { (make) in
                make.width.equalTo(1)
                make.centerX.equalTo(self.findIdButton.snp.right).offset(1)
                make.top.bottom.equalToSuperview().inset(8)
            }
        }
        
        signInButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.top.equalTo(self.findStackView.snp.bottom).offset(10)
            make.height.equalTo(55)
        }
    }
}
