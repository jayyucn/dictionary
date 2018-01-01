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



func YMLog<T>(_ msg: T, file : String = #file, funcName : String = #function, lineNum : Int = #line)
{
    
    
    #if false
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let fileName = (file as NSString).lastPathComponent
        let printString = "\n\(fileName)(\(lineNum))\(funcName):\n\(msg)"
        print("############################################################")
        print(dateFormatter.string(from: Date()),printString)
    #endif
}
/** 请求日志 */
func YMRequestLog<T>(_ msg: T, file : String = #file, funcName : String = #function, lineNum : Int = #line)
{
    #if false
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let printString = "\n\(msg)"
        print(dateFormatter.string(from: Date()), printString)
    #endif
}

func YMVerbose<T>(_ msg: T)
{
    #if DEBUG
        print(msg)
    #endif
}

