//
//  TableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/25.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension LikeVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if likeData == nil {
            return 1
        } else {
            return likeData?.results.count ?? 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let height = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        if likeData == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NilViewCustomCell.identifier) as? NilViewCustomCell else { fatalError() }
            tableView.rowHeight = height
            cell.nilButton.addTarget(self, action: #selector(pushlistVC(_:)), for: .touchUpInside)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoreListCell.identifier) as? StoreListCell else { fatalError() }
            tableView.rowHeight = height / 5
            cell.setValue(image: likeData?.results[indexPath.row].image,
                               title: likeData?.results[indexPath.row].name,
                               starPoint: likeData?.results[indexPath.row].star,
                               review: likeData?.results[indexPath.row].reviewCount,
                               discount: likeData?.results[indexPath.row].deliveryDiscount,
                               explain: likeData?.results[indexPath.row].representativeMenus)
            cell.cescoMark.addTarget(self, action: #selector(removeLike(_:)), for: .touchUpInside)
            
            return cell
        }
    }
}
