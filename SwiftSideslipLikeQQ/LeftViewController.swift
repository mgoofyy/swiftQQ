//
//  LeftViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/11.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titlesDictionary = ["我的资料","人脉", "记事本", "便签", "个性装扮", "我的收藏","设置"]

    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var heightLayoutConstraintOfSettingTableView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加圆角
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.clipsToBounds = true
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.tableFooterView = UIView()
        
        heightLayoutConstraintOfSettingTableView.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347
        self.view.frame = CGRectMake(0, 0, 320 * 0.78, Common.screenHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let userChooseItem = titlesDictionary[indexPath.row]
        switch userChooseItem {
        
        case "我的资料":
            println("")
        case "人脉":
            println("")
        case "记事本":
            println("记事本")
        case "便签":
            self.dismissViewControllerAnimated(true, completion: nil)
            self.presentViewController(MemoViewController(), animated: true, completion: nil)
            println("便签")
        case "个性装扮":
            println("个性装扮")
        case "我的收藏":
            println("我的收藏")
        case "设置":
            println("设置")
        default :
            println("error")
          
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftViewCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text = titlesDictionary[indexPath.row]
        
        return cell
    }

   

}
