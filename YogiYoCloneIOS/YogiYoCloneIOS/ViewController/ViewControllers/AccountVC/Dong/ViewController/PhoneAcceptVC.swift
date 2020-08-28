//
//  PhoneAcceptVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/27.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Firebase

class PhoneAcceptVC: UIViewController {
    
    // MARK: Properties
    private let titleLabel: TitleLabel = {
        let label = TitleLabel()
        return label
    }()
    
    private let phoneNumTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "전화번호 입력('-'제외)"
        return tf
    }()
    
    private let getCodeButton: GetCodeButton = {
        let button = GetCodeButton()
        button.addTarget(self, action: #selector(didTapGetCodeButton), for: .touchUpInside)
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
    
    private let codeTextField: TextField = {
        let tf = TextField()
        tf.placeholder = "4자리 인증번호 입력"
        tf.textContentType = .oneTimeCode
        return tf
    }()
    
    private let helpTitleLabel: HelpTitleLabel = {
        let label = HelpTitleLabel()
        return label
    }()
    
    private let finishButton: FinishButton = {
        let button = FinishButton()
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
    
    @objc func didTapGetCodeButton() {
        guard let phoneNum = phoneNumTextField.text, phoneNum.count == 11 else { return print("no번호")}
        let number = "+82\(phoneNum)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
            debugPrint("에러는\(error)")
            return
          }
//            print(verificationID)
        }
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
        Auth.auth().languageCode = "kr"
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
