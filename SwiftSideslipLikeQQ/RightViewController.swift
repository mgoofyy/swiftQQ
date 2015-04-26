//
//  RightViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by goofygao on 4/24/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class RightViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    var tableView1: UITableView = UITableView()
    //@IBOutlet weak var heightSetting: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //tableView1.tableFooterView = UIView()
        
       // heightSetting.constant = Common.screenHeight < 500 ? Common.screenHeight * (568 - 221) / 568 : 347
        //self.view.frame = CGRectMake(Common.screenWidth * 0.22, 32, Common.screenWidth * 0.78, Common.screenHeight)
        self.view.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
        tableView1.alpha = 0.4
        tableView1.frame = CGRectMake(Common.screenWidth * 0.22, 0, Common.screenWidth * 0.78, Common.screenHeight)
        
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
        return 20
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        //cell.alpha = 0.5
        cell.textLabel!.text =  "\(indexPath.row)"
        
        return cell
    }
   
}
