//
//  HomeViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by JohnLui on 15/4/10.
//  Copyright (c) 2015年 com.lvwenhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,ZtDL,XxDL{
    
    var titleOfOtherPages = ""
    var imageViewBack = UIImageView()
    var tableViewToFriendList = UITableView()
    
    var unreadList = [WXMessage]()
    
    //好友状态数组，作为表格的数据源
    var ztList = [Zhuangtai]()
    
    //已登入
    var logged = false
    
    //选择聊天的好友用户名
    var currentBuddyName = ""

    
    
    func newMsg(aMsg: WXMessage) {
        
        //如果消息有正文
        if (aMsg.body != "") {
            //则加入到未读消息组
            unreadList.append(aMsg)
            
            //通知表格刷新
            self.tableViewToFriendList.reloadData()
        }
        
    }
    
    
    func login() {
        //清空未读和状态数组
        println("+++++++++++")
        unreadList.removeAll(keepCapacity: false)
        ztList.removeAll(keepCapacity: false)
        
        zdl().connect()
        println("\(zdl().connect())")
        //导航左边按钮图片改为上线状态
        //mystatus.image = UIImage(named: "on")
        
        logged = true
        
        
        
        //取用户名
        //let myID = NSUserDefaults.standardUserDefaults().stringForKey("weixinID")
        let myID = "xiaoshan@localhost"
        println("________\(myID)")
        //导航标题改成 "我"的好友
        self.navigationItem.title = myID + "的好友"
        
        //通知表格更新数据
        self.tableViewToFriendList.reloadData()
        
        
        
    }
    
    
    
    func isOn(zt: Zhuangtai) {
        //逐条查找
        for (index, oldzt) in enumerate(ztList)  {
            //如果找到旧的用户状态
            
            if (zt.name == oldzt.name ) {
                
                //就移除掉旧的用户状态
                ztList.removeAtIndex(index)
                
                //一旦找到,就不找了,退出循环
                break
            }
            
            
        }
        //添加新状态到状态数组
        ztList.append(zt)
        
        //通知表格刷新
        self.tableViewToFriendList.reloadData()
    }
    
    
    func zdl() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }

    
    //var tableViewToFriendListCell = UITableViewCell()
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        let bar = UIButton()
        //bar.buttonType = UIButtonType(rawValue: 12)
        bar.setTitle("联系人", forState: UIControlState.Normal)
        bar.addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchDown)
        bar.sizeToFit()
        
        self.navigationItem.titleView = bar

        var viewX = self.view.frame.width
        var viewY = self.view.frame.height
        imageViewBack.frame = self.view.bounds
        imageViewBack.image = UIImage(named: "loginBack~.png")
        self.view.addSubview(imageViewBack)
        
        tableViewToFriendList.frame = CGRectMake(0, 0, viewX, viewY)
        tableViewToFriendList.alpha = 0.5
        tableViewToFriendList.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableViewToFriendList.delegate = self
        tableViewToFriendList.dataSource = self
        tableViewToFriendList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableViewToFriendList)
        
        
        //取用户名
        var  myID = NSUserDefaults.standardUserDefaults().stringForKey("weixinID")
        
        //取自动登陆
        var autologin = NSUserDefaults.standardUserDefaults().boolForKey("wxautologin")
        
        myID = "xiaoshan@localhost"
        autologin = true
        //如果配置了用户名和自动登陆,开始登陆
        if ( myID != nil && autologin ) {
            
            self.login()
            
            
            
        }
        
        //接管状态代理
        zdl().ztdl = self
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
        let online = ztList[indexPath.row].isOnline
        
        //好友的名称
        let name = ztList[indexPath.row].name
        
        //未读消息的条数
        var unreads = 0
        
        //查找相应好友的未读条数
        for msg in unreadList {
            if ( name == msg.from ) {
                unreads++
            }
        }
        
        //单元格的文本 bear@xiaoboswift.com(5)
        cell.textLabel?.text = name + "(\(unreads))"
        
        
        
        //根据状态切换单元格的图像
        if online {
            cell.imageView?.image = UIImage(named: "on")
        } else {
            cell.imageView?.image = UIImage(named: "off")
            
        }
        //println("121212121211")
        cell.textLabel?.alpha = 1
        //cell.imageView?.image = UIImage(named: imageString)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //保存好友用户名
        currentBuddyName = ztList[indexPath.row].name
        
        //跳转到聊天视图
        println("fuck you ")
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(ChatViewController(), animated: true, completion: nil)
        //self.performSegueWithIdentifier("toChatSegue", sender: self)
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("\(ztList.count)")
        return ztList.count
    }

    
    //收到离线或未读消息
    
    
    //下线状态处理
    func isOff(zt: Zhuangtai) {
        //逐条查找
        for (index, oldzt) in enumerate(ztList)  {
            //如果找到旧的用户状态
            
            
            if (zt.name == oldzt.name ) {
                
                //更改旧的用户状态, 为上线
                ztList[index].isOnline = false
                
                //一旦找到,就不找了,退出循环
                break
            }
            
            
        }
        
        //通知表格刷新
        self.tableViewToFriendList.reloadData()
        
    }
    
    func meOff() {
        println("me off ")
    }
    
}
