//
//  Config.swift
//  ymlive
//
//  Created by jay yu on 2017/12/13.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

public let screenWidth                  = UIScreen.main.bounds.size.width
public let screenHeight                 = UIScreen.main.bounds.size.height

func DebugLog<T>(messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if COCOAPODS
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName)(\(lineNum))\(funcName):\n\(messsage)")
    #endif
}

