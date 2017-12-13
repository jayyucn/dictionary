//
//  TabBarController.swift
//  ymlive
//
//  Created by jay yu on 2017/12/1.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let liveButton = UIButton.init(type: UIButtonType.custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        configureUI()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    // MARK: CONFIGUI
    func configureUI() {
        
        // MARK: ViewControllers
        let homeViewCtrl        = HomeViewController.init(nibName: "HomeViewController", bundle: Bundle.main)
        let homeNavCtrl         = HomeNavigationController.init(rootViewController: homeViewCtrl)
        
        let rankViewCtrl        = RankViewController.init(nibName: "RankViewController", bundle: Bundle.main)
        let rankNavCtrl         = RankNavigationController.init(rootViewController: rankViewCtrl)
        
        let discoveryCtrl       = DiscoveryViewController.init(nibName: "DiscoveryViewController", bundle: Bundle.main)
        let discoveryNavCtrl    = DiscoveryNavigationController.init(rootViewController: discoveryCtrl)
        
        let mineCtrl = MineViewController.init(nibName: "MineViewController", bundle: Bundle.main)
        let mineNavCtrl = MineNavigationController.init(rootViewController: mineCtrl)
        
        let viewCtrls = [homeNavCtrl, rankNavCtrl, UIViewController.init(), discoveryNavCtrl, mineNavCtrl]
        self.viewControllers = viewCtrls
        
        // MARK: TabBarItems
        let items = self.tabBar.items
        
        let homeItem = items![0]
        configureTabBarItem(item: homeItem, title: "首页", image: #imageLiteral(resourceName: "tabbar_home"), selectedImage: #imageLiteral(resourceName: "tabbar_home_selected"))
        
        let rankItem = items![1]
        configureTabBarItem(item: rankItem, title: "排行榜", image: #imageLiteral(resourceName: "tabbar_rank"), selectedImage: #imageLiteral(resourceName: "tabbar_rank_selected"))
        
        let liveItem = items![2]
        congfigureTabbarLiveItem(item: liveItem, image: #imageLiteral(resourceName: "tabbar_live"), selectedImage: #imageLiteral(resourceName: "tabbar_live_selected"))
        
        let discoveryItem = items![3]
        configureTabBarItem(item: discoveryItem, title: "发现", image: #imageLiteral(resourceName: "tabbar_discovery"), selectedImage: #imageLiteral(resourceName: "tabbar_discovery_selected"))
        
        let mineItem = items![4]
        configureTabBarItem(item: mineItem, title: "用户中心", image: #imageLiteral(resourceName: "tabbar_mine"), selectedImage: #imageLiteral(resourceName: "tabbar_mine_selected"))
        
        // MARK: TabbarItem title
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for: UIControlState.normal)
        UITabBar.appearance().backgroundColor = UIColor.init(red: 201.0/255, green: 192.0/255, blue: 187.0/255, alpha: 1.0)
        
        
    }
    
    // MARK: 设置tabBarItem 和动画
    func configureTabBarItem(item: UITabBarItem, title: String, image: UIImage, selectedImage: UIImage) {
        item.image = image.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item.selectedImage = selectedImage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        item.title = title
        
    }
    func congfigureTabbarLiveItem(item: UITabBarItem, image: UIImage, selectedImage: UIImage) {
        configureTabBarItem(item: item, title: "", image: image, selectedImage: selectedImage)
        
    }
    open func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController .isEqual(tabBarController.viewControllers?[2]) {
            
            return false
        }
        
        return true
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animationAtIndex(index: (self.tabBar.items?.index(of: item))!)
    }
    
    
    func animationAtIndex(index: Int) {
        if index == 2 {
            return
        }
        var tabbarBtnArray = Array<Any>.init()
        for tabbarBtn in self.tabBar.subviews {
            if tabbarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabbarBtnArray.append(tabbarBtn)
            }
        }
        let animation = CABasicAnimation.init(keyPath: "transform.scale")
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.fromValue = 0.7
        animation.toValue = 1.3
        
        let animaLayer = (tabbarBtnArray[index] as AnyObject).layer
        animaLayer?.add(animation, forKey: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


