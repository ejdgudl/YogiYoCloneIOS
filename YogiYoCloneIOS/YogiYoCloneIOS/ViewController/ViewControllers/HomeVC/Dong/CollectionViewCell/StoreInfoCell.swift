//
//  StoreInfoCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/21.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StoreInfoCell: UICollectionViewCell {
    
    // MARK: Properties
    static let cellID = "StoreInfoCellID"
    
    private var minPrice = 10000
    private var deliPrice = 10000
    private var payMent = "요기서 결제"
    
    let numberFormatter = NumberFormatter()
    
    private lazy var minOrderPrice: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: minPrice))
        let string = "·최소주문  " + "\(price ?? "")" + "원"
        label.setAttribute(label: label, string: string)
        return label
    }()
    
    private lazy var payMentLbl: UILabel = {
        let label = UILabel()
        let string = "·결제방법  \(payMent)"
        label.setAttribute(label: label, string: string)
        return label
    }()
    
    private lazy var deliveryPrice: UILabel = {
        let label = UILabel()
        let price = numberFormatter.string(from: NSNumber(value: deliPrice))
        let string = "·배달요금  " + "\(price ?? "")" + "원"
        label.setAttribute(label: label, string: string)
        return label
    }()
    
    private lazy var payStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [minOrderPrice, payMentLbl, deliveryPrice])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let notiTitle: UILabel = {
        let label = UILabel()
        label.text = "사장님알림"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기 >", for: . normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    
    private var notiTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.text = "aslkdfl;kasdf;akjsdhf;lashdf;lasadfasdfalsdfhalsjkdflasdflkasjdflkasdjflkjsdhf;lahsjdf;lkajsd;fiansugafnsjkglnafslgna;slkfgn;alskdjfg;laksdjf;lasdjf;laisdjflijsdjfli"
        return label
    }()
    
    private lazy var notiView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        [notiTitle, moreButton, notiTextLabel].forEach {
            view.addSubview($0)
        }
        notiTitle.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(11)
        }
        moreButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(11)
        }
        notiTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.notiTitle.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(11)
            make.bottom.equalToSuperview().inset(12)
        }
        return view
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        backgroundColor = .white
        
        [payStackView, notiView].forEach {
            addSubview($0)
        }
        
        payStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        notiView.snp.makeConstraints { (make) in
            make.top.equalTo(self.payStackView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
        }
    }
}
