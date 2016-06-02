//
//  LoginViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by goofygao on 4/24/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var imageLoginBack: UIImageView!
    @IBInspectable var backgroundImageView = UIImageView()
    @IBInspectable var logoLoginView   = UIImageView()
    @IBInspectable var loginUserIdText = UITextField()
    @IBInspectable var passwordIdText  = UITextField()
    @IBInspectable var loginButton = UIButton()
    @IBInspectable var signinButton = UIButton()
    @IBInspectable var inputTextBack = UIImageView()
    @IBInspectable var loginActivityIndicatorView = UIActivityIndicatorView()
    var requireLogin = false
    override func viewDidLoad() {
        var viewX = self.view.frame.width
        var viewY = self.view.frame.height
        super.viewDidLoad()

        
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.image = UIImage(named: "bg.png")
        self.view.addSubview(backgroundImageView)
       // logoLoginView.frame = CGRectMake(0, viewY/6, CGFloat(viewX * 3/5), CGFloat(viewX * 3/5))
        //添加圆角
//        logoLoginView.layer.cornerRadius = 60
//        logoLoginView.clipsToBounds = true
        //给第一层UIImageView添加上模糊效果
//                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//                let blurView = UIVisualEffectView(effect: blurEffect)
//                blurView.frame.size = CGSize(width: viewX, height: viewY)
//                imageLoginBack.addSubview(blurView)
        
        inputTextBack.image = UIImage(named: "bg_login.png")
        inputTextBack.alpha = 0.7
        self.view.addSubview(inputTextBack)
        logoLoginView.image = UIImage(named: "logo.png")
        self.view.addSubview(logoLoginView)
        //loginUserIdText.text = "xiaoshan@localhost"
        loginUserIdText.placeholder = "傻逼，请在此输入您的账号"
        //loginUserIdText.background = UIImage(named: "input.png")
        loginUserIdText.clearButtonMode = UITextFieldViewMode.Always
        self.view.addSubview(loginUserIdText)
        
        //passwordIdText.text = "xiaoshan"
        //passwordIdText.background = UIImage(named: "input.png")
        passwordIdText.clearButtonMode = UITextFieldViewMode.Always
        passwordIdText.secureTextEntry = true
        passwordIdText.placeholder = "傻逼，请在此输入您的密码"
        self.view.addSubview(passwordIdText)
     
        loginButton.tintColor  = UIColor.whiteColor()
        self.view.addSubview(loginButton)
        
        //loginButton.backgroundColor = UIColor.redColor()
        loginButton.addTarget(self, action: "buttonEvent", forControlEvents: UIControlEvents.TouchDown)
        loginButton.setImage(UIImage(named: "bt_login.png"), forState: UIControlState.Normal)
        self.view.addSubview(loginButton)
        
        signinButton.addTarget(self, action: "signinAction", forControlEvents: UIControlEvents.TouchDown)
        signinButton.setImage(UIImage(named: "bt_signin.png"), forState: UIControlState.Normal)
        self.view.addSubview(signinButton)
        
       loginActivityIndicatorView.frame = CGRectMake(viewX/2 - 40, viewY/2 - 40, 80, 80)
       loginActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loginActivityIndicatorView.hidesWhenStopped = true
        self.view.addSubview(loginActivityIndicatorView)
        
        UIView.animateWithDuration(0, animations: {
            self.logoLoginView.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.loginUserIdText.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.passwordIdText.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.loginButton.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.signinButton.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.inputTextBack.frame = CGRectMake(viewX/2, viewY, 0, 0)
            }, completion: {
                finished in
                
                UIView.animateWithDuration(0.8, animations: {
                    self.logoLoginView.frame = CGRectMake(viewX/2 - 50 , viewY/5, 100, 50)
                    self.loginUserIdText.frame = CGRectMake(viewX * 1/8, viewY * 2/5, viewX * 4/5, 50)
                    self.passwordIdText.frame = CGRectMake(viewX * 1/8, viewY * 2/5 + 50, viewX * 4/5, 50)
                    self.loginButton.frame   = CGRectMake(viewX/10, viewY * 2/3, viewX * 4/5, 50)
                    self.signinButton.frame   = CGRectMake(viewX/10, viewY * 2/3 + 80, viewX * 4/5, 50)
                    self.inputTextBack.frame = CGRectMake(viewX/10, viewY * 2/5 , viewX * 4/5, 100)
                })
                
                
        })
        
        
    
        // Do any additional setup after loading the view.
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func buttonEvent()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(ViewController(), animated: true, completion: nil)
        
        NSUserDefaults.standardUserDefaults().setObject(loginUserIdText.text + "@localhost", forKey: "weixinID")
        NSUserDefaults.standardUserDefaults().setObject(passwordIdText.text, forKey: "weixinPwd")
        NSUserDefaults.standardUserDefaults().setObject("120.24.69.71", forKey: "wxserver")
        
        //配置自动登陆
        //NSUserDefaults.standardUserDefaults().setBool(self.autologinSwitch.on, forKey: "wxautologin")
        
        //同步用户配置
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //需要登陆
        requireLogin = true

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if sender as! UIButton == self.loginButton {
            }
    }
    
    
    func signinAction()
    {
        println("注册一个新的用户")
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(SignInNewUserViewController(), animated: true, completion: nil)
        //SignInNewUserViewController
        loginActivityIndicatorView.startAnimating()
        
    }


    //设置点击屏幕后键盘返回
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.loginUserIdText.resignFirstResponder()
        self.passwordIdText.resignFirstResponder()
    }
    
    
    
    
}
