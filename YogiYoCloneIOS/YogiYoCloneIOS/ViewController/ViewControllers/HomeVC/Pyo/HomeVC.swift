//
//  HomeVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
    }
    
    // MARK: @objc
    @objc private func didTapNext() {
        let sotreListVC = StoreListVC()
        navigationController?.pushViewController(sotreListVC, animated: true)
    }
    
}
