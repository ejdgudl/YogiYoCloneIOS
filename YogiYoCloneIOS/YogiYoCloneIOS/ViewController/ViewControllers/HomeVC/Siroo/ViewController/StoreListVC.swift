//
//  StoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "StoreListCell"


class StoreListVC: UIViewController, CustomTopCategoryViewDelegate{
    func change(to index: Int) {
        print("click \(index)")
    }
    

//    MARK: Properties
    
    private let tableView = UITableView()
    private let storeListCell = StoreListCell()
    
    private let containerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .systemPink
        
        return view
    }()
    
    private let containerlabel: UILabel = {
        let view = UILabel()
        view.text = "안녕"
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPiker.customSystem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "임시 next", style: .plain, target: self, action: #selector(didTapNext))
        
        configure()
        configureTableView()


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    MARK:  @objc
    @objc private func didTapNext() {
        let menuListVC = MenuListVC()
        navigationController?.pushViewController(menuListVC, animated: true)
    }
    
    
//    MARK: Configure
    func configure() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체보기","1인주문","치킨","중국집","디저트"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
//        configureTableView()
        
        view.addSubview(containerView)
        
        containerView.addSubview(containerlabel)
        containerlabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
    }
    
    
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(StoreListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 100
        
        tableView.tableFooterView = UIView()
        
        let height = view.frame.height - 200
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        
        
        containerView.addSubview(tableView)
    }
    
    
    
    
    
}

extension StoreListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "슈퍼레드위크"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .red
//        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! StoreListCell
//        cell.
        return cell
    }
    
    // 셀이 선택되었을때 실행할 액션
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
}
