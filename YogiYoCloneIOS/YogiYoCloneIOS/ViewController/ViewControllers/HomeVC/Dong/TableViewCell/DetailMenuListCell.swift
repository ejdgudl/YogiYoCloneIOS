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
    
    var menuPrice: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var menuImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var menu: Menu? {
        didSet {
            menuImageView.kf.setImage(with: URL(string: menu?.image ?? " "))
            menuName.text = menu?.name
            guard let intPrice = menu?.price else { return }
            let string = "\(numberFormatter.string(from: NSNumber(value: intPrice)) ?? "")" + "원"
            menuPrice.text = string
        }
    }
    
    let numberFormatter = NumberFormatter()
    
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
        numberFormatter.numberStyle = .decimal
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [menuImageView, menuName, menuPrice].forEach {
            addSubview($0)
        }
        
        menuImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(170)
            make.height.equalTo(100)
        }
        
        menuName.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.centerY).inset(3)
            make.left.equalToSuperview().inset(18)
        }
        
        menuPrice.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.centerY).offset(3)
            make.left.equalToSuperview().inset(18)
        }
    }
}
