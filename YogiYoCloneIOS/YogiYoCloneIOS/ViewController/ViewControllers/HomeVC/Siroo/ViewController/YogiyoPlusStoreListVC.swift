//
//  YogiyoPlusStoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class YogiyoPlusStoreListVC: UIViewController, CustomTopCategoryViewDelegate {
    func change(to index: Int) {
        print("click \(index)")
    }
    
//    MARK: Properties
    
    private let testTextLabel : UILabel = {
        let label = UILabel()
        label.text = "요기요 플러스 화면"
       return label
    }()
    
//    MARK : LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        view.addSubview(testTextLabel)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    


}
