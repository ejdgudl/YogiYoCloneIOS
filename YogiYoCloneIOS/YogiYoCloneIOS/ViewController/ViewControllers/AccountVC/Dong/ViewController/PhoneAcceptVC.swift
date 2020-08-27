//
//  PhoneAcceptVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class PhoneAcceptVC: UIViewController {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대전화 등록"
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private let phoneNumTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "전화번호 입력('-'제외)"
        tf.layer.cornerRadius = 0
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        return tf
    }()
    
    private let getCodeButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setTitle("인증번호 받기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.addSubview(phoneNumTextField)
        view.addSubview(getCodeButton)
        phoneNumTextField.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.65)
        }
        getCodeButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.phoneNumTextField.snp.right).offset(7)
        }
        return view
    }()
    
    private let codeTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "4자리 인증번호 입력"
        tf.textContentType = .oneTimeCode
        tf.layer.cornerRadius = 0
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 0.5
        return tf
    }()
    
    private let helpTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "인증번호가 도착하지 않았을 경우 '인증번호 받기' 버튼을 다시 눌러주세요."
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .brown
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입 완료", for: .normal)
        button.backgroundColor = .lightGray
        return button
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "휴대폰 인증"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        [titleLabel, containerView, codeTextField, helpTitleLabel, finishButton].forEach {
            view.addSubview($0)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        codeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.containerView.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        helpTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeTextField.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
        
        finishButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.helpTitleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(17)
            make.height.equalTo(50)
        }
    }
    
}
