//
//  UIviewController+animation.swift
//  ymlive
//
//  Created by jay yu on 2018/1/2.
//  Copyright © 2018年 nalanrola. All rights reserved.
//

import UIKit

enum ModalPresentationStyle {
    case `default`
    case upDown
    
}

extension UIViewController {
    func present(viewCtrl:UIViewController, style: ModalPresentationStyle, completion: (() -> Swift.Void)?) {
        let customModel: CustomPresentationModel!
        switch style {
        case .upDown:
            customModel = CustomPresentationModel.init(style: .upDown)
        default:
            customModel = CustomPresentationModel.init(style: .default)
        }
        viewCtrl.transitioningDelegate = customModel
        viewCtrl.modalPresentationStyle = UIModalPresentationStyle.custom
        present(viewCtrl, animated: true, completion: completion)
    }
}
