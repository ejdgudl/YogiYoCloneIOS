//
//  NilViewCustomCell.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class NilViewCustomCell: UITableViewCell {
    
    static let identifier = "NilViewCustomCell"
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LikeHouse")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let nilLabel: UILabel = {
        let label = UILabel()
        label.text = "찜한 음식점이 없습니다."
        label.font = UIFont(name: FontModel.customMedium, size: 14)
        return label
    }()
    private let explainLabel: UILabel = {
        let label = UILabel()
        label.text = """
            관심있는 음식점 상세화면에서 하트 아이콘을 눌러
            '찜' 하시면, 더욱 편리하게 이용하실 수 있어요!
            """
        label.font = UIFont(name: FontModel.customLight, size: 14)
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    private let nilButton: UIButton = {
        let button = UIButton()
        button.setTitle("음식점 보러가기", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customMedium, size: 14)
        button.backgroundColor = .systemRed
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none

    }
    private func setImageView() {
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
