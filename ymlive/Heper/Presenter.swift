//
//  Presenter.swift
//  ymlive
//
//  Created by jay yu on 2017/12/18.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

enum PresentingStyle {
    case push
    case present
    case other
}

class Presenter: NSObject {
    static let presenter = Presenter.init()
    private override init() {
        
    }
    
    class func present(from target: UIViewController, to destination: UIViewController, style: PresentingStyle) {
        switch style {
        case .push:
            if target.isKind(of: UINavigationController.self) {
                
                let nav: UINavigationController = target as! UINavigationController
                nav .pushViewController(destination)
            }
        case .present:
            target .present(destination, animated: true, completion: {
                
            })
        default:
            print("nothing to do!")
        }
    }
}
