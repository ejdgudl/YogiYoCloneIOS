//
//  ImageTableViewCell.swift
//  YogiYoCloneIOS
//
//  Created by Qussk_MAC on 2020/08/24.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
  
  let detailmenuImage = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    constrian()
  }
  
  func setUI(){
    selectionStyle = .none
    setImage()
    //self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
  }
  
  func setImage(){
    detailmenuImage.backgroundColor = .black
    // detailmenuImage.frame = contentView.bounds
    detailmenuImage.contentMode = .scaleAspectFit
    detailmenuImage.image = UIImage(named: "f")
    contentView.addSubview(detailmenuImage)
    
  }
  
  
  func constrian() {
    [detailmenuImage].forEach{
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
    }
    //Full
    NSLayoutConstraint.activate([
      detailmenuImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      detailmenuImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      detailmenuImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      detailmenuImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(){
    //셀데이터 넣을 곳
  }
}
