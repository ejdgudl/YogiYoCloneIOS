//
//  DetailMenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class DetailMenuVC: UIViewController {
 
  let costView = CostView()
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setTableView()
    costViewFrame()
    
    self.view.layoutIfNeeded()
    enum FeedItem {
      //  case status(Status)
      //  case photo(Photo)
    }
    
  }
  
  func costViewFrame(){
    costView.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50)
      view.addSubview(costView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  func setTableView(){
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.frame = view.frame
    tableView.rowHeight = UITableView.automaticDimension //동적높이
    // tableView.estimatedRowHeight = 0
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    view.addSubview(tableView)
    
    tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "ImageTableViewCell")//0
    tableView.register(SaleTableViewCell.self, forCellReuseIdentifier: "SaleTableViewCell")//1
    tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")//2
    tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")//3
    tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "ReviewTableViewCell")//4
    tableView.register(CostTableViewCell.self, forCellReuseIdentifier: "CostTableViewCell")//5
    tableView.register(ListMenuTableViewCell.self, forCellReuseIdentifier: "ListMenuTableViewCell")//5-1
    tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")//6
    tableView.register(ListOptionTableViewCell.self, forCellReuseIdentifier: "ListOptionTableViewCell")//6-1
    tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")//7
    tableView.register(BuyTableViewCell.self, forCellReuseIdentifier: "BuyTableViewCell")//8
    tableView.register(BuyLastTableViewCell.self, forCellReuseIdentifier: "BuyLastTableViewCell")//8-1
    tableView.register(NilCell.self, forCellReuseIdentifier: "NilCell")
    
 //   var cellRedister = [ImageTableViewCell.self,SaleTableViewCell.self,NameTableViewCell.self,DetailTableViewCell.self,ReviewTableViewCell.self,CostTableViewCell.self,ListMenuTableViewCell.self,MenuTableViewCell.self,ListOptionTableViewCell.self,OptionTableViewCell.self,OptionTableViewCell.self,BuyTableViewCell.self,BuyLastTableViewCell.self,NilCell.self]
    
//    for i in cellRedister {
//      tableView.register([cellRedister.], forCellReuseIdentifier: "\(cellRedister)")
//    }
    
    
    
  }
  
}
//MARK: -numberOfRowsInSection

extension DetailMenuVC: UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    5
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //  return 10 //data.count
    
    if section == 0 { //이미지,할인,메뉴명,상세,리뷰
      return 5
    }else if section == 1 { //가격
      return 1
    }else if section == 2 { //변경&추가 메뉴 옵션들
      return 2
    }else if section == 3 { //커스텀 옵션들
      return 2
    } else if section == 4 { //수량
      return 2
    }else {
      return 0
    }
  }
  
  //MARK:- cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let nilCell = tableView.dequeueReusableCell(withIdentifier: "NilCell", for: indexPath) as! NilCell
    nilCell.backgroundColor = .white
    
    switch indexPath.section {
    case 0:
      if indexPath.row == 0 {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        return imageCell
      } else if indexPath.row == 1 {
        let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableViewCell", for: indexPath) as! SaleTableViewCell
        return saleCell
      } else if indexPath.row == 2 {
        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        return nameCell
      } else if indexPath.row == 3 {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        return detailCell
      } else if indexPath.row == 4 {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return reviewCell
      }
      
    case 1:
      let costCell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as! CostTableViewCell
      return costCell
      
    case 2:
      if indexPath.row == 0 {
        let MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        return MenuCell
      }else if indexPath.row == 1 {
        if indexPath.row == 1 {
          let ListMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
          return ListMCell
        }
      }
    case 3:
      if indexPath.row == 0 {
        let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
        return optionCell
      }else if indexPath.row == 1{
        let listOPCell = tableView.dequeueReusableCell(withIdentifier: "ListOptionTableViewCell", for: indexPath) as! ListOptionTableViewCell
        return listOPCell
      }
    case 4:
      if indexPath.row == 0 {
      let buyCell = tableView.dequeueReusableCell(withIdentifier: "BuyTableViewCell", for: indexPath) as! BuyTableViewCell
      return buyCell
      }else if indexPath.row == 1{
      let buyLastCell = tableView.dequeueReusableCell(withIdentifier: "BuyLastTableViewCell", for: indexPath) as! BuyLastTableViewCell
      return buyLastCell
      }
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "NilCell", for: indexPath) as! NilCell
      cell.backgroundColor = .white
      print("not found")
      return cell
    }
    return nilCell
  }
  
  
  //MARK:-titleForFooterInSection
  //푸터뷰title
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    switch section {
    case 0:
      return " "
    case 1:
      return " "
    case 2:
      return " "
    case 3:
      return " "
    case 4:
      return " "
    default:
      return " "
    }
  }
  
  //MARK:-heightForFooterInSection
  //푸터뷰 높이
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    self.superclass
    switch section{
    case 0:
      return 1
    case 1:
      return 1
    case 2:
      return 1
    case 3:
      return 1
    case 4:
      return 0
    default:
      return 0
    }
    return 0
  }
}

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


extension DetailMenuVC: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
//    if indexPath.row == 2 {
//      return 0.0
//    }
//   return 100
//  }
//    switch indexPath.section {
//      case 0 :
//        return 250
//      case 1 :
//        return 200
//      case 2 :
//        return 20//data.count
//      case 3 :
//        return 20
//      case 4 :
//      return 40
//      default:
//        return 0
//      }
//  }
//}

//MARK:- UIScrollViewDelegate
//스크롤뷰 제어
extension DetailMenuVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 1 {
      scrollView.contentOffset.y = 1
    }
    print(scrollView.contentOffset.y)
  }
}


