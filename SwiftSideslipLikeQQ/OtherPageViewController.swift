//
//  OtherPageViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/12.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

class OtherPageViewController: UIViewController {
    
    var PageTitle: String! // 从 HomeViewController 传递过来的值

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = PageTitle
        mainLabel.text = PageTitle
        
        // 自定义返回按钮
        let backButton = UIBarButtonItem(title: "く返回", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack")
        self.navigationItem.leftBarButtonItem = backButton
        
        // 弥补因为返回按钮被替换导致的边缘滑入手势失效的问题
        let gesture = UIPanGestureRecognizer(target: self, action: "goBack")
        self.view.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }

   
}
