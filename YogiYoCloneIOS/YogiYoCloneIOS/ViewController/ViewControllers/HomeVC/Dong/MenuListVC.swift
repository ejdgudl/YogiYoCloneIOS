//
//  MenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuListVC: UIViewController {
    
    // MARK: Properties
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapSearchButton() {
        
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Configure
    private func configure() {
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        title = "가게 명"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
}



//navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
//// MARK: @objc
//@objc private func didTapNext() {
//    let detailMenuVC = DetailMenuVC()
//    detailMenuVC.modalPresentationStyle = .fullScreen
//    self.present(detailMenuVC, animated: true)
//}
