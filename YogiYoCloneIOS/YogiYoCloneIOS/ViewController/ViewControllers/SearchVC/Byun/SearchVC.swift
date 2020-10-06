//
//  SearchVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
  
  let searchfield = UITextField()
  let tableview = UITableView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = searchfield
    view.backgroundColor = .yellow
    setNavi()
    setSearchfield()
    setTableView()
   // fechData()
    
    filterData = data
  }
  //MARK:-Searchfield
  func setSearchfield(){
    searchfield.sizeToFit()
    searchfield.placeholder = "음식점이나 메뉴명으로 검색하세요."
    searchfield.keyboardType = .default
    searchfield.tintColor = .systemPink
    searchfield.becomeFirstResponder() //항시대기
    searchfield.sizeToFit()
    searchfield.clearButtonMode = .always
    searchfield.delegate = self
  }
  //MARK:- navi
  func setNavi(){
    navigationController?.navigationBar.barTintColor = .white
    //navigationController?.navigationBar.tintColor = .systemPink
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.barStyle = .default
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchDidTab( _:)))
    navigationItem.leftBarButtonItem?.tintColor = .systemPink
    
    //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelDidTab( _:)))
  }
  
  //MARK:- Aactions
  
  @objc func searchDidTab(_ sender: UIButton){
    
  }
  
  @objc func cancelDidTab(_ sender: UIButton){
    self.resignFirstResponder()
    
  }
  //MARK: -fechData
    
    func setTableView(){
      
      tableview.dataSource = self
      tableview.delegate = self
      tableview.frame = view.frame
      tableview.rowHeight = 44
      tableview.backgroundColor = .white
      tableview.separatorStyle = .none
      tableview.clipsToBounds = true
      view.addSubview(tableview)
      
      tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
  
  let data = ["롯데리아","버거킹","치요남치킨","요거프레소","호식이두마리치킨","홍콩반점0410","홈플러스익스프레스","호치킨"]
  var filterData : [String]!
  
  }
  
  
  extension SearchVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")! as UITableViewCell
      cell.textLabel?.text = filterData[indexPath.row]
      
      return cell
      
    }
    
  }

extension SearchVC : UITextFieldDelegate {
  func textFieldDidChangeSelection(_ textField: UITextField) {
    filterData = []
    
    if searchfield.text == "" {
      filterData = data
    }else {
    for index in data {
      if index.lowercased().contains(textField.text?.lowercased() ?? "") {
        filterData.append(index)
      }
    }
    self.tableview.reloadData()
  }
}
}
extension SearchVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DidSearchVC()
        navigationController?.pushViewController(vc, animated: true)
    filterData.removeAll()
    
  }
}
