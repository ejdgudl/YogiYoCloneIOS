//
//  MapVC.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MapVC: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MapVC dismiss", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        button.frame = CGRect(x: view.center.x - 100,
                              y: view.center.y, width: 200, height: 100)
        button.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @objc func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
