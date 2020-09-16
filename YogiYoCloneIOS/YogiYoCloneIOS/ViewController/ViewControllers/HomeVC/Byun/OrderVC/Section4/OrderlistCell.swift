//
//  OrderlistCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class OrderListCell : UITableViewCell {

  //var post = [Oders]()

  
  let listTableView :UITableView = {
    let t = UITableView()
    t.backgroundColor = .white
    t.rowHeight = UITableView.automaticDimension
    t.separatorStyle = .singleLine
    return t
  }()
  
  let shapelayerView = layerView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraint()
  }
  
  let orderlable : UILabel = {
     let l = UILabel()
     l.text = "배달 주문 내역"
     l.font = FontModel.toSize.customLargeFont
     l.textAlignment = .center
     return l
   }()
   
  
  func setUI(){
    
    listTableView.dataSource = self
  //  listTableView.delegate = self
    
    listTableView.register(miniListCell.self, forCellReuseIdentifier: "miniListCell")
    
    [orderlable,listTableView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
  }

  func setConstraint(){
    NSLayoutConstraint.activate([
      orderlable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      orderlable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
     
      listTableView.topAnchor.constraint(equalTo: orderlable.bottomAnchor, constant: 20),
      listTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      listTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
     //listTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -50),
      listTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      listTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8)
      
//      shapelayerView.topAnchor.constraint(equalTo: orderlable.bottomAnchor, constant: 20),
//      shapelayerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//      shapelayerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40),
//      shapelayerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
    ])
    
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OrderListCell : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let miniListCell = tableView.dequeueReusableCell(withIdentifier: "miniListCell", for: indexPath) as! miniListCell
         return miniListCell
  }
  
}

/* let rect = CGRect.init(origin: CGPoint.init(x: 20, y: 100), size: CGSize.init(width: 200, height: 100))
let layer = CAShapeLayer.init()
let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
layer.path = path.cgPath;
layer.strokeColor = UIColor.red.cgColor;
layer.lineDashPattern = [3,3];
layer.backgroundColor = UIColor.clear.cgColor;
layer.fillColor = UIColor.clear.cgColor;
self.view.layer.addSublayer(layer);*/
