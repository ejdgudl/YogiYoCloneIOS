//
//  AccountVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class AccountVC: UIViewController {
    
    // MARK: Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
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
    
    @objc private func presentLoggedAccountVC() {
        let loggedAccountVC = LoggedAccountVC()
        navigationController?.pushViewController(loggedAccountVC, animated: true)
    }
    
    // MARK: Helpers
    private func configureNavi() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "마이요기요"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(didTapBellButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(didTapconfigButton))
    }
    
    // MARK: Configure
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SignCell.self, forCellReuseIdentifier: SignCell.cellID)
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.cellID)
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.cellID)
        tableView.register(BottomListCell.self, forCellReuseIdentifier: BottomListCell.cellID)
        NotificationCenter.default.addObserver(self, selector: #selector(presentLoggedAccountVC), name: name, object: nil)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .lightGray
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
        case 1:
            return 85
        case 2:
            return 100
        default:
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SignCell.cellID, for: indexPath) as? SignCell else { return UITableViewCell() }
            cell.singInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletCell.cellID, for: indexPath) as? WalletCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.cellID, for: indexPath) as? BannerCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "요기서 1초 결제 관리"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "이벤트 및 공지사항"
            cell.newImageView.backgroundColor = .red
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "요기요 안내"
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
            cell.titleLabel.text = "고객만족센터"
            return cell
        default:
            return UITableViewCell()
        }
    }
}
