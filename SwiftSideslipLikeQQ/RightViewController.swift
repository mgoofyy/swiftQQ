//
//  RightViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by goofygao on 4/24/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class RightViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    var navigationRightButtonItemArray = ["添加好友","添加群","扫一扫","创建群组","查看附近的人","摇一摇","企业群发","我要提建议"]
    var tableView1: UITableView = UITableView()
    //@IBOutlet weak var heightSetting: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
        tableView1.alpha = 0.4
        tableView1.frame = CGRectMake(Common.screenWidth * 0.22, 90, Common.screenWidth * 0.78, 440)
        
        self.view.addSubview(tableView1)
        //tableView1.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("12")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationRightButtonItemArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.text =  navigationRightButtonItemArray[indexPath.row]
        
        return cell
    }
   
}
