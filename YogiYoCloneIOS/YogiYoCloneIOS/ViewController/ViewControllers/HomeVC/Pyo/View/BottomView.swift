//
//  BottomView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
//    private let motherStack: UIStackView = {
//        let stack = UIStackView()
//        stack.alignment = .center
//        stack.axis = .vertical
//        stack.spacing = CollectionDesign.padding
//        return stack
//    }()
    
    private let companyStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "(유)딜리버리히어로 코리아 사업자정보"
        label.font = UIFont(name: FontModel.customLight, size: 14)
        return label
    }()
    private let companyButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        return button
    }()
    private var toggle = false
    
    private var companyInformation: PaddingLabel = {
        let label = PaddingLabel()
        label.font = UIFont(name: FontModel.customLight, size: 12)
        label.backgroundColor = .systemBackground
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private let companyMenuStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    private let clauseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("이용약관", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customLight, size: 12)
        return button
    }()
    private let personalInfoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("개인정보처리방침", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customLight, size: 12)
        return button
    }()
    private let membershipButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("회원등급정책", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customLight, size: 12)
        return button
    }()
    private let companyInfoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("사업자정보확인", for: .normal)
        button.titleLabel?.font = UIFont(name: FontModel.customLight, size: 12)
        return button
    }()
    
    private let dutyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontModel.customLight, size: 10)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = """
        (유)딜리버리히어로 코리아는 통신판매중개자로서, 상품/거래정보 및 거래와 관련하여 통신판매 당사자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 책임을 지지 않습니다. 상품 및 거래에 대한 정확한 정보는 해당 판매자에게 직접확인 바랍니다.
        Copyright YOGIYO. ALL Rights Reserved.
        """
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        setCompanyStack()
        setCompanyInformation()
        setCompanyMenu()
        setDutyLabel()
        
//        self.addSubview(motherStack)
        
//        motherStack.snp.makeConstraints {
//            $0.top.leading.trailing.bottom.equalToSuperview()
//        }
    }
    @objc private func companyAction(_ sender: UIButton) {
        if !toggle {
            sender.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            companyInformation.padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            companyInformation.text = """
            주소 : 서초구 서초대로38길 12 마제스타시티 타워2 17층
            대표자 : 강신봉 | 사업자등록번호 : 211-88-68802
            통신판매업신고 : 제 2018-서울서초-2635호
            개인정보담당자 : privacy@yogiyo.co.kr
            고객만족센터 : 1661-5270 (24시간,연중무휴)
            이메일 : support@yogiyo.co.kr
            호스팅 제공자 : 카페24 주식회사
            입점 문의하기
            """
            
//            companyMenuStack.snp.updateConstraints {
//                $0.top.equalTo(companyInformation.snp.bottom).offset(CollectionDesign.padding)
//            }
            
            toggle = true
        } else {
            sender.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            companyInformation.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            companyInformation.text = nil
            
//            companyMenuStack.snp.updateConstraints {
//                $0.top.equalTo(companyStack.snp.bottom).offset(CollectionDesign.padding)
//            }
            
            toggle = false
        }
    }
    
    private func setCompanyStack() {
        
        companyButton.addTarget(self, action: #selector(companyAction(_:)), for: .touchUpInside)
        companyStack.addArrangedSubview(companyLabel)
        companyStack.addArrangedSubview(companyButton)
        
        self.addSubview(companyStack)
//        motherStack.addArrangedSubview(companyStack)
        
        companyStack.snp.makeConstraints {
            $0.top.equalToSuperview().offset(CollectionDesign.padding)
            $0.centerX.equalToSuperview()
        }
    }
    private func setCompanyInformation() {
        
        self.addSubview(companyInformation)
//        motherStack.addArrangedSubview(companyInformation)
        
        companyInformation.snp.makeConstraints {
            $0.top.equalTo(companyStack.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    private func setCompanyMenu() {
        
        companyMenuStack.addArrangedSubview(clauseButton)
        companyMenuStack.addArrangedSubview(personalInfoButton)
        companyMenuStack.addArrangedSubview(membershipButton)
        companyMenuStack.addArrangedSubview(companyInfoButton)
        
        self.addSubview(companyMenuStack)
//        motherStack.addArrangedSubview(companyMenuStack)
        
        companyMenuStack.snp.makeConstraints {
            $0.top.equalTo(companyStack.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalToSuperview().inset(CollectionDesign.padding * 2)
        }
    }
    private func setDutyLabel() {
        
        self.addSubview(dutyLabel)
//        motherStack.addArrangedSubview(dutyLabel)
        
        dutyLabel.snp.makeConstraints {
            $0.top.equalTo(companyMenuStack.snp.bottom).offset(CollectionDesign.padding)
            $0.leading.trailing.equalToSuperview().inset(CollectionDesign.padding)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
