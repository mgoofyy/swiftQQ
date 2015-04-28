//
//  ChatViewController.swift
//  ChatClientAndMan
//
//  Created by goofygao on 4/28/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,XxDL


{
    var backGroundImage = UIImageView()
    var navigationItems = UINavigationItem()
    var navigationBar   = UINavigationBar()
    var tableViewMessInfo = UITableView()
    var messageInputTextField = UITextField()
    var sendMessage = UIButton()
    override func viewDidLoad() {
        
        //接管消息代理
        zdl().xxdl = self

        
    backGroundImage.image = UIImage(named: "loginBack.png")
    backGroundImage.frame = self.view.bounds
        self.view.addSubview(backGroundImage)
    
        navigationItems.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "cancle")
        navigationItems.rightBarButtonItem = UIBarButtonItem(title: "关于联系人", style: .Plain, target: self, action: "about")
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
        messageInputTextField.addTarget(self, action: "composing", forControlEvents: UIControlEvents.EditingDidBegin)
        messageInputTextField.tag = 0
        //messageInputTextField.addTarget(self, action: "textFieldDidBeginEditing", forControlEvents: <#UIControlEvents#>)
        self.view.addSubview(messageInputTextField.0)
        
        sendMessage.frame = CGRectMake(self.view.frame.width - 55, self.view.frame.height - 30, 55, 30)
        var buttonImage = UIImage(named: "sendMessage.png")
        
        //sendMessage.imageView = UIImageView(image: buttonImage)
        sendMessage.setImage(buttonImage, forState: UIControlState.Normal)
        sendMessage.addTarget(self, action: "send", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(sendMessage)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgList.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(messageInputTextField.frame.height)
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let msg = msgList[indexPath.row]
        
        //对单元格文本的格式做个调整
        if ( msg.isMe ) {
            //本人所发消息居右,灰色
            cell.textLabel?.textAlignment = .Right
            cell.textLabel?.textColor = UIColor.whiteColor()
            
        } else {
            //好友的消息,橙色
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        
        
        //设定单元格的文本
        cell.textLabel?.text = msg.body
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
        frame.origin.y += 260
        self.view.frame = frame
        
        
    }
    
    func cancle()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(HomeViewController(), animated: true, completion: nil)

    }
    
    func send()
    {
        //获取聊天框文本
        let msgStr = messageInputTextField.text
        
        //如果文本不为空
        if ( !msgStr.isEmpty ) {
            //构建XML元素 message
            var xmlmessage = DDXMLElement.elementWithName("message") as! DDXMLElement
            
            //增加属性
            xmlmessage.addAttributeWithName("type", stringValue: "chat")
            xmlmessage.addAttributeWithName("to", stringValue: toBuddyName)
            xmlmessage.addAttributeWithName("from", stringValue: "xiaoshan@localhost")
            
            //构建正文
            var body = DDXMLElement.elementWithName("body") as! DDXMLElement
            body.setStringValue(msgStr)
            
            //消息的子节点中加入正文
            xmlmessage.addChild(body)
            
            //通过通道发送XML文本
            zdl().xs!.sendElement(xmlmessage)
            
            //清空聊天框
            messageInputTextField.text = ""
            
            //保存自己的消息
            var msg = WXMessage()
            
            msg.isMe = true
            msg.body = msgStr
            
            //加入到聊天记录
            msgList.append(msg)
            
            //通知表格刷新
            self.tableViewMessInfo.reloadData()
            println("我也才发送一条信息")
            
        }
        self.messageInputTextField.resignFirstResponder()

    }
    
    //聊天的好友用户名
    var toBuddyName = "dashan@localhost"
    
    //聊天记录
    var msgList = [WXMessage]()
    
    
    //收到消息
    func newMsg(aMsg: WXMessage) {
        
        //对方正在输入
        if ( aMsg.isComposing ) {
            self.navigationItem.title = "对方正在输入..."
            
            //如果有正文
        } else if (aMsg.body != "") {
            //显示跟谁聊天
            self.navigationItem.title = toBuddyName
            
            //则加入到未读消息组
            msgList.append(aMsg)
            //navigationBar.pushNavigationItem(navigationItems.title, animated: true)
            self.view.addSubview(navigationBar)
            
            //通知表格刷新
            self.tableViewMessInfo.reloadData()
            
        }
        
        
    }
    
    //获取总代理
    func zdl() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    
    func composing()
    {
        
        
        var xmlmessage = DDXMLElement.elementWithName("message") as! DDXMLElement
        
        //增加属性
        xmlmessage.addAttributeWithName("to", stringValue: toBuddyName)
        println("+++++++++++++++\(toBuddyName)")
        //xmlmessage.addAttributeWithName("from", stringValue: NSUserDefaults.standardUserDefaults().stringForKey("weixinID"))
        xmlmessage.addAttributeWithName("from", stringValue: "xiaoshan@localhost")
        
        //构建正在输入元素
        var composing = DDXMLElement.elementWithName("composing") as! DDXMLElement
        composing.addAttributeWithName("xmlns", stringValue: "http://jabber.org/protocol/chatstates")
        
        
        //消息的子节点中加入正文
        xmlmessage.addChild(composing)
        
        
        //通过通道发送XML文本
        zdl().xs!.sendElement(xmlmessage)
        
    }
    
    
    func about()
    {
        println("关于我自的")
    }
    
    }