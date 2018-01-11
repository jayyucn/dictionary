//
//  CustomPresentationModel.swift
//  ymlive
//
//  Created by jay yu on 2017/12/30.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

let kPopoverViewShowNotification = "PopoverViewShowNotification"
let kPopoverViewDismissNotification = "kPopoverViewDismissNotification"


import UIKit
import pop

class CustomPresentationModel: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    init(style: ModalPresentationStyle) {
        super.init()
        
    }
    
    //记录是否已经pop出来控制器
    private var isPopped: Bool = false
    
    var presentFrame: CGRect = CGRect.zero
    // MARK: - UIViewControllerTransitioningDelegate -代理方法
    /// 如果是改变样式的话,也就是改变显示的尺寸, 必须调用这个方法
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
    {
        // 自己定义一个 PresentationController 继承于 UIPresentationController,  内部包含上下文,  可以修改上下文内容.  我在后面接收自定义这个类都干了什么.
        let presentC = PresentationController.init(presentedViewController: presented, presenting: presenting)
        // 将外界的 尺寸进行传入
        presentC.presentFrame = presentFrame
        return presentC
    }
    
    /// 展示出控制器的动画
    ///
    /// - Parameters:
    ///   - presented: 被展示的控制器
    ///   - presenting: 发起展示的控制器
    ///   - source: 资源控制器 (用来设置样式.只要遵守协议的控制器,都是可以的)
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPopped = true
        NotificationCenter.default.post(name: NSNotification.Name.init(kPopoverViewDismissNotification), object: self)
        return self
    }
    //消失时动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPopped = false
        NotificationCenter.default.post(name: NSNotification.Name.init(kPopoverViewShowNotification), object: self)
        return self
    }
    
    // MARK : - UIViewControllerAnimatedTransitioning - 代理方法
    /// 返回转场时间, 一般没人管
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    /// 设置转场动画,利用上下文
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        let presentView : UIView!
        
        // 展示和dismiss的时候,它的上下文中的 from  和 to对应得刚好相反.
        if isPopped {
            // 取出上下文中的 展示控制器的view
            presentView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            presentView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            // warning 将view需要手动加到 内容view上,才能显示 , 相当于自己还要在进行创建内容控制器一样.
            transitionContext.containerView.addSubview(presentView)
            let anima = POPSpringAnimation.init(propertyNamed: kPOPLayerPositionY)
            anima?.toValue = transitionContext.containerView.center.y
            anima?.springBounciness = 10.0;
            anima?.completionBlock = {(animation, finished) in
                //Code goes here
                transitionContext.completeTransition(true)
            }
            
            let scaleAnima = POPSpringAnimation.init(propertyNamed: kPOPLayerScaleXY)
            scaleAnima?.springBounciness = 20
            scaleAnima?.fromValue = NSValue.init(cgPoint: CGPoint.init(x: 1.2, y: 1.4))
            
            presentView.layer .pop_add(anima, forKey: "positionAnimation")
            presentView.layer .pop_add(scaleAnima, forKey: "scaleAnimation")
//            presentView.transform = CGAffineTransform(scaleX: 0.5, y: 1.0)
            UIView.animate(withDuration: 1.5, animations: { () -> Void in
                presentView.transform = CGAffineTransform.identity
            }) { (_) -> Void in
                // 完成时,一定记得关闭上下文,负责动画无法完成.
                transitionContext.completeTransition(true)
            }
        }else{
            // 取出上下文中的 展示控制器的view
            presentView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
            // waring 将view需要手动加到 内容view上,才能显示 , 相当于自己还要在进行创建内容控制器一样.
            transitionContext.containerView.addSubview(presentView)
            UIView.animate(withDuration: 1.5, animations: { () -> Void in
                presentView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0000001)
            }) { (_) -> Void in
                // 完成时,一定记得关闭上下文,负责动画无法完成.
                transitionContext.completeTransition(true)
            }
            
        }
    }
}
