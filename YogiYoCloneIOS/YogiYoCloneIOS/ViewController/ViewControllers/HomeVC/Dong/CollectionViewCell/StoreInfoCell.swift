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
        backgroundColor = .black
        
    }
}
