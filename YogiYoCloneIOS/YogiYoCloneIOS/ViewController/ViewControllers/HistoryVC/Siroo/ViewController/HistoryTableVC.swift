//
//  HistoryTableVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/10/03.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HistoryCell"

class HistoryTableVC: UIViewController {

//    MARK: Properties
    
    private let tableView = UITableView()
    private let historyDetailVC = HistoryDetailVC()
    
//    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func reload() {
        self.tableView.reloadData()
    }
    
//    MARK: Config
    func configureTableView(index: Int) -> UIView {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 180
        tableView.allowsSelection = true
        
//        tableView.tableFooterView = UIView()
        
        let height = view.frame.height - 200
        let xPos: CGFloat = view.frame.width * CGFloat(index)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        view.frame = CGRect(x: xPos, y: 0, width: 0, height: 0)
        view.sizeToFit()
        view.addSubview(tableView)
        return view
    }
}

extension HistoryTableVC : UITableViewDataSource , UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HistoryCell
        return cell
    }
    
    //셀이 선택되었을때 실행할 액션(HistoryDetailVC 로 이동)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(historyDetailVC, animated: true)
        print("터치가되나")
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//      let height: CGFloat = scrollView.frame.size.height
//      let contentYOffset: CGFloat = scrollView.contentOffset.y
//      let scrollViewHeight: CGFloat = scrollView.contentSize.height
//      let distanceFromBottom: CGFloat = scrollViewHeight - contentYOffset
//
//      if distanceFromBottom < height {
//        categoryDelegate?.scrolltableviewreload()
//        print("스크롤")
//      }
//    }
 
}


