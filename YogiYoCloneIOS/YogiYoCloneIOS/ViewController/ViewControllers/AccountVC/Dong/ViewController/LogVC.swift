//
//  LogVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LogVC: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapDismissButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapKakaoButton() {
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            AuthApi.shared.loginWithKakaoTalk { (oAuthToken, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                let acceptVC = AcceptVC()
                self.navigationController?.pushViewController(acceptVC, animated: true)
                guard let token = oAuthToken else { return }
                print("Login With Kakao Suc And Token is \(token)")
            }
        }
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapDismissButton))
    }
    
    // MARK: Configure
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LogoImageCell.self, forCellReuseIdentifier: LogoImageCell.cellID)
        tableView.register(LogCell.self, forCellReuseIdentifier: LogCell.cellID)
        tableView.register(SocialLogCell.self, forCellReuseIdentifier: SocialLogCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension LogVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        case 1:
            return 250
        default :
            return 300
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogoImageCell.cellID, for: indexPath) as? LogoImageCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogCell.cellID, for: indexPath) as? LogCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SocialLogCell.cellID, for: indexPath) as? SocialLogCell else { return UITableViewCell() }
            cell.kakaoButton.addTarget(self, action: #selector(didTapKakaoButton), for: .touchUpInside)
            return cell
        }
    }
}
