//
//  StackButtonView.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/08/31.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class StackButtonView: UIView {
    
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
    
    let motherStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 1
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        self.addSubview(motherStack)
        
        buttonSetTitle()
        
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
        motherStack.addArrangedSubview(firstStack)
    }
    private func setTwiceStack() {
        [button3, button4, button5].forEach {
            twiceStack.addArrangedSubview($0)
        }
        motherStack.addArrangedSubview(twiceStack)
    }
    private func setThirdStack() {
        
    }
}
