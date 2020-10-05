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
  
  public var id : Int = 20
  
    // 전체적인 주문 정보를 관리하는 매니저(데이터 모델)
    var orderMager = OrderManager.shared
    
    // 주메뉴를 담기 위한 변수
    var orderlist: OrderData?
    
  var data: MenuData?
  
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
    
    setTableView()
    clipboradMessag()
    setNaviBar()
    fechData()
    
    buttonFrame()
    
    }
  
    override func viewWillAppear(_ animated: Bool) {
        tableView.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y-88, width: self.view.frame.size.width, height: self.view.frame.size.height+88)
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
  }
  
  
  func fechData(){
    let url = URL(string: "http://52.79.251.125/menu/\(String(id))")
    URLSession.shared.dataTask(with: url!)  { (data, _, _) in
      guard let data = data else { return }
      do {
        self.data = try JSONDecoder().decode(MenuData.self, from: data)
        // 메뉴데이터 <=====> 오더데이터
        // 오더데이터 만들기
        let id = self.data?.id
        let name = self.data?.name
        let price = self.data?.price
        
        // item에 OrderData요소 할당
        let item = OrderData(menu: id!, name: name!, count: 1, price: price!)
        
        //orderlist에 item할당
        // 주문정보 하나 담기(주메뉴)
        self.orderlist =  item
        
        DispatchQueue.main.async{
          self.tableView.reloadData()
        }
      } catch {
        print("catch")
      }
    }.resume()
  }
  
 
  
  //MARK:- UITableView
  func setTableView(){
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y-88, width: self.view.frame.size.width, height: self.view.frame.size.height+88)
    navigationBarLess()
    
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

    //화면 이동시 테이블뷰의 최상단으로 강제 이동(뷰가 잘리는 부분 임시 처리)
    let indexPath = NSIndexPath(row: 0, section: 0)
    self.tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: false)
    
    guard let orderlist = self.orderlist else {return}
    
    // 데이터모델에 선택된 아이템을 전달
    orderMager.selectedMenus(menus: [orderlist])
    
   // let orderData = OrderData(menu: data!.id, name: data!.name, count: 1, price: data!.price)
    
  //  vc.menuValue(orderData: orderData)
    
    navigationController?.pushViewController(vc, animated: true)
    
  }
  
  
  //주문표에 추가
  @objc func orderaddDidTab(){
    
  }
  
}
//MARK:- ListMenuDelagate
//func totalPriceManeger(){
//  let indexPath = NSIndexPath(row: 0, section: 0)
//  guard let total = orderlist?.price else {return}
//  orderlist?.option[indexPath.row-2].price
//  print("total : \(total)")
//}

//MARK:- ListMenuDelagate
//선택사항
extension DetailMenuVC : ListMenuDelagate {
  func menuCheckdidTap(_ cell: UITableViewCell, check: Bool) {
    // 체크 ===> 필수값을 유저가 선택했는지 (참/거짓을 전달)
    guard let indexPath = tableView.indexPath(for: cell)
    else {return}
      let item = data!.optionGroup[indexPath.section-2]!.option[indexPath.row-1]
     
     let optionItem = OrderData.Option(id: item.id, name: item.name, price: item.price, optionGroupId: item.optionGroupId, selectPos: item.selectPos)
    if check {
      
      self.orderlist?.option.append(optionItem)
      print("self.orderlist?.option : \(self.orderlist?.option)")
      reCalculatePriceAndDisplay()
    }else {
      orderlist?.option.enumerated().forEach { (index, myItem) in
        print("삭제 좀 하고 싶어요")
        if myItem.name == item.name {
          orderlist?.option.remove(at: index)
        }
      }
      reCalculatePriceAndDisplay()
    }
    
  }
}


//MARK:- ListOptionDelagate
//필수사항
extension DetailMenuVC : ListOptionDelagate {
  func checkdidTap(_ cell: UITableViewCell) {
    // 체크 ===> 필수값을 유저가 선택했는지 (참/거짓을 전달)
    guard let indexPath2 = tableView.indexPath(for: cell)
    else {return}
    print("indexPath2 = \(indexPath2)")
    
    guard
        // 지금 유저가 선택한 셀의 인덱스패스 알려줘
    let indexPath = tableView.indexPath(for: cell),
      data!.optionGroup[indexPath.section - 2]!.mandatory
    else { return }
    
    //필수옵션일때 - mandatory = true
    data!.optionGroup[indexPath.section - 2]!.option.enumerated().forEach { (index, _) in
    data!.optionGroup[indexPath.section - 2]!.option[index].selectPos = index == (indexPath.row - 1)
      print(data!.optionGroup[indexPath.section - 2]!.option[index].selectPos)
      let selectPos = data!.optionGroup[indexPath.section - 2]!.option[index].selectPos
     
      let menuItem = data!.optionGroup[indexPath.section - 2]!.option[index]
      
      if selectPos == nil {
        //알럿만들기
      }
 
    }
    tableView.reloadData()
  }
}

//MARK: -numberOfRowsInSection

