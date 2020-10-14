//
//  MenuListCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class MenuListCell: UITableViewCell {
    
    // MARK: Properties
    static let cellID = "MenuListCellID"
    
    private let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var listTitle: UILabel = {
        let label = UILabel()
        label.text = "인기메뉴"
        return label
    }()
    
<<<<<<< HEAD
    private let buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
=======
>>>>>>> develop
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
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
<<<<<<< HEAD
        backgroundColor = .lightGray
=======
        backgroundColor = ColorPiker.lightGray
>>>>>>> develop
        
        addSubview(baseView)
        
        baseView.snp.makeConstraints { (make) in
<<<<<<< HEAD
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview()
        }
        
        [listTitle, buttonImage].forEach {
=======
            make.top.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        [listTitle].forEach {
>>>>>>> develop
            baseView.addSubview($0)
        }
        
        listTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }
<<<<<<< HEAD
        
        buttonImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.top.right.equalToSuperview().inset(15)
        }
=======
>>>>>>> develop
    }
}
