//
//  FooterView.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/23.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import Cosmos

class FooterView: UICollectionReusableView {
    
    // TEST
    var tableViewData = [CellData]()
    
    // MARK: Priperties
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
            CellData(opened: false, title: "title1", sectionData: ["Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3"]),
            CellData(opened: false, title: "title2", sectionData: ["Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3"]),
            CellData(opened: false, title: "title3", sectionData: ["Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3"]),
            CellData(opened: false, title: "title4", sectionData: ["Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3", "Cell1", "Cell2", "Cell3"])
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
        return 55
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
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
            cell.listTitle.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            }
        }
    }
}
