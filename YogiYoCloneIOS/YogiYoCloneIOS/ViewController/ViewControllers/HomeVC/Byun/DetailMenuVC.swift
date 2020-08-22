//
//  DetailMenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailMenuVC: UIViewController {
// test용
//  let testsLable : UILabel = {
//    let l = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 90))
//  //  l.font = UIFont(name: FontModel.customSemibold, size: 20)
//    l.font = FontModel.toSize.customFont
//    l.numberOfLines = 2
//    l.text = "전화주문"//"피자알볼로(POSMENU FINAL)"
//    l.textColor = .black//ColorPiker.customDarkGray
//    return l
//  }()
  
    let tableView = UITableView()
    
      override func viewDidLoad() {
          super.viewDidLoad()

       setTableView()
            
    }
    
    func setTableView(){
      tableView.dataSource = self
        tableView.delegate = self
        
        tableView.frame = view.frame
        tableView.rowHeight = 80
        tableView.backgroundColor = .black
        view.addSubview(tableView)
          
      tableView.register(Detail1TableViewCell.self, forCellReuseIdentifier: "Detail1TableViewCell")
    }
    
    
  }
  //MARK: -UITableViewDataSource

  extension DetailMenuVC: UITableViewDataSource{
  //  func numberOfSections(in tableView: UITableView) -> Int {
  //    4
  //  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      10
      //data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Detail1TableViewCell", for: indexPath) as! Detail1TableViewCell
      
  //     let cellModel = cells[indexPath.row]
  //
  //      switch cellModel {
  //      case .status(let status):
  //        let cell = ...
  //        return cell
  //      case .photo(let photo):
  //        let cell = ...
  //        return cell
  //      }
  //    }
      return cell
    }
  }
extension DetailMenuVC: UITableViewDelegate{

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

return 80
}
}

//스크롤뷰 제어
extension DetailMenuVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 1 {
      scrollView.contentOffset.y = 1
    }
    print(scrollView.contentOffset.y)
 }
}

  
   

