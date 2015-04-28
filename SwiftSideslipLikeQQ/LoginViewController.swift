//
//  LoginViewController.swift
//  SwiftSideslipLikeQQ
//
//  Created by goofygao on 4/24/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var imageLoginBack: UIImageView!
    @IBInspectable var backgroundImageView = UIImageView()
    @IBInspectable var logoLoginView   = UIImageView()
    @IBInspectable var loginUserIdText = UITextField()
    @IBInspectable var passwordIdText  = UITextField()
    @IBInspectable var passwordLabel = UILabel()
    @IBInspectable var loginUserLabel = UILabel()
    @IBInspectable var loginButton = UIButton()
    var requireLogin = false
    override func viewDidLoad() {
        var viewX = self.view.frame.width
        var viewY = self.view.frame.height
        super.viewDidLoad()

        
        backgroundImageView.frame = self.view.bounds
        backgroundImageView.image = UIImage(named: "loginBack.png")
        self.view.addSubview(backgroundImageView)
        //logoLoginView.frame = CGRectMake(0, viewY/6, CGFloat(viewX * 3/5), CGFloat(viewX * 3/5))
        //添加圆角
        logoLoginView.layer.cornerRadius = 60
        logoLoginView.clipsToBounds = true
        //给第一层UIImageView添加上模糊效果
        //        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        //        let blurView = UIVisualEffectView(effect: blurEffect)
        //        blurView.frame.size = CGSize(width: viewX, height: viewY)
        //        imageLoginBack.addSubview(blurView)
        logoLoginView.image = UIImage(named: "mytouxiang.png")
        self.view.addSubview(logoLoginView)
        loginUserIdText.text = "xiaoshan@localhost"
        loginUserIdText.background = UIImage(named: "input.png")
        loginUserIdText.clearButtonMode = UITextFieldViewMode.Always
        self.view.addSubview(loginUserIdText)
        
        passwordIdText.text = "xiaoshan"
        passwordIdText.background = UIImage(named: "input.png")
        passwordIdText.clearButtonMode = UITextFieldViewMode.Always
        passwordIdText.secureTextEntry = true
        self.view.addSubview(passwordIdText)
        
        loginUserLabel.text = "账户"
        
        passwordLabel.text  = "密码"
        //loginUserLabel.textColor = UIColor.whiteColor()
        //passwordLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(loginUserLabel)
        self.view.addSubview(passwordLabel)
        
        loginButton.setTitle("登陆", forState: UIControlState.Normal)
        loginButton.tintColor  = UIColor.whiteColor()
        self.view.addSubview(loginButton)
        loginButton.frame = CGRectMake(0, 0, 100, 100)
        //loginButton.backgroundColor = UIColor.redColor()
        loginButton.addTarget(self, action: "buttonEvent", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(loginButton)
        
        
        UIView.animateWithDuration(0, animations: {
            self.logoLoginView.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.loginUserIdText.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.passwordIdText.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.loginUserLabel.frame = CGRectMake(viewX/2, viewY, 0, 0)
            self.passwordLabel.frame  = CGRectMake(viewX/2, viewY, 0, 0)
            self.loginButton.frame = CGRectMake(viewX/2, viewY, 0, 0)
            }, completion: {
                finished in
                
                UIView.animateWithDuration(0.8, animations: {
                    self.logoLoginView.frame = CGRectMake(viewX/2 - 60, viewY/5, 120, 120)
                    self.loginUserIdText.frame = CGRectMake(40, viewY/2, viewX - 80, 30)
                    self.passwordIdText.frame = CGRectMake(40, viewY/2 + 80, viewX - 80, 30)
                    self.loginUserLabel.frame = CGRectMake(viewX/2 - 15, viewY/2 - 50, 40, 40)
                    self.passwordLabel.frame = CGRectMake(viewX/2 - 15, viewY/2 + 30, 40, 40)
                    self.loginButton.frame   = CGRectMake(viewX/2 - 15, viewY * 2/3, 40, 40)
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
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            if sender as! UIButton == self.loginButton {
                
                NSUserDefaults.standardUserDefaults().setObject(loginUserIdText.text, forKey: "weixinID")
                NSUserDefaults.standardUserDefaults().setObject(passwordIdText.text, forKey: "weixinPwd")
                NSUserDefaults.standardUserDefaults().setObject("120.24.69.71", forKey: "wxserver")
                
                //配置自动登陆
                //NSUserDefaults.standardUserDefaults().setBool(self.autologinSwitch.on, forKey: "wxautologin")
                
                //同步用户配置
                NSUserDefaults.standardUserDefaults().synchronize()
                
                //需要登陆
                requireLogin = true
                
            }
        

        
        
        
    }
    
    
    


}
