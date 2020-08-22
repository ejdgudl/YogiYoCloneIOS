//
//  SegmentCell.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/22.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SegmentCell: UICollectionViewCell {
    
    // MARK: Properties
    static let cellID = "SegmentCellID"
    
    private var menuCount = 0
    private var reviewCount = 0
    
    private lazy var segmentedControl: UISegmentedControl = {
       let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "메뉴 \(menuCount)", at: 0, animated: true)
        sc.insertSegment(withTitle: "클린리뷰 \(reviewCount)", at: 1, animated: true)
        sc.insertSegment(withTitle: "정보", at: 2, animated: true)
        sc.selectedSegmentIndex = 0
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ], for: .normal)
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red
        ], for: .selected)
        sc.removeBorders()
        return sc
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
        
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .white
        
        addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
