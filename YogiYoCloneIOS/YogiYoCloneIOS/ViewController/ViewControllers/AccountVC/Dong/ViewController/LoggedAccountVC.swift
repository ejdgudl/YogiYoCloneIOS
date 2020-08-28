//
//  LoggedAccountVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/28.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class LoggedAccountVC: UIViewController {
    
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
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.cellID)
        tableView.register(BenefitCell.self, forCellReuseIdentifier: BenefitCell.cellID)
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .lightGray
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
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
//        case 3:
//            return 60
//        default:
//            return 50
        default:
            return CGFloat()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.cellID, for: indexPath) as? ProfileCell else { return UITableViewCell() }
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
//        case 3:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
//            cell.titleLabel.text = "요기서 1초 결제 관리"
//            return cell
//        case 4:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
//            cell.titleLabel.text = "이벤트 및 공지사항"
//            cell.newImageView.backgroundColor = .red
//            return cell
//        case 5:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
//            cell.titleLabel.text = "요기요 안내"
//            return cell
//        case 6:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomListCell.cellID, for: indexPath) as? BottomListCell else { return UITableViewCell() }
//            cell.titleLabel.text = "고객만족센터"
//            return cell
        default:
            return UITableViewCell()
        }
    }
}
