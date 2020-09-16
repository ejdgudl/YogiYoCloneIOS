//
//  CollectionViewDelegate.swift
//  YogiYoCloneIOS
//
//  Created by 표건욱 on 2020/09/16.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listVC = StoreListVC()
        listVC.categoryIndex = indexPath.row
        navigationController?.pushViewController(listVC, animated: true)
    }
}
