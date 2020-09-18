//
//  StorebigView.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/18.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StoreFilterbigView: UIView {

    private let storeFilterView = StoreListFilterView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        
        
        self.addSubview(storeFilterView)
        self.storeFilterView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(self.snp.bottom)
        }
                
//        backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMenu() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear) {
            self.storeFilterView.frame = CGRect(x: self.storeFilterView.frame.origin.x, y: -1000, width: self.storeFilterView.frame.width, height: self.storeFilterView.frame.height)
                        
        }
    }
    
}
