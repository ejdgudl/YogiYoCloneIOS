//
//  StoreListFilterView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

protocol StoreListFilterViewDelegate : class {
    func presentStorefilterView()
}

class StoreListFilterView: UIView {

//    MARK:  Properties
    

    private let indicatorView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let filterLabel : UILabel = {
        let label = UILabel()
        label.text = "필터"
        label.font = UIFont(name: FontModel.customSemibold, size: 18)
        return label
    }()
    
    private let closeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(filtercloseButton), for: .touchUpInside)
        return button
    }()
    
    private let setinit : UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let horizontalIndicator : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let verticalIndicator : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let checkButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"circle.fill"), for: .selected)
        button.setImage(UIImage(systemName:"circle"), for: .normal)
        button.imageView?.tintColor = .systemGray
        return button
    }()
    
    private let filterDetailLabel : UILabel = {
        let label = UILabel()
        label.text = "요기요 랭킹순"
        return label
    }()
    
    private let checkButton2 : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"circle.fill"), for: .selected)
        button.setImage(UIImage(systemName:"circle"), for: .normal)
        button.imageView?.tintColor = .systemGray
        return button
    }()
    
    private let filterDetailLabel2 : UILabel = {
        let label = UILabel()
        label.text = "결제수단 전체"
        return label
    }()
    
    private let checkButton3 : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"circle.fill"), for: .selected)
        button.setImage(UIImage(systemName:"circle"), for: .normal)
        button.imageView?.tintColor = .systemGray
        return button
    }()
    
    private let filterDetailLabel3 : UILabel = {
        let label = UILabel()
        label.text = "별점순"
        return label
    }()
    
    private let checkButton4 : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"circle.fill"), for: .selected)
        button.setImage(UIImage(systemName:"circle"), for: .normal)
        button.imageView?.tintColor = .systemGray
        return button
    }()
    
    private let filterDetailLabel4 : UILabel = {
        let label = UILabel()
        label.text = "리뷰 많은 순"
        return label
    }()
    
    private let checkButton5 : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"circle.fill"), for: .selected)
        button.setImage(UIImage(systemName:"circle"), for: .normal)
        button.imageView?.tintColor = .systemGray
        return button
    }()
    
    private let filterDetailLabel5 : UILabel = {
        let label = UILabel()
        label.text = "최소 주문 금액 순"
        return label
    }()
    
    private let enterButton : UIButton = {
        let button = UIButton()
        button.setTitle("적용", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorPiker.customRed
        return button
    }()
    
    private let orderfiltertitle : [String] = ["요기요 랭킹순","배달비용순","별점순","리뷰 많은 순","최소 주문 금액 순"]
    
    private let paymentfiltertitle : [String] = ["결제수단 전체","배달비용순","별점순","리뷰 많은 순","최소 주문 금액 순"]

    
    
 //    MARK:  LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUiSet()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    MARK:  Configure
    func configUiSet() {
        
        backgroundColor = .white
        addSubview(indicatorView)
        indicatorView.addSubview(filterLabel)
        
        
        [horizontalIndicator,verticalIndicator,closeButton,setinit,enterButton].forEach({
            self.addSubview($0)
        })
        
        horizontalIndicator.snp.makeConstraints { (make) in
            make.top.equalTo(filterLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(0)
            make.width.equalTo(self.frame.width)
            make.height.equalTo(0.5)
        }
        
        verticalIndicator.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom)
            make.bottom.equalTo(0)
            make.leading.equalTo(self.snp.centerX)
            make.width.equalTo(0.5)
        }
        
        filterLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(10)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(filterLabel.snp.centerY)
            make.bottom.top.equalTo(filterLabel)
            make.leading.equalTo(self.snp.leading).inset(10)
        }
        
        setinit.snp.makeConstraints { (make) in
            make.centerY.equalTo(filterLabel.snp.centerY)
            make.bottom.top.equalTo(filterLabel)
            make.trailing.equalTo(self.snp.trailing).inset(10)
            
        }
        
        enterButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).multipliedBy(1.6)
            make.leading.trailing.bottom.equalTo(0)
        }
        
        let stack = UIStackView(arrangedSubviews: [checkButton,filterDetailLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).inset(10)
        }
        
        let stack2 = UIStackView(arrangedSubviews: [checkButton2,filterDetailLabel2])
        stack2.axis = .horizontal
        stack2.distribution = .fillProportionally
        stack2.spacing = 4
        
        addSubview(stack2)
        stack2.snp.makeConstraints { (make) in
            make.top.equalTo(horizontalIndicator.snp.bottom).offset(10)
            make.leading.equalTo(verticalIndicator.snp.trailing).offset(10)
        }
        

        
}
 

    
//    MARK: Selector

    @objc func filtercloseButton() {
    }

}
