//
//  FooterView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Cosmos

struct cellData {
    var opened: Bool
    var title: String
    var sectionData: [String]
}

class FooterView: UICollectionReusableView {
    
    var tableViewData = [cellData]()
    // TEST
//    var tableViewData: [MenuGroup]? {
//        didSet {
//            tableView.reloadData()
//            print(tableView.dataSource)
//        }
//    }
    
    // MARK: Priperties
    var id: String?
    
    static let cellID = "FooterViewCellID"
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewData = [
            cellData(opened: false, title: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title2", sectionData: ["Cell1", "Cell2", "Cell3"]),
            cellData(opened: false, title: "Title3", sectionData: ["Cell1", "Cell2", "Cell3"])
        ]
        configure()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuListCell.self, forCellReuseIdentifier: MenuListCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        [tableView].forEach {
            addSubview($0)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

    }
}

extension FooterView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListCell.cellID, for: indexPath) as? MenuListCell else { return UITableViewCell() }
            cell.listTitle.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListCell.cellID, for: indexPath) as? MenuListCell else { return UITableViewCell() }
            cell.listTitle.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
    }
    
    //header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        return UIView()
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 34
//    }
    
    //didSelect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}
