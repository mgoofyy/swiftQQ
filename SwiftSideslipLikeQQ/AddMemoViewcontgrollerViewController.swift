//
//  AddMemoViewcontgrollerViewController.swift
//  ChatClientAndMan
//
//  Created by goofygao on 5/3/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit
import Foundation
class AddMemoViewcontgrollerViewController: UIViewController,UITextViewDelegate {

    
    var backImageView = UIView()
    var memoTextView  = UITextView()
    var memoTextViewBack = UIImageView()
    var viewsurplusWordCountLabel = UILabel()
    var memoTittleTextField = UITextField()
    var getBackUI = UIButton()
    var leftViewChooseDateLebel = UILabel()
    
    var chooseMemoDatePickerView = UIView()
    var setAcitivityTime = UIButton()
    var submitButton = UIButton()
    var acitivityDateLeftViewLabel = UILabel()
    var acitivityDateRightViewLabel = UILabel()
    var datePicker = UIDatePicker(frame: CGRectMake(20, Common.screenHeight * 1/4, Common.screenWidth - 40, 200))
    let arrayWeek = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 129/255, green: 224/255, blue: 204/255, alpha: 1)
        self.view.addSubview(createLine(CGRectMake(0, Common.screenHeight * 1/8, Common.screenWidth, 1)))
        self.view.addSubview(createLine(CGRectMake(20, Common.screenHeight * 5/24, Common.screenWidth - 40, 1)))
        memoTextViewBack.frame = CGRectMake(20, Common.screenHeight * 6/24, Common.screenWidth - 40, Common.screenHeight * 5/14)
        memoTextViewBack.image = UIImage(named: "bg_setr.png")
        //给textView背景图片添加圆角
        memoTextViewBack.layer.cornerRadius = 10
        memoTextViewBack.clipsToBounds = true
        //memoTextViewBack.
        memoTextView.frame = CGRectMake(20, Common.screenHeight * 6/24, Common.screenWidth - 40, Common.screenHeight * 5/14)
        memoTextView.backgroundColor = UIColor.clearColor()
        memoTextView.font = UIFont.systemFontOfSize(14)
        memoTextView.text = "请输入活动内容..."
        memoTextView.delegate = self
        //memoTextView.
        self.view.addSubview(memoTextViewBack)
        self.view.addSubview(memoTextView)
        viewsurplusWordCountLabel.font = UIFont.systemFontOfSize(10)
        viewsurplusWordCountLabel.textColor = UIColor.grayColor()
        //viewsurplusWordCountLabel.center = CGPoint(x: 200, y: 400)
        viewsurplusWordCountLabel.frame = CGRectMake(Common.screenWidth * 1/3, Common.screenHeight * 4/7, 100, 30)
        viewsurplusWordCountLabel.text = "还可以输入375字"
        self.view.addSubview(viewsurplusWordCountLabel)
        
        memoTittleTextField.placeholder = "在此输入标题"
        memoTittleTextField.frame = CGRectMake(20, Common.screenHeight * 1/7, Common.screenWidth - 40, 50)
        memoTittleTextField.textColor = UIColor.whiteColor()
        memoTittleTextField.font = UIFont.systemFontOfSize(20)
        self.view.addSubview(memoTittleTextField)
        
        var tittleSettingLabel = createLabelView("日程表活动设置", labelFrameSzie: CGRectMake(30, 15, 150, 40))
        tittleSettingLabel.font = UIFont.systemFontOfSize(16)
        self.view.addSubview(tittleSettingLabel)
        
        var nowDate = NSDate()
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        var dateString = formatter.stringFromDate(nowDate)
        var tittleCreateLabel = createLabelView("日程表活动设置" + "\(dateString)" + "创建", labelFrameSzie: CGRectMake(30, 35, 180, 40))
        tittleCreateLabel.font = UIFont.systemFontOfSize(10)
        self.view.addSubview(tittleCreateLabel)
        
        getBackUI.frame = CGRectMake(Common.screenWidth - 50, 20, 40, 30)
        getBackUI.setImage(UIImage(named: "bg_setr_logo.png"), forState: UIControlState.Normal)
        getBackUI.addTarget(self, action: "getBackUIAction", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(getBackUI)
        
        self.view.addSubview(createLine(CGRectMake(0, Common.screenHeight * 9/14, Common.screenWidth, 1)))
        self.view.addSubview(createLine(CGRectMake(Common.screenWidth/2, Common.screenHeight * 19/28, 1, Common.screenHeight * 1/10)))
      
        //leftViewChooseDateLebel = createLabelView("", labelFrameSzie: <#CGRect#>)
        
        setAcitivityTime.frame = CGRectMake(20, Common.screenHeight * 11/14, Common.screenWidth - 40, 50)
        setAcitivityTime.setImage(UIImage(named: "bt_setr_settime.png"), forState: UIControlState.Normal)
        setAcitivityTime.addTarget(self, action: "setAcitivityTimeAction", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(setAcitivityTime)
        
        submitButton.frame = CGRectMake(20, Common.screenHeight * 25/28, Common.screenWidth - 40, 50)
        submitButton.setImage(UIImage(named: "bt_setr_submit.png"), forState: UIControlState.Normal)
        submitButton.addTarget(self, action: "submitButtonAction", forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(submitButton)
        
        formatter.dateFormat = "HH:mm"
        var dataStringLeft = formatter.stringFromDate(nowDate)
        
        acitivityDateLeftViewLabel = createLabelView(dataStringLeft, labelFrameSzie: CGRectMake(Common.screenWidth * 1/8, Common.screenHeight * 9/14, 100, 100))
        acitivityDateLeftViewLabel.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(acitivityDateLeftViewLabel)
        
        formatter.dateFormat = "yyyy-MM-dd"
        var dataStringRight = formatter.stringFromDate(nowDate)
        acitivityDateRightViewLabel = createLabelView(dataStringRight, labelFrameSzie: CGRectMake(Common.screenWidth * 5/8, Common.screenHeight * 9/14, 150,100))
        acitivityDateRightViewLabel.font = UIFont.systemFontOfSize(25)
        self.view.addSubview(acitivityDateRightViewLabel)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(range.location > 400){
            var alert:UIAlertView = UIAlertView(title: "警告", message: "输入过头了", delegate: self, cancelButtonTitle: "好")
            alert.show()
            return false
        }else{
            var surplusWordCount = 400 - textView.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            viewsurplusWordCountLabel.text = "还可以输入" + "\(surplusWordCount)" + "字"
            return true
        }
    }
    
    func createLine(viewSizeFrame:CGRect) -> UIImageView
    {
        let line = UIImageView(frame: viewSizeFrame)
        line.image = UIImage(named: "line.png")
        return line
    }
    
    func createLabelView(labelString:String,labelFrameSzie:CGRect) -> UILabel
    {
        let labelView = UILabel(frame: labelFrameSzie)
        labelView.text = labelString
        labelView.textColor = UIColor.whiteColor()
        return labelView
        
    }
    
    func getBackUIAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(MemoViewController(), animated: true, completion: nil)
    }
    
    
    func setAcitivityTimeAction()
    {
        chooseMemoDatePickerView.frame = CGRectMake(0, 0, Common.screenWidth, Common.screenHeight)
        chooseMemoDatePickerView.backgroundColor = UIColor(white: 0.8, alpha: 0.6)
        
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        datePicker.minuteInterval = 5
        var dateFormater = NSDateFormatter()
        datePicker.maximumDate = dateFormater.dateFromString("2020-12-31 15:00:00")
        datePicker.minimumDate = NSDate()
        datePicker.addTarget(self, action: "datePickValueChange", forControlEvents: UIControlEvents.ValueChanged)
        chooseMemoDatePickerView.addSubview(datePicker)
        var okButtonToGetDate = UIButton(frame:  CGRectMake(30, Common.screenHeight * 3/5, Common.screenWidth - 60, 50) )
        okButtonToGetDate.setImage(UIImage(named: "bt_set_submit.png"), forState: UIControlState.Normal)
        okButtonToGetDate.addTarget(self, action: "getDateButton", forControlEvents: UIControlEvents.TouchDown)
        self.chooseMemoDatePickerView.addSubview(okButtonToGetDate)
        self.view.addSubview(chooseMemoDatePickerView)
        
    }
    
    
    func datePickValueChange()
    {
        println("fuck laolv ")
    }
    
    func getDateButton()
    {
        var acitityDate = datePicker.date
        var format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        acitivityDateLeftViewLabel.text = format.stringFromDate(acitityDate)
        self.view.addSubview(acitivityDateLeftViewLabel)
        format.dateFormat = "yyyy-MM-dd"
        acitivityDateRightViewLabel.text = format.stringFromDate(acitityDate)
        self.chooseMemoDatePickerView.removeFromSuperview()
        self.view.addSubview(acitivityDateRightViewLabel)
        
    }
    
    
    func submitButtonAction()
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


