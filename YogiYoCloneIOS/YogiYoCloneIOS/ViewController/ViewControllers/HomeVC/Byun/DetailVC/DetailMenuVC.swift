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
import Kingfisher


class DetailMenuVC: UIViewController {
  
  public var id : Int = 1
  
  var menu_info = MenuData()
  
  var usd : MenuData?
  
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
    //  costViewFrame()
    buttonFrame()
    clipboradMessag()
    setNaviBar()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    buttonFrame()
    fechData()
    //   costViewFrame()
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
  
  //MARK:- Frame
  func costViewFrame(){
    costView.frame = CGRect(x: 0, y: view.frame.maxY - 50, width: view.frame.width, height: 50)
    view.addSubview(costView)
  }
  
  func buttonFrame(){
    orderButton.frame = CGRect(x: view.frame.width/2, y: view.frame.maxY, width: view.frame.width/2, height: -50)
    view.addSubview(orderButton)
    
    orderaddButton.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width/2, height: -50)
    view.addSubview(orderaddButton)
  }
  
  
  let orderaddButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = .darkGray
    b.setTitle("주문표에 추가", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    return b
  }()
  
  let orderButton : UIButton = {
    let b = UIButton()
    b.backgroundColor = ColorPiker.customMainRed
    b.setTitle("주문 하기", for: .normal)
    b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = FontModel.toSize.customFont
    b.addTarget(self, action: #selector(orderDidTab(_:)), for: .touchUpInside)
    return b
  }()
  
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    buttonFrame()
  }
  
  
  func fechData(){
    let url = URL(string: UrlBase.menuInstance)
    URLSession.shared.dataTask(with: url!) { (data, response, error) in
      if error == nil {
        do{
          self.usd = try JSONDecoder().decode(MenuData.self, from: data!)
        }catch{
          print("catch")
        }
        DispatchQueue.main.async{
          
          print("usd?.name : \(self.usd?.name)")
        }
      }else{
        print("Error")
      }
    }.resume()
  }
  
  
  //MARK:-AlamofireRequest
  func AlamofireRequest() {
    //\(String(id))
    AF.request("http://52.79.251.125/menu/20", method: .get).validate().responseJSON { response in
      
      switch response.result {
      //성공시
      case .success(let value):
        let json = JSON(value)
        //  print("JSON: \(json)")
        
        if let json = try? JSON(data: response.data!){
          self.menu_info.id = json["id"].intValue
          self.menu_info.name = json["name"].stringValue
          self.menu_info.caption = json["caption"].stringValue
          self.menu_info.price = json["price"].intValue
          self.menu_info.image = json["image"].stringValue
          
          
          //배열 가져오기
          let menuData = json["option_group"].array
          
          for menu in menuData! {
            var option_group = MenuData.OptionGroup()
            
            option_group.name = menu["name"].stringValue
            option_group.mandatory = menu["mandatory"].boolValue
            
            let optionData = menu["option"].arrayValue
            //optionData
            for option in optionData {
              var option_cell = MenuData.OptionGroup.Option()
              
              option_cell.id = option["id"].intValue
              option_cell.name = option["name"].stringValue
              option_cell.price = option["price"].intValue
              option_cell.optionGroupId = option["option_group_id"].intValue
              
              option_group.option.append(option_cell)
            }
            self.menu_info.optionGroup.append(option_group)
          }
        }
        self.tableView.reloadData()
        
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
  //닫기
  @objc func dismissButton(sender : UIBarButtonItem){
    // dismiss(animated: true, completion: nil)
    navigationController?.popViewController(animated: true)
  }
  //공유하기
  @objc func shareButton(sender : UIBarButtonItem){
    let vc = ShareVC()
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .overFullScreen
    present(vc, animated: true, completion: nil)
  }
  //주문하기
  @objc func orderDidTab(_ sender : UIButton){
    let vc = OderVC()
    navigationController?.pushViewController(vc, animated: true)
  }
  //주문표에 추가
  @objc func orderaddDidTab(){
    
  }
  
}
//MARK: -numberOfRowsInSection

extension DetailMenuVC: UITableViewDataSource{
  //섹션갯수
  func numberOfSections(in tableView: UITableView) -> Int {
    3 + self.menu_info.optionGroup.count
  }
  //셀갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 { //이미지,할인,메뉴명,상세,리뷰
      return 5
    }else if section == 1 { //가격
      return 1
    } else if section == 2+self.menu_info.optionGroup.count  { //수량
      return 2
    }else {//필수&선택사항
      return self.menu_info.optionGroup[section-2]!.option.count+1
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
        let images = ["\(menu_info.image)"]
        imageCell.detailmenuImage.kf.setImage(with: URL(string: images[0]))
        return imageCell
      } else if indexPath.row == 1 {
        let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableViewCell", for: indexPath) as! SaleTableViewCell
        return saleCell
      } else if indexPath.row == 2 {
        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        nameCell.detailmenuName.text = "\(menu_info.name)"
        return nameCell
      } else if indexPath.row == 3 {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        detailCell.detailmenuRemark.text = "\(menu_info.caption)"
        return detailCell
      } else if indexPath.row == 4 {
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return reviewCell
      } else {
        print("셀 초과")
      }
      
    case 1:
      let costCell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as! CostTableViewCell
      costCell.costLableWon.text = "\(menu_info.price)원"
      return costCell
      
    case 2+self.menu_info.optionGroup.count:
      if indexPath.row == 0 {
        let buyCell = tableView.dequeueReusableCell(withIdentifier: "BuyTableViewCell", for: indexPath) as! BuyTableViewCell
        return buyCell
      }else if indexPath.row == 1{
        let buyLastCell = tableView.dequeueReusableCell(withIdentifier: "BuyLastTableViewCell", for: indexPath) as! BuyLastTableViewCell
        buyLastCell.costLable.text = "\(menu_info.price)원"
        return buyLastCell
      }
      
    default:
      let index = indexPath.row
      let sec = indexPath.section
      let menuItem = menu_info.optionGroup[indexPath.section-2]!
      
      if indexPath.row == 0 {
        let MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        MenuCell.menuLable.text = menuItem.name
        return MenuCell
        
      } else if indexPath.row > 0 {
        var menu_option = menuItem.option[indexPath.row-1]
        switch menuItem.mandatory {
        case false:
          let ListMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
          ListMCell.selectLable.text = "\(menu_option.name)"
          ListMCell.costLabel.text = "+ \(menu_option.price)원"
          return ListMCell
          
        case true :
          let listOPCell = tableView.dequeueReusableCell(withIdentifier: "ListOptionTableViewCell", for: indexPath) as! ListOptionTableViewCell
          listOPCell.selectLable.text = "\(menu_option.name)"
          listOPCell.costLabel.text = "+ \(menu_option.price)원"
          return listOPCell
        }
      }
      
    }
    return nilCell
  }
  
  
  //MARK:-Footer
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
      return 0
    case 1:
      return 0
    case 2:
      return 0
    case 3:
      return 0
    case 4:
      return 0
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
  //헤더뷰 타이틀
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return " "
    case 1:
      return " "
    case 2+menu_info.optionGroup.count:
      return " "
    default:
      return " "
    }
  }
  //헤더뷰 높이
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 0
    case 1:
      return 1
    case 2+menu_info.optionGroup.count-2:
      return 1
    case 3+menu_info.optionGroup.count-1:
      return 1
    case 4+menu_info.optionGroup.count:
      return 1
    default:
      return 1
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
      title = "\(menu_info.name)"
      self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
      [leftButton,rightButton].forEach{
        $0.tintColor = .black
      }
    }else {
      navigationBarLess()
      title = ""
      [leftButton,rightButton].forEach{ $0.tintColor = .lightGray }
      
    }
    // print(scrollView.contentOffset.y)
  }
}


