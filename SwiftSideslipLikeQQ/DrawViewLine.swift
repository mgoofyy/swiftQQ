//
//  DrawView.swift
//  ChatClientAndMan
//
//  Created by goofygao on 5/2/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import UIKit

class DrawViewLine: UIView {
    
    var noValueCGRect = CGRect()
    var startPoint = CGPoint()
    var endPoint   = CGPoint()
    

    init(startPoint:CGPoint,endPoint:CGPoint,noValueCGRect:CGRect)
    {
        super.init(frame: noValueCGRect)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        var graphPath = UIBezierPath()
        graphPath.moveToPoint(startPoint)
        graphPath.addLineToPoint(endPoint)
        UIColor.greenColor().setFill()
        UIColor.blackColor().setStroke()
        graphPath.lineWidth = 1
        //graphPath.
        graphPath.stroke()
        println("我在画图")
    }

}
