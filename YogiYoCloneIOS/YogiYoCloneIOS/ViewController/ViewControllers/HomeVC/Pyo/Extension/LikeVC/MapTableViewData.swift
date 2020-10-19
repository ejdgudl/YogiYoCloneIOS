//
//  MapTableViewData.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/10/05.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension MapVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestCustomCell.identifier) else { fatalError() }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NearestListCustomCell.identifier) else { fatalError() }
            
            return cell
        }
    }
}
