//
//  DidSearchVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/10/06.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DidSearchVC : UIViewController {
  
  let searchfield = UITextField()
  let topView = TopView()
  let tableV = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = searchfield
    view.backgroundColor = .yellow
    
    setNavi()
    setSearchfield()
    setTableView()
    topViewFrame()
    constrain()
  }
  //MARK:-Searchfield
  func setSearchfield(){
    searchfield.sizeToFit()
    searchfield.placeholder = "음식점이나 메뉴명으로 검색하세요."
    searchfield.keyboardType = .default
    searchfield.tintColor = .systemPink
     //항시대기
    searchfield.sizeToFit()
    searchfield.clearButtonMode = .always
    searchfield.delegate = self
  }
  func topViewFrame(){
    topView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 135)
    view.addSubview(topView)
    topView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  //MARK:- navi
  func setNavi(){
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.barStyle = .default
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(becomeSearchDidTab( _:)))
    navigationItem.leftBarButtonItem?.tintColor = .systemPink
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply.circle.fill"), style: .done, target: self, action: #selector(canceltoDidTab( _:)))
    navigationItem.rightBarButtonItem?.tintColor = .lightGray
      
      
     // title: "취소", style: .plain, target: self, action: #selector(canceltoDidTab( _:)))
  }
  
  //MARK:- Aactions
  
  @objc func becomeSearchDidTab(_ sender: UIButton){
    
  }
  
  @objc func canceltoDidTab(_ sender: UIButton){
    self.resignFirstResponder()
//    let vc = SearchVC()
    navigationController?.popViewController(animated: true)
    
  }
}

func setTableView(){
  
//  tableV.dataSource = self
  //tableview.delegate = self
//  tableV.frame = view.frame
//  tableV.rowHeight = 44
//  tableV.backgroundColor = .white
//  tableV.separatorStyle = .none
//  tableV.clipsToBounds = true
//  view.addSubview(tableV)
  
 // tableV.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
}


func constrain(){
  NSLayoutConstraint.activate([
    
    
  ])

}


extension DidSearchVC : UITextFieldDelegate{
  func textFieldDidChangeSelection(_ textField: UITextField) {
    navigationController?.popViewController(animated: false)
  }
}
