//
//  MemoViewController.swift
//  ChatClientAndMan
//
//  Created by goofygao on 5/1/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {

    var topImageWithButtonBackGround = UIImageView()
    var downImageBackWithoutBackGround = UIImageView()
    var viewMonthLabel = UILabel()
    var viewDayLabel   = UILabel()
    var viewYearLabel  = UILabel()
    let chooseDateButton = UIButton()
    var weeekLabelTittle = ["星日","星一","星二","星三","星四","星五","星六"]
    var DateLabelTittle = ["23","24","25","26","27","28","29"]
    //get the location of touchBegin
    var touchLocation = UITouch()
    var touchLocationPoint = CGPoint()
    var morningMemoButton = UIButton()
    var afternoonMemoButton = UIButton()
    var EvenningMemoButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
                topImageWithButtonBackGround.layer.cornerRadius = 4
                topImageWithButtonBackGround.clipsToBounds = true
        downImageBackWithoutBackGround.layer.cornerRadius = 4
        downImageBackWithoutBackGround.clipsToBounds = true
    topImageWithButtonBackGround.image = UIImage(named: "bg_r_topbar.png")
        topImageWithButtonBackGround.frame = CGRectMake(0, 0,Common.screenWidth, Common.screenHeight * 1/8 - 4)
        downImageBackWithoutBackGround.image = UIImage(named: "bg_r_topbar.png")
        downImageBackWithoutBackGround.frame = CGRectMake(0, Common.screenHeight * 1/8 - 3,Common.screenWidth, Common.screenHeight * 1/14)
        self.view.addSubview(topImageWithButtonBackGround)
        self.view.addSubview(downImageBackWithoutBackGround)
        
        viewMonthLabel.frame = CGRectMake(40, 10, 80, 80)
        viewMonthLabel.text = "5月"
        viewMonthLabel.font = UIFont.systemFontOfSize(40)
        viewMonthLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(viewMonthLabel)
        
        viewDayLabel.frame = CGRectMake(120, 20, 80, 40)
        viewDayLabel.text = " 12 号"
        viewDayLabel.font = UIFont.systemFontOfSize(16)
        viewDayLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(viewDayLabel)
        
        viewYearLabel.frame = CGRectMake(120, 40, 80, 40)
        viewYearLabel.text = "2015年"
        viewYearLabel.font = UIFont(name: "Helvetica", size: 16)
        viewYearLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(viewYearLabel)
        
        chooseDateButton.frame = CGRectMake((Common.screenWidth - 50), Common.screenHeight * 1/19, 40, 35)
        chooseDateButton.setImage(UIImage(named: "bg_r_logo.png"), forState: UIControlState.Normal)
        chooseDateButton.addTarget(self, action: "chooseDate", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(chooseDateButton)
       //drawLine
        for i in 0...6
        {
            var testlabel = createWeekDayLabel(i, labelString: weeekLabelTittle[i])
            self.view.addSubview(testlabel)
        }
        for i in 0...6
        {
            var testlabel = createDateDayLabel(i, labelString: DateLabelTittle[i])
            self.view.addSubview(testlabel)
        }
        self.view.addSubview(createLineWithImage(1/4))
        self.view.addSubview(createLineWithImage(13/28))
        self.view.addSubview(createLineWithImage(29/56))
        self.view.addSubview(createLineWithImage(41/56))
        self.view.addSubview(createLineWithImage(11/14))
        
        for i in 0...2
        {

            let shangXiaWu = createMorAfterEve(CGRectMake(10, Common.screenHeight * 11/56 + Common.screenHeight * CGFloat(i) * 15/56, 40, 40), tagNum: i)
            self.view.addSubview(shangXiaWu)
        }
        //创建一个标签
        for i in 0...6 {
            let morningMemoButton = createMemoUimageView("bg_r_yellow.png", backGroundSize: CGRectMake(Common.screenWidth * CGFloat(i)/7, Common.screenHeight * 1/4, Common.screenWidth * 1/7 - 1, Common.screenHeight * 3/14), MemoTittle: "大爱高飞",tagNum:i)
          morningMemoButton.addTarget(self, action: "morningMemoAction", forControlEvents: UIControlEvents.TouchDownRepeat)
        self.view.addSubview(morningMemoButton)
        
        }
        
        
        //        添加手势
         var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
   
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        touchLocationPoint = (touches as NSSet).anyObject()!.locationInView(self.view)
    }
   
    func chooseDate()
    {
        
    }
    
    func createWeekDayLabel(tagNum:Int,labelString:String) -> UILabel {
        
        //var label:UILabel = UILabel(frame:CGRectMake(40 * tagNum,180,40,50))
       //var valueLinshi = CGFloat(tagNum)/8
        var label:UILabel = UILabel(frame: CGRectMake(CGFloat(CGFloat(Common.screenWidth - 30) * (CGFloat(tagNum)/6) + 5),Common.screenHeight * 4/34,50,40))
        var i = CGFloat(CGFloat(Common.screenWidth - 30) * CGFloat(tagNum/8))
        //println("\(valueLinshi)")
        label.backgroundColor = UIColor.clearColor()
        //label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.tag = tagNum
        label.font = UIFont.systemFontOfSize(13)
        label.text = labelString
        return label
    }
    
    func createDateDayLabel(tagNum:Int,labelString:String) -> UILabel {
        
        //var label:UILabel = UILabel(frame:CGRectMake(40 * tagNum,180,40,50))
        //var valueLinshi = CGFloat(tagNum)/8
        var label:UILabel = UILabel(frame: CGRectMake(CGFloat(CGFloat(Common.screenWidth - 30) * (CGFloat(tagNum)/6) + 15),Common.screenHeight * 19/136,40,40))
        var i = CGFloat(CGFloat(Common.screenWidth - 30) * CGFloat(tagNum/8))
        //println("\(valueLinshi)")
        label.backgroundColor = UIColor.clearColor()
        //label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.tag = tagNum
        label.font = UIFont.systemFontOfSize(10)
        label.text = labelString
        return label
    }
    
    func createLineWithImage(hightAwayTop:CGFloat) -> UIImageView{
        var imageView = UIImageView(image: UIImage(named: "line.png"))
        imageView.frame = CGRectMake(0, hightAwayTop * Common.screenHeight, Common.screenWidth, 1)
        return imageView
    }
    
    func createMemoUimageView(backGroundImageString:String,backGroundSize:CGRect,MemoTittle:String,tagNum:Int) -> UIButton
    {
        var memoViewImage = UIImage(named: backGroundImageString)
        var memoButton = UIButton()
        memoButton.frame = backGroundSize
        memoButton.setBackgroundImage(memoViewImage, forState: UIControlState.Normal)
        memoButton.setTitle(MemoTittle, forState: .Normal)
        memoButton.tag = tagNum
        return memoButton
        
    }
    
    func createMorAfterEve(tittleFrame:CGRect,tagNum:Int) -> UILabel
    {
        let labelArray = ["上午","中午","下午"]
        let label = UILabel(frame: tittleFrame)
        label.text = labelArray[tagNum]
        label.textColor = UIColor.blackColor()
        return label
        
    }
    
    
    func handleSwipes()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(HomeViewController(), animated: true, completion: nil)
        
    }
   
    
    func morningMemoAction()  {
       self.presentViewController(AddMemoViewcontgrollerViewController(), animated: true, completion: nil)
        
    }
}
