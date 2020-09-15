//
//  DetailMenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class DetailMenuVC: UIViewController {
  
  var details = [Detail]()
  
  
  //section0-1
  var imageName = String()
  var mainName = String()
  var menuCation = String()
  var menuCost = String()
  
  //section2
  var optionGroupCount = Int()
  var menuMandatory = Bool()
  var menuName = String()
  
  //section3
  var optionsCount = Int()
  var optionsName = String()
  var optionsPrice = Int()
  
  //arr
  var arrMenu = [String]()
  var arrOption = [String]()
  
  //tset
  var arrtest = [String]()
  var menuList = [String]()
  
  
  let clipLable : UILabel = {
    let l = UILabel()
    l.backgroundColor = .black
    l.textColor = .white
    l.text = "URL복사가 완료되었습니다."
    l.textAlignment = .center
    l.layer.borderWidth = 3
    l.layer.borderColor = ColorPiker.customSystem.cgColor
    l.layer.cornerRadius = 15
    l.layer.masksToBounds = true
    l.alpha = 0
    return l
  }()
  
  let costView = CostView()
  let tableView = UITableView()
  
  lazy var rightButton = UIBarButtonItem(image: UIImage(systemName: "tray.and.arrow.up"), style: .plain, target: self, action: #selector(shareButton))
  lazy var leftButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissButton))
  
  //MARK:- life
  override func viewDidLoad() {
    super.viewDidLoad()
    
    AlamofireRequest()
    setTableView()
    costViewFrame()
    clipboradMessag()
    setNaviBar()
    
  }
  
  //MARK:- Popup Options
  func clipboradMessag(){
    clipLable.frame = CGRect(x: 40, y: 700, width: view.frame.width - 80, height: 44)
    view.addSubview(clipLable)
  }
  
  func clipAnimation(){
    UIView.animate(withDuration: 1, animations: {
      self.clipLable.alpha = 1
      self.clipAnimationLess()
    })
  }
  func clipAnimationLess(){
    UIView.animate(withDuration: 0.7, animations: {
      self.clipLable.alpha = 0
    })
  }
  
  func costViewFrame(){
    costView.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50)
    view.addSubview(costView)
  }
  
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  //MARK:-AlamofireRequest
  func AlamofireRequest() {
    
    AF.request("http://52.79.251.125/menu/10", method: .get).validate().responseJSON { response in
      
      switch response.result {
      //성공시
      case .success(let value):
        let json = JSON(value)
        //  print("JSON: \(json)")
        
        if let json = try? JSON(data: response.data!){
          
          let nameData = json["name"].stringValue//가져오고자 하는 데이터
          let captionData = json["caption"].stringValue
          let costData = json["price"].stringValue
          
          //section0-1
          self.mainName.append(nameData)
          self.menuCation.append(captionData)
          self.menuCost.append(costData)
          
          //section2
          let optionGroupe = json["option_group"].arrayValue
          print(optionGroupe.count)
          self.optionGroupCount = optionGroupe.count
          
          //배열 가져오기
          let menuData = json["option_group"].array
          for i in menuData! {
            let name = i["name"].stringValue
            let mandatory = i["mandatory"].boolValue
            let option = i["option"].arrayValue
           // print("가져왔니? : \(name), \(mandatory), \(option)")
            
            
            self.menuMandatory = mandatory
            self.menuName.append(name)
            self.optionsCount = option.count
            self.arrMenu.append(name)
            // self.arrMenu.append(menuName[i])
            
            print(self.optionsCount)
            print("arr데이타 : \(self.arrMenu)")
            
            //section3
            let optionData = option
            if optionData == option {
              for i in optionData {
                let optionName = i["name"].stringValue
                let optionPrice = i["price"].intValue
                print("나와라 오바 ! : \(optionName)")
                print("추가금액 : \(optionPrice)")
                
                self.optionsName.append(optionName)
                self.optionsPrice = optionPrice
                self.arrOption.append(optionName)
                self.arrtest.append(String(self.optionsPrice))
                // self.arrtest.append(optionsPrice)
              }
            }
          }
        }
        self.tableView.reloadData()
        print("arr데이타2 :\(self.arrMenu)")
        print("arroption데이타3 : \(self.arrOption)")
        print("arrtest데이타4: \(self.arrtest)")
     
     //실패시
      case .failure(let error):
        print(error)
      }
    }
    
  }
  
  //MARK:- UITableView
  func setTableView(){
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.frame = view.frame
    tableView.rowHeight = UITableView.automaticDimension //동적높이
    // tableView.estimatedRowHeight = 0
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    view.addSubview(tableView)
    register()
    
  }
  //MARK:-register
  func register(){
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
  }
  
  
  //MARK: -navigation
  
  func setNaviBar(){
    navigationItem.leftBarButtonItem = leftButton
    navigationItem.rightBarButtonItems = [rightButton]
  }
  
  
  func navigationBarLess(){
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  //MARK: -Action
  
  @objc func dismissButton(sender : UIBarButtonItem){
    // dismiss(animated: true, completion: nil)
  }
  
  @objc func shareButton(sender : UIBarButtonItem){
    let vc = ShareVC()
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overFullScreen
    present(vc, animated: true, completion: nil)
  }
}
//MARK: -numberOfRowsInSection

