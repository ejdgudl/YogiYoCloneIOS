//
//  OrderVC.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/15.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit


class OderVC : UIViewController {
  
  var post = [Post]()
  
  lazy var leftButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapButton))
  
  public var id : Int = 1
  let tableView2 = UITableView()
  let pikerView = UIPickerView()
  var toolBar = UIToolbar()
  var userString = "요청사항을 선택하세요."
  let pikerList = ["요청사항을 선택하세요.","단무지/치킨무/반찬류 안 주셔도 돼요.","벨은 누르지 말아 주세요!","도착 후 전화주시면 직접 받으러 갈게요.", "그냥 문 앞에 놓아주시면 돼요.", "직접 입력"]
  var open = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView2()
    buttonFrame()
  //  navigation()
    title = "배달 주문 결제"
   // self.navigationItem.leftBarButtonItem?.tintColor = .black

  }
  
  func viewDidappear(_ animated: Bool) {
  //  super.viewDidappear(true)
    buttonFrame()
  }

  let paymentButton : UIButton = {
  let b = UIButton()
  b.backgroundColor = ColorPiker.customMainRed
  b.setTitle("결제 하기", for: .normal)
  b.setTitleColor(.white, for: .normal)
    b.titleLabel?.font = UIFont(name: FontModel.customRegular, size: 23)
  b.addTarget(self, action: #selector(paymentDidTapButton(_:)), for: .touchUpInside)
    b.isHidden = true
  return b
  }()
  
  //MARK: -Navi
  func navigation(){
  title = "배달 주문 결제"
    navigationItem.leftBarButtonItem = leftButton
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "back"), for: .any, barMetrics: .default)
    navigationController?.navigationBar.backgroundColor = UIColor.white
  }
  
  //MARK:- Action
  @objc func didTapButton(_ sender : UIButton){
    navigationController?.popViewController(animated: true)

  }
  @objc func paymentDidTapButton(_ sender : UIButton){
     navigationController?.popViewController(animated: true)
   }
  
    func buttonFrame(){
      paymentButton.frame = CGRect(x: view.frame.minX + 20, y: view.frame.maxY - 20, width: view.frame.width - 40, height: -50)
    //  paymentButton.center = view.center
     view.addSubview(paymentButton)
  }
  
  
  //MARK:- UITableView
  func setTableView2(){
    
    pikerView.delegate = self
    pikerView.dataSource = self
    
    tableView2.dataSource = self
    tableView2.delegate = self
    tableView2.frame = view.frame
    tableView2.rowHeight = UITableView.automaticDimension //동적높이
    tableView2.backgroundColor = .white
    //tableView2.separatorStyle = .none
    tableView2.clipsToBounds = true
    view.addSubview(tableView2)
    
    //CustomOderCell
    tableView2.register(loginCell.self, forCellReuseIdentifier: "loginCell")//0-비회원
    tableView2.register(InformationCell.self, forCellReuseIdentifier: "InformationCell")//1-0
    tableView2.register(CustomOrderCell.self, forCellReuseIdentifier: "CustomOrderCell")//1-1
    tableView2.register(PaywithCell.self, forCellReuseIdentifier: "PaywithCell")//2
    tableView2.register(MembershipCell.self, forCellReuseIdentifier: "MembershipCell")//3-회원
    tableView2.register(unMembershipCell.self, forCellReuseIdentifier: "unMembershipCell")//3-비회원
    //OrderListCell
    tableView2.register(OrderListCell.self, forCellReuseIdentifier: "OrderListCell") //주문결제내역
    tableView2.register(paymentCell.self, forCellReuseIdentifier: "paymentCell")
    
  }
  
}
//MARK:-UITableViewDataSource
extension OderVC : UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:  //로그인 유무
      return 1
    case 1://주문자정보
      if open == false {
        return 2
      }else {
        return 2 + 1
      }
    case 2: //결제수단 선택
      return 1
    case 3: //할인방법 선택
      return 1
    case 4: //배달주문 내역
      return 1
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    case 1:
      switch indexPath.row {
      case 0:
        let InformationCell = tableView.dequeueReusableCell(withIdentifier: "InformationCell", for: indexPath) as! InformationCell
        return InformationCell
      case 1:
        let CustomOderCell = tableView.dequeueReusableCell(withIdentifier: "CustomOrderCell", for: indexPath) as! CustomOrderCell
        _ = false
        CustomOderCell.configure(title: "\(userString)")
       // print(userString)
        return CustomOderCell
     
      default: //클릭시 펼쳐질 셀
        let unMembershipCell = tableView.dequeueReusableCell(withIdentifier: "unMembershipCell", for: indexPath) as!
        unMembershipCell
        return unMembershipCell
      }
    case 2:
      let PaywithCell = tableView.dequeueReusableCell(withIdentifier: "PaywithCell", for: indexPath) as! PaywithCell
      return PaywithCell
    case 3:
      let MembershipCell = tableView.dequeueReusableCell(withIdentifier: "MembershipCell", for: indexPath) as! MembershipCell
      return MembershipCell
    case 4:
      let OrderListCell = tableView.dequeueReusableCell(withIdentifier: "OrderListCell", for: indexPath) as! OrderListCell
      return OrderListCell
    case 5 :
      let paymentCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! paymentCell
           return paymentCell
    default:
      let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as! loginCell
      return loginCell
    }
  }
}
//MARK:-UITableViewDelegate
extension OderVC : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)
    guard let cell = tableView.cellForRow(at: indexPath) as? CustomOrderCell else {return}
    guard let index = tableView.indexPath(for: cell) else { return }
    tableView.beginUpdates()
    tableView.endUpdates()
    if index.row == indexPath.row {
      if index.row == 1 {
        print("요청사항")

        var open = true
        print(open)
        if open == true {
          let open = false
          let section = IndexSet.init(integer: indexPath.section)
          tableView.reloadSections(section, with: .fade)
        }else {
          let section = IndexSet.init(integer: indexPath.section)
          tableView.reloadSections(section, with: .fade)
        }
      }
    }
    
    //MARK:- pikerView
    if indexPath.section == 1 && indexPath.row == 1 {
      pikerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
      pikerView.backgroundColor = .white
      self.view.addSubview(pikerView)
      
      toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
      toolBar.barStyle = .default
      toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
      self.view.addSubview(toolBar)
    }
    
  }
  @objc func onDoneButtonTapped() {
   // pikerView.reloadAllComponents()
    toolBar.removeFromSuperview()
    pikerView.removeFromSuperview()

  }
  
  //헤더
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
         case 0:
           return 1
         case 1:
           return 10
         case 2:
           return 0
         case 3:
           return 10
         case 4:
           return 10
         default:
           return 0
         }
     
   }
}


extension OderVC : UISceneDelegate {
func scrollViewDidScroll(_ scrollView: UIScrollView) {
   if scrollView.contentOffset.y > 800 {
     scrollView.contentOffset.y = 800
    paymentButton.isHidden = false
   }else{
    paymentButton.isHidden = true
  }
}
}
