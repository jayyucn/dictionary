//
//  FacebookViewController.swift
//  ymlive
//
//  Created by jay yu on 2018/1/2.
//  Copyright © 2018年 nalanrola. All rights reserved.
//

import UIKit

class FacebookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "facebook pop animation"
        self.view.backgroundColor = UIColor.cyan
        // Do any additional setup after loading the view.
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle("dismiss", for: UIControlState.normal)
        btn.frame = CGRect(x: 100.0, y: 100.0, width: 80.0, height: 40)
        btn .addTarget(self, action: #selector(dismissAction(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    @objc func dismissAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
