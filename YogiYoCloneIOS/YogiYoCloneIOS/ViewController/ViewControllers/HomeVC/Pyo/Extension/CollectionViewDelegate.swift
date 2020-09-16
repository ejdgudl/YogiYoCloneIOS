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
        
        indexPath.row < 3 ? (listVC.categoryIndex = indexPath.row) : (listVC.categoryIndex = indexPath.row - 2)
        navigationController?.pushViewController(listVC, animated: true)
    }
}
