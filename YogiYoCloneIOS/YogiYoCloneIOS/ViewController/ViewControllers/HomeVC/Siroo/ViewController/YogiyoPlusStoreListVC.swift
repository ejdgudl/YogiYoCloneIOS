//
//  YogiyoPlusStoreListVC.swift
//  YogiYoCloneIOS
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class YogiyoPlusStoreListVC: UIViewController, CustomTopCategoryViewDelegate {
<<<<<<< HEAD
    func change(to index: Int) {
        print("click \(index)")
    }
    
=======
    func categoryButtonScrollAction(to index: Int) {
        print("click \(index)")
    }
    

    
>>>>>>> develop
//    MARK: Properties
    
    private let testTextLabel : UILabel = {
        let label = UILabel()
        label.text = "요기요 플러스 화면"
       return label
    }()
    
//    MARK : LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< HEAD
        view.backgroundColor = .systemPink
        view.addSubview(testTextLabel)
        
=======
        view.backgroundColor = ColorPiker.customSystem
        view.addSubview(testTextLabel)
        
        configure()
        
>>>>>>> develop
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
<<<<<<< HEAD
=======
    
    func configure() {
        let codeSegmented = CustomTopCategoryView(frame: CGRect(x: 0, y: 80, width: self.view.frame.width, height: 50), categoryTitles: ["전체","한식","피자/양식","분식","카페/디저트"])
        codeSegmented.backgroundColor = .white
        codeSegmented.delegate = self

        view.addSubview(codeSegmented)
  
    }

>>>>>>> develop

    


}
