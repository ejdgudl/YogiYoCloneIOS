//
//  MenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuListVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
    }
    
    // MARK: @objc
    @objc private func didTapNext() {
        let detailMenuVC = DetailMenuVC()
        detailMenuVC.modalPresentationStyle = .fullScreen
        self.present(detailMenuVC, animated: true)
    }
}
