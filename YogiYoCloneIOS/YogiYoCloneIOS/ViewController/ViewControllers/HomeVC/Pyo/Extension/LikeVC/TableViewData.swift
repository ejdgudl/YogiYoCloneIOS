//
//  TableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import SnapKit

extension LikeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NilViewCustomCell.identifier) as? NilViewCustomCell else { fatalError() }
        
        return cell
    }
}
