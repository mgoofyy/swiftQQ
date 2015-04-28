//
//  ZtDL.swift
//  ChatClientAndMan
//
//  Created by goofygao on 4/26/15.
//  Copyright (c) 2015 com.lvwenhan. All rights reserved.
//

import Foundation

//状态代理协议
protocol ZtDL {
    func isOn(zt:Zhuangtai)
    func isOff(zt:Zhuangtai)
    func meOff()
}