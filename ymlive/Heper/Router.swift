//
//  Router.swift
//  ymlive
//
//  Created by jay yu on 2017/12/30.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

enum RouteStyle {
    case push
    case present
    case pop
}

class Router: NSObject {
    static let router = Router.init()
    private override init() {
        
    }
    
    class func route(from fromViewController: UIViewController, to toViewController: UIViewController, style: RouteStyle) {
        
    }
}
