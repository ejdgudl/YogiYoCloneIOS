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

class FilterButton: UIView {

//    MARK:  Properties
    private let filterLabel : UILabel = {
        let label = UILabel()
        label.text = "필터"
        return label
    }()
    
    weak var delegate : StoreListFilterViewDelegate?
    
    
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
        
        backgroundColor = .systemBlue
        addSubview(filterLabel)
        
        filterLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(10)
        }
        
        
 }

    
//    MARK: Selector

    @objc func presentingfilterView() {
        delegate?.presentStorefilterView()
    }

}
