//
//  MenuVC.swift
//  YogiYoCloneIOS
//
//  Created by 김동현 on 2020/08/19.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit
import SnapKit

class MenuListVC: UIViewController {
    
    // MARK: Properties
    fileprivate let padding: CGFloat = 16
    
    private var imageVIewOption = true
    
    private lazy var collectionView: UICollectionView = {
        let layout = StretchHeaderLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var statusView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavi()
        configureViews()
    }
    
    // MARK: @Objc
    @objc private func didTapSearchButton() {
        
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    lazy var bar:UINavigationBar! =  self.navigationController?.navigationBar
    
    // MARK: Helpers
    private func configureNavi() {
        UIApplication.shared.statusBarStyle = .lightContent
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
    // MARK: Configure
    private func configure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(StoreInfoCell.self, forCellWithReuseIdentifier: StoreInfoCell.cellID)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.cellID)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.cellID)
        collectionView.register(SegmentCell.self, forCellWithReuseIdentifier: SegmentCell.cellID)
        collectionView.register(SegMenuCell.self, forCellWithReuseIdentifier: SegMenuCell.cellID)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        view.backgroundColor = .white
        
        [collectionView, statusView].forEach {
            view.addSubview($0)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        statusView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MenuListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return .init(width: view.frame.width - 2 * padding, height: 210)
        case 1:
            return .init(width: view.frame.width - 2 * padding, height: 50)
        case 2:
            return .init(width: view.frame.width, height: 170)
        default:
            break
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if self.imageVIewOption {
            return UIEdgeInsets(top: padding + 75, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: padding - 5, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: UICollectionViewDataSource
extension MenuListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreInfoCell.cellID, for: indexPath) as? StoreInfoCell else { return UICollectionViewCell() }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentCell.cellID, for: indexPath) as? SegmentCell else { return UICollectionViewCell() }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegMenuCell.cellID, for: indexPath) as? SegMenuCell else { return UICollectionViewCell() }
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }

    // header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.cellID, for: indexPath) as? HeaderView else { return UICollectionReusableView()}
            return header
        }else {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterView.cellID, for: indexPath) as? FooterView else { return UICollectionReusableView() }
            return footer
        }
    }
}

extension MenuListVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > 100 {
            UIView.animate(withDuration: 0.15) {
                self.navigationController?.navigationBar.tintColor = .black
                self.statusView.backgroundColor = .white
                self.view.window?.windowScene?.statusBarManager?.statusBarStyle
                UIApplication.shared.statusBarStyle = .darkContent
                self.title = "가게 이름"
            }
        } else if scrollView.contentOffset.y < 100{
            UIView.animate(withDuration: 0.15) {
                self.navigationController?.navigationBar.tintColor = .white
                self.statusView.backgroundColor = .clear
                UIApplication.shared.statusBarStyle = .lightContent
                self.title = " "
            }
        }
    }
}
