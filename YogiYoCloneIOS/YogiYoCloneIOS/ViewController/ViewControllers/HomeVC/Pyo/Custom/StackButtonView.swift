//
//  StackButtonView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StackButtonView: UIView {
    
    let motherStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()
    
    let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    let twiceStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    
    let thirdStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    
    let fourthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    let button10 = UIButton()
    let button11 = UIButton()
    let button12 = UIButton()
    
    let fifthStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 1
        return stack
    }()
    let button13 = UIButton()
    let button14 = UIButton()
    let button15 = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        self.addSubview(motherStack)
        
        motherStack.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        buttonSetTitle()
        setFirstStack()
        setTwiceStack()
        setThirdStack()
        setFourthStack()
        setFifthStack()
        
    }
    private func buttonSetTitle() {
        let homeVC = HomeVC()
        var index = 0
        [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15].forEach {
            $0.setTitle(homeVC.testCategory[index], for: .normal)
            index += 1
        }
    }
    private func setFirstStack() {
        [button1, button2, button3].forEach {
            firstStack.addArrangedSubview($0)
        }
        button1.setTitle("전체보기", for: .normal)
        button2.setTitle("요기요플러스", for: .normal)
        button3.setTitle("테이크아웃", for: .normal)
        motherStack.addArrangedSubview(firstStack)
    }
    private func setTwiceStack() {
        [button4, button5, button6].forEach {
            twiceStack.addArrangedSubview($0)
        }
        button4.setTitle("중국집", for: .normal)
        button5.setTitle("치킨", for: .normal)
        button6.setTitle("한식", for: .normal)
        motherStack.addArrangedSubview(twiceStack)
    }
    private func setThirdStack() {
        [button7, button8, button9].forEach {
            thirdStack.addArrangedSubview($0)
        }
        button7.setTitle("피자/양식", for: .normal)
        button8.setTitle("카페/디저트", for: .normal)
        button9.setTitle("분식", for: .normal)
        motherStack.addArrangedSubview(thirdStack)
    }
    private func setFourthStack() {
        [button10, button11, button12].forEach {
            fourthStack.addArrangedSubview($0)
        }
        button10.setTitle("1인분주문", for: .normal)
        button11.setTitle("일식/돈까스", for: .normal)
        button12.setTitle("야식", for: .normal)
        motherStack.addArrangedSubview(fourthStack)
    }
    private func setFifthStack() {
        [button13, button14, button15].forEach {
            fifthStack.addArrangedSubview($0)
        }
        button13.setTitle("족발/보쌈", for: .normal)
        button14.setTitle("프랜차이즈", for: .normal)
        button15.setTitle("편의점/마트", for: .normal)
        motherStack.addArrangedSubview(fifthStack)
    }
}
