//
//  TopImageView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class TopImageView: UIView {
    
    // MARK: Properties
    var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TopImageView")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        addSubview(topImageView)
        
        topImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
    }
}
