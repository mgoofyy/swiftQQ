//
//  HomeViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/10.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titleOfOtherPages = ""
    var imageViewBack = UIImageView()
    var tableViewToFriendList = UITableView()
    //var tableViewToFriendListCell = UITableViewCell()
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewX = self.view.frame.width
        var viewY = self.view.frame.height
        imageViewBack.frame = self.view.bounds
        imageViewBack.image = UIImage(named: "loginBack~.png")
        self.view.addSubview(imageViewBack)
        
        tableViewToFriendList.frame = CGRectMake(0, 0, viewX, viewY)
        tableViewToFriendList.alpha = 0.4
        tableViewToFriendList.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableViewToFriendList.delegate = self
        tableViewToFriendList.dataSource = self
        tableViewToFriendList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableViewToFriendList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
//        var imageString = "e" + "\(indexPath.row)" + ".png"
//        userHeartPortraint.image = UIImage(named: imageString)
        //var imageV = UIImage(named: NSString(format: "e%d.png", indexPath.row) as String)
        cell.textLabel?.text = "homeViewController"
        cell.textLabel?.alpha = 1
        //cell.imageView?.image = UIImage(named: imageString)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    

}
