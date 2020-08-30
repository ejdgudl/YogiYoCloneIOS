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
import NaverThirdPartyLogin
import Alamofire

class LogVC: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    let acceptVC = AcceptVC()
    
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
                self.navigationController?.pushViewController(self.acceptVC, animated: true)
                guard let token = oAuthToken else { return }
                print("Login With Kakao Suc And Token is \(token)")
            }
        }
    }
    
    @objc private func didTapNaverButton(_ sender: UIButton) {
        loginInstance?.requestThirdPartyLogin()
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
        
        loginInstance?.delegate = self
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
            cell.naverButton.addTarget(self, action: #selector(didTapNaverButton), for: .touchUpInside)
            return cell
        }
    }
}

extension LogVC: NaverThirdPartyLoginConnectionDelegate {
    // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        
    }
    
    // 로그인에 성공했을 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        guard let accessToken = loginInstance?.accessToken else { return }
        print("[Success] : Success Naver Login And Token is \(accessToken)")
        self.navigationController?.pushViewController(acceptVC, animated: true)
    }
    
    // 접근 토큰 갱신
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        
    }
    
    // 로그아웃 할 경우 호출(토큰 삭제)
    func oauth20ConnectionDidFinishDeleteToken() {
        loginInstance?.requestDeleteToken()
    }
    
    // 모든 Error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("[Error] :", error.localizedDescription)
    }
}
