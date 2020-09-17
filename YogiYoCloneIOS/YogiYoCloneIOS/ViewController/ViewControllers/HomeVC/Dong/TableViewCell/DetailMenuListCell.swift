//
//  DetailMenuListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/09/17.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailMenuListCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "DetailMenuListCellID"
    
    var menuName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        backgroundColor = .blue
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [menuImageView, menuName].forEach {
            addSubview($0)
        }
        
        menuImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(170)
            make.height.equalTo(100)
        }
        
//        menuName
    }
}
