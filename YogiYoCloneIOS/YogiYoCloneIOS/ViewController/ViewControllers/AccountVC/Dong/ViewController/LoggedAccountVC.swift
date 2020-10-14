//
//  LoggedAccountVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import KakaoSDKUser
import NaverThirdPartyLogin
=======
>>>>>>> develop
import Alamofire

class LoggedAccountVC: UIViewController {
    
    // MARK: Properties
<<<<<<< HEAD
    var user: User? {
=======
    public var appUser: AppUser? {
>>>>>>> develop
        didSet {
            tableView.reloadData()
        }
    }
    
<<<<<<< HEAD
    var userPhoneNum: String?
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
=======
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ColorPiker.lightGray
>>>>>>> develop
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let profileEditVC = ProfileEditVC()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configure()
        configureViews()
<<<<<<< HEAD
        configureKakaoUser()
        configureNaverUser()
        configureAppleUser()
=======
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let id = self.appUser?.id else { return }
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        let header: HTTPHeaders = ["Authorization":"\(token)"]
        
        AF.request("http://52.79.251.125/users/\(id)", method: .get, headers: header).response { (res) in
            
            if let error = res.error {
                print("----- AF RESPONSE ERROR [GET] (USER INFO)----- \(error.localizedDescription)")
            }
            
            guard let code = res.response?.statusCode else { return }
            
            if code >= 200, code <= 299 {
                switch res.result {
                case .success(let data):
                    guard let data = data else { return }
                    do {
                        let result = try JSONDecoder().decode(AppUser.self, from: data)
                        self.appUser = result
                        print("----- AF RESULT SUCCESS [GET] (USER INFO)----- ")
                    } catch let error {
                        print("----- JSONDecoder ERROR (USER INFO)-----  \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("----- AF RESULT FAIL [GET] (USER INFO)----- \(error.localizedDescription)")
                }
            } else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [GET] (USER INFO)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [GET] (USER INFO)----- ")
            }
        }
>>>>>>> develop
    }
    
    // MARK: @Objc
    @objc private func didTapBellButton() {
        let yoFeedVC = YoFeedVC()
        navigationController?.pushViewController(yoFeedVC, animated: true)
    }
    
    @objc private func didTapconfigButton() {
        let configureVC = ConfigureVC()
        navigationController?.pushViewController(configureVC, animated: true)
    }
    
    @objc private func didTapSignInButton() {
        let logVC = LogVC()
        let nav = UINavigationController(rootViewController: logVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "마이요기요"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(didTapBellButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(didTapconfigButton))
    }
    
<<<<<<< HEAD
    private func configureKakaoUser() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                guard let nickName = user?.kakaoAccount?.profile?.nickname else { return }
                guard let userPhoneNum = self.userPhoneNum else { return }
                let user = User(nickName: nickName, phoneNum: userPhoneNum)
                self.user = user
            }
        }
    }
    
    private func configureNaverUser() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken { return }
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let userPhoneNum = self.userPhoneNum else { return }

            let user = User(nickName: name, phoneNum: userPhoneNum, email: email)
            self.user = user
        }
        print("[Success] : Success Naver Login And Token is \(accessToken)")
    }
    
    private func configureAppleUser() {
        guard let dic = UserDefaults.standard.dictionary(forKey: "appleUserInfo") else { return }
        guard let name = dic["fullName"] as? String else { return }
        guard let email = dic["email"] as? String else { return }
        guard let phoneNum = self.userPhoneNum else { return }
        let user = User(nickName: name, phoneNum: phoneNum, email: email)
        self.user = user
    }
    
    @objc private func goToEditVC() {
        profileEditVC.user = self.user
=======
    @objc private func goToEditVC() {
        profileEditVC.appUser = self.appUser
>>>>>>> develop
        navigationController?.pushViewController(profileEditVC, animated: true)
    }
    
    @objc private func dissmissWhenLogout() {
<<<<<<< HEAD
        self.user = nil
=======
        self.appUser = nil
>>>>>>> develop
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Configure
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.cellID)
        tableView.register(BenefitCell.self, forCellReuseIdentifier: BenefitCell.cellID)
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.cellID)
        tableView.register(SmallBannerCell.self, forCellReuseIdentifier: SmallBannerCell.cellID)
        tableView.register(BottomListCell.self, forCellReuseIdentifier: BottomListCell.cellID)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dissmissWhenLogout), name: logoutObserveName, object: nil)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
<<<<<<< HEAD
        view.backgroundColor = .lightGray
=======
        view.backgroundColor = .white
>>>>>>> develop
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension LoggedAccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 90
        case 1:
            return 48
        case 2:
            return 85
        case 3:
            return 70
        default:
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.cellID, for: indexPath) as? ProfileCell else { return UITableViewCell() }
<<<<<<< HEAD
            cell.userName.text = self.user?.nickName
=======
            cell.appUser = self.appUser
>>>>>>> develop
            cell.goToProfileEditButton.addTarget(self, action: #selector(goToEditVC), for: .touchUpInside)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BenefitCell.cellID, for: indexPath) as? BenefitCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletCell.cellID, for: indexPath) as? WalletCell else { return UITableViewCell() }
                cell.myCouponButton.setTitle("쿠폰함\n3장", for: .normal)
            cell.myPointButton.setTitle("포인트\n0원", for: .normal)
            cell.myReviewButton.setTitle("리뷰관리\n0건", for: .normal)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SmallBannerCell.cellID, for: indexPath) as? SmallBannerCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "요기서 1초 결제 관리"
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "이벤트 및 공지사항"
<<<<<<< HEAD
            cell.newImageView.backgroundColor = .red
=======
>>>>>>> develop
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "요기요 안내"
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "고객만족센터"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(profileEditVC, animated: true)
<<<<<<< HEAD
            profileEditVC.user = self.user
=======
            profileEditVC.appUser = self.appUser
>>>>>>> develop
        }
    }
}
