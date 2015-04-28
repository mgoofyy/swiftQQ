//
//  ChatViewController.swift
//  ChatClientAndMan
//
//  Created by goofygao on 4/28/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate


{
    var backGroundImage = UIImageView()
    var navigationItems = UINavigationItem()
    var navigationBar   = UINavigationBar()
    var tableViewMessInfo = UITableView()
    var messageInputTextField = UITextField()
    var sendMessage = UIButton()
    override func viewDidLoad() {
        
    backGroundImage.image = UIImage(named: "loginBack.png")
    backGroundImage.frame = self.view.bounds
        self.view.addSubview(backGroundImage)
    
        navigationItems.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "cancle")
        navigationItems.rightBarButtonItem = UIBarButtonItem(title: "关于联系人", style: .Plain, target: self, action: "send")
        navigationItems.title = "聊天"
        navigationBar.tintColor = UIColor.blueColor()
        navigationBar.frame = CGRectMake(0, 0,self.view.frame.width,64)
        navigationBar.pushNavigationItem(navigationItems, animated: true)
        self.view.addSubview(navigationBar)
        
        tableViewMessInfo.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewMessInfo.dataSource = self
        tableViewMessInfo.delegate = self
        tableViewMessInfo.frame = CGRectMake(0, 64, self.view.frame.width, self.view.frame.height - 94)
        tableViewMessInfo.separatorColor = UIColor.clearColor()
        tableViewMessInfo.backgroundColor = UIColor.clearColor()
        self.view.addSubview(tableViewMessInfo)
    
        //聊天消息输入框
        messageInputTextField.frame = CGRectMake(0, self.view.frame.height - 30,self.view.frame.width - 60, 30)
        messageInputTextField.background = UIImage(named: "input.png")
        messageInputTextField.delegate = self
        messageInputTextField.tag = 0
        //messageInputTextField.addTarget(self, action: "textFieldDidBeginEditing", forControlEvents: <#UIControlEvents#>)
        self.view.addSubview(messageInputTextField.0)
        
        sendMessage.frame = CGRectMake(self.view.frame.width - 55, self.view.frame.height - 30, 55, 30)
        var buttonImage = UIImage(named: "sendMessage.png")
        
        //sendMessage.imageView = UIImageView(image: buttonImage)
        sendMessage.setImage(buttonImage, forState: UIControlState.Normal)
        sendMessage.addTarget(self, action: "sendMessage", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(sendMessage)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(messageInputTextField.frame.height)
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = "++++"
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        return cell
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        println("开始输入")
        var frame = self.view.frame
        frame.origin.y = -260
        self.view.frame = frame

        
    }

    func textFieldDidEndEditing(textField: UITextField) {
        var frame = self.view.frame
        frame.origin.y = +260
        self.view.frame = frame
        
        
    }
    
    func cancle()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(HomeViewController(), animated: true, completion: nil)

    }
    
}