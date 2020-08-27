//
//  ShardVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/26.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ShareVC: UIViewController {
  
  let shareView = ShareView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = ColorPiker.customAlpha2
    shareViewFrame()
    print("뷰디드")
  }
  
  //MARK: -shareViewFrmae
  func shareViewFrame(){
    shareView.frame = CGRect(x: 20, y: 700, width: view.frame.width - 40, height: view.frame.height/3)
    view.addSubview(shareView)
    setUI()
  }
  
  
  //MARK: -viewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    UIView.animate(withDuration: 0.5, animations: {
      self.shareView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 40, height: self.view.frame.height/3)
      self.shareView.center = self.view.center
      self.setButton()
      self.constrain()
      print("윌")
    })
  }
  
  func setUI(){
    view.addSubview(cancelButton)
    view.addSubview(clipButton)
    view.addSubview(clipLable)
  }
  
   let cancelButton : UIButton = {
     let b  = UIButton()
     b.backgroundColor = .clear
     b.contentMode = .center
     return b
   }()
  
  let clipButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = .clear
    b.adjustsImageWhenHighlighted = false 
    b.contentMode = .scaleAspectFit
    return b
  }()
  let clipLable : UILabel = {
    let l = UILabel()
    l.backgroundColor = .black
    l.textColor = .white
    l.text = "URL복사가 완료되었습니다."
    l.layer.borderWidth = 1
    l.layer.borderColor = ColorPiker.customSystem.cgColor
    l.layer.cornerRadius = 15
    l.alpha = 0
    return l
  }()
  
  
  //MARK: -Button
  func setButton(){
    cancelButton.addTarget(self, action: #selector(cancelDidTap(_:)), for: .touchUpInside)
    clipButton.addTarget(self, action: #selector(cilpdidTap(_:)), for: .touchUpInside)
  }
  
  @objc func cancelDidTap(_ sender: UIButton){
  cancelAnimation()
    dismiss(animated: true, completion: nil)
  }
  
  @objc func cilpdidTap(_ sender: UIButton){
    UIPasteboard.general.string = "https://apps.apple.com/us/app/kakaotalk/id362057947"
    print("클립이 복사되었습니다.")
    cancelAnimation()
    dismiss(animated: true, completion: nil)
  }
  
  
  
  func cancelAnimation(){
     UIView.animate(withDuration: 0.4, animations: {
           self.shareViewFrame()
         })
   }
  
  //MARK: -constrain
  func constrain(){
    
    [cancelButton,clipButton,clipLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
   
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: shareView.leadingAnchor),
      cancelButton.heightAnchor.constraint(equalToConstant: 44),
      cancelButton.widthAnchor.constraint(equalTo: shareView.widthAnchor),
      cancelButton.bottomAnchor.constraint(equalTo: shareView.bottomAnchor),
      
      clipButton.centerXAnchor.constraint(equalTo: shareView.centerXAnchor, constant: 67),
      clipButton.widthAnchor.constraint(equalToConstant: 120),
      clipButton.heightAnchor.constraint(equalToConstant: 120),
      clipButton.centerYAnchor.constraint(equalTo: shareView.centerYAnchor),
      
      clipLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      clipLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    ])
  }
  
  func clipAnimation(){
    UIView.animate(withDuration: 0.7, animations: {
      self.clipLable.alpha = 1
    })
  }
  
}
/*
extension CATransition {
    func fadeTransition() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight

        return transition
    }
}
*/