extension DetailMenuVC: UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    4 + optionGroupCount
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 0 { //이미지,할인,메뉴명,상세,리뷰
      return 5
    }else if section == 1 { //가격
      return 1
    }else if section == 2 { //변경&추가 메뉴 옵션들
      return optionsCount + optionGroupCount
    }else if section == 3  { //커스텀 옵션들
      return optionsCount + optionGroupCount
    } else if section == 4  { //수량
      return 2
    }else {
      return optionGroupCount+optionsCount
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
        nameCell.detailmenuName.text = "\(mainName)"
        return nameCell
      } else if indexPath.row == 3 {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        detailCell.detailmenuRemark.text = "\(menuCation)"
        return detailCell
      } else if indexPath.row == 4 {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return reviewCell
      } else {
        print("셀 초과")
      }
      
    case 1:
      let costCell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as! CostTableViewCell
      costCell.costLableWon.text = "\(menuCost)원"
      return costCell
      
    case 2+optionGroupCount :
          let ListMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
          return ListMCell
    
    case 3+optionGroupCount :
//      if indexPath.row == 0 {
//        let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
//        return optionCell
//      }else if indexPath.row == 1{
        let listOPCell = tableView.dequeueReusableCell(withIdentifier: "ListOptionTableViewCell", for: indexPath) as! ListOptionTableViewCell
        return listOPCell
      
    case 4+optionGroupCount:
      if indexPath.row == 0 {
        let buyCell = tableView.dequeueReusableCell(withIdentifier: "BuyTableViewCell", for: indexPath) as! BuyTableViewCell
        return buyCell
      }else if indexPath.row == 1{
        let buyLastCell = tableView.dequeueReusableCell(withIdentifier: "BuyLastTableViewCell", for: indexPath) as! BuyLastTableViewCell
        return buyLastCell
      }
    default:
      //선택사항
      let ListMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
        ListMCell.selectLable.text = "\(arrOption[indexPath.row])"
        ListMCell.costLabel.text = "+ \(arrtest[indexPath.row])"

         return ListMCell
        }
    return nilCell
  }
  
  
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
  
  //푸터뷰 높이
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
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
      return 2
    default:
      return 0
    }
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

//MARK:-UITableViewDelegate
extension DetailMenuVC: UITableViewDelegate{
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
   switch section {
    case 0:
      return " "
    case 1:
      return " "
    case 2 + optionGroupCount-1:
      return "2+option"// menuData[section].category
    case 3 + optionGroupCount-2:
      return "3+option"
    case 4 + optionGroupCount:
      return "4+option"
    default:
      return "keeekkk"//arrMenu[section]//menuData[section].category//"keeekkk"
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 0
    case 1:
      return 0
    case 2+optionGroupCount:
      return 44
    case 3+optionGroupCount:
      return 0
    case 4+optionGroupCount:
      return 0
    default:
      return 44
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

//MARK:- UIScrollViewDelegate
//스크롤뷰 제어
extension DetailMenuVC: UIScrollViewDelegate{
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y < 1 {
      scrollView.contentOffset.y = 1
    }
    if scrollView.contentOffset.y >= 260 {
      title = "순살 새우치킨 반반(콤보)우이우이"
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
      [leftButton,rightButton].forEach{
        $0.tintColor = .black
      }
    }else {
      navigationBarLess()
      title = ""
      [leftButton,rightButton].forEach{ $0.tintColor = .white }
    }
    // print(scrollView.contentOffset.y)
  }
}


