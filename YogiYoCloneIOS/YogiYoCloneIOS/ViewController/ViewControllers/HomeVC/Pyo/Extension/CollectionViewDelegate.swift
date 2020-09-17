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
        
        guard indexPath.row == 1 || indexPath.row == 2 else {
            let listVC = StoreListVC()
            indexPath.row < 3 ? (listVC.categoryIndex = indexPath.row) : (listVC.categoryIndex = indexPath.row - 2)
            navigationController?.pushViewController(listVC, animated: true)
            return
        }
        
        switch indexPath.row {
        case 1:
            let plusVC = YogiyoPlusStoreListVC()
            navigationController?.pushViewController(plusVC, animated: true)
        case 2:
            print("take out")
        default:
            fatalError()
        }
    }
}
