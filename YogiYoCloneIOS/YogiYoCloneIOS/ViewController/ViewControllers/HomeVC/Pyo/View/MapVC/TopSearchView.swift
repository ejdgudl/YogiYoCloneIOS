//
//  TopSearchView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class TopSearchView: UIView {
    
    private let textField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView()
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .systemRed
        imageView.frame = CGRect(x: 10, y: 0, width: 20, height: 20)
        paddingView.addSubview(imageView)
        
        textField.leftViewMode = .always
        textField.leftView = paddingView
        textField.leftView?.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        
        textField.tintColor = .systemRed
        textField.layer.borderWidth = 0.25
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.placeholder = "건물명, 도로명 또는 지번으로 검색"
        textField.font = .systemFont(ofSize: 14)
        textField.placeholderRect(forBounds: CGRect(x: 10, y: 0, width: 100, height: 50))
        return textField
    }()
    
    private let cancleButton: UIButton = {
       let button = UIButton()
        button.setTitle("취소", for: .normal)
        return button
    }()
    
    private let nowButton: UIButton = {
        let button = UIButton()
        button.setTitle("현재 위치로 주소 찾기", for: .normal)
        button.setImage(UIImage(systemName: "power"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.black, for: .normal)
        button.imageView?.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .thin)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground
        
        setTextField()
        setCancleButton()
        setNowButton()
    }
    private func setTextField() {
        
        self.addSubview(textField)
        
        textField.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(CollectionDesign.padding)
            $0.height.equalTo(textField.snp.width).multipliedBy(0.13)
        }
    }
    private func setCancleButton() {
        
    }
    private func setNowButton() {
        
        self.addSubview(nowButton)
        
        nowButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(CollectionDesign.padding)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