extension DetailMenuVC: UITableViewDataSource{
  //섹션갯수
  func numberOfSections(in tableView: UITableView) -> Int {
    3 + (data?.optionGroup.count ?? 0)
  }
  
  //셀갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 { //이미지,할인,메뉴명,상세,리뷰
      return 5
      
    }else if section == 1 { //가격
      return 1
      
    } else if section == 2 + (data?.optionGroup.count ?? 0) { //수량
      return 2
      
    }else {
      return data == nil ? 0 : data!.optionGroup[section - 2]!.option.count + 1
    }
  }
  
  //MARK:- cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0:
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        let images = [data == nil ? "" : data!.image]
        imageCell.detailmenuImage.kf.setImage(with: URL(string: images[0]))
        return imageCell
        
      case 1:
        let saleCell = tableView.dequeueReusableCell(withIdentifier: "SaleTableViewCell", for: indexPath) as! SaleTableViewCell
        return saleCell
        
      case 2:
        let nameCell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        nameCell.detailmenuName.text = "\(data == nil ? "" : data!.name)"
        return nameCell
        
      case 3:
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        detailCell.detailmenuRemark.text = "\(data == nil ? "" : data!.caption)"
        return detailCell
        
      default:
        let reviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return reviewCell
      }
    //주메뉴가격
    case 1:
      let costCell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as! CostTableViewCell
      costCell.costLableWon.text = "\(data == nil ? 0 : data!.price)원"
      return costCell
     
    //토탈가격
    case 2 + (data?.optionGroup.count ?? 0):
      switch indexPath.row {
      case 0:
        let buyCell = tableView.dequeueReusableCell(withIdentifier: "BuyTableViewCell", for: indexPath) as! BuyTableViewCell
        buyCell.delegate = self
        return buyCell
        
      default:
        let buyLastCell = tableView.dequeueReusableCell(withIdentifier: "BuyLastTableViewCell", for: indexPath) as! BuyLastTableViewCell
        buyLastCell.costLable.text = "\(String(totalPrice()))원"
        return buyLastCell
      }
      
    default:
      let menuItem = data!.optionGroup[indexPath.section - 2]!
      
      switch indexPath.row {
      case 0:
        switch menuItem.mandatory {
        case false:
          let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
          menuCell.menuLable.text = menuItem.name
        //  menuCell.delegate = self

          return menuCell
          
        case true :
          let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
          optionCell.optionLable.text = menuItem.name

          return optionCell
        }
        
      default:
        let menuOption = menuItem.option[indexPath.row - 1]
        
        switch menuItem.mandatory {
        case false:
          let listMCell = tableView.dequeueReusableCell(withIdentifier: "ListMenuTableViewCell", for: indexPath) as! ListMenuTableViewCell
          listMCell.selectLable.text = "\(menuOption.name)"
          listMCell.costLabel.text = "+ \(menuOption.price)원"
          listMCell.delegate = self
          return listMCell
          
        case true :
          let listOPCell = tableView.dequeueReusableCell(withIdentifier: "ListOptionTableViewCell", for: indexPath) as! ListOptionTableViewCell
          listOPCell.selectLable.text = "\(menuOption.name)"
          listOPCell.costLabel.text = "+ \(menuOption.price)원"
          listOPCell.selectButton.tag = indexPath.row
          listOPCell.checkOn = menuOption.selectPos
          listOPCell.delegate = self
          
          return listOPCell
        }
      }
    }
  }
  //MARK:- total
  func totalPrice() -> Int{
    var total = 0
    print("오더리스트갯수 확인: ", orderlist?.count)
    
    let price = (orderlist?.price) ?? 0
    let count = (orderlist?.count) ?? 0
    total += price * count
    orderlist?.option.forEach{
        total += $0.price
      }
    orderlist?.totalPrice = total
    
    return total
  }
  
}

//MARK:-UITableViewDelegate
extension DetailMenuVC: UITableViewDelegate {
  
  //헤더뷰 높이
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    section == 0 ? 0 : 1
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    section == 0 ? " " : " "
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
      title = "\(data!.name)"
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

extension DetailMenuVC : buyDelegate {
  func plusdidTap(sender: UIButton, up: Int) {
    orderlist?.count = up
    reCalculatePriceAndDisplay()
  }
  
  func minusdidTap(sender: UIButton, down: Int) {
    orderlist?.count = down
    reCalculatePriceAndDisplay()
  }
  
  func reCalculatePriceAndDisplay() {
    let section1 = 2 + (data?.optionGroup.count)!
    
    //tableview IndexPath값에 직접 접근
    let indexxxxxx = IndexPath(row: 1, section: section1)
    
    //tableview row값에 직접 접근
    let cellForrow = tableView.cellForRow(at: indexxxxxx)
    //타입캐스팅으로 BuyLastTableViewCell불러오기
    let buycell = cellForrow as? BuyLastTableViewCell
    buycell?.costLable.text = "\(String(totalPrice()))원"
    print(totalPrice())
  }

}
