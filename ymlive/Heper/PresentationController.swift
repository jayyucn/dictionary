//
//  PresentationController.swift
//  ymlive
//
//  Created by jay yu on 2017/12/30.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    // 设置尺寸, 供外界设置 展示控制器的大小
    var presentFrame: CGRect = CGRect.zero
    // 负责布局 内容容器中的子控件的 (此方法只调用一次)
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        let view = presentedView
//      自己进行设置被展示的view的大小 (当然我是希望外界可以进行传递的), 如果外界没有, 那我自己进行设置
        view?.frame = (presentFrame == CGRect.zero) ? CGRect(x: 100.0, y: 56.0, width: 150.0, height: 300.0) : presentFrame
//        containerView中存放着  modal双方的 视图 . 然后自己进行插入蒙版视图
        containerView?.insertSubview(cover, at: 0)
        
    }
    // MARK: -懒加载蒙版
    private lazy var cover : UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.dismissView))
        
        view.addGestureRecognizer(tap)
        return view
    }()
    
    //MARK :- 点击事件的监听
    @objc func dismissView()
    {
        // 拿到被展示的控制器, 然后让其消失
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}
