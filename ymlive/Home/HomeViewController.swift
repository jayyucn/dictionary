//
//  HomeViewController.swift
//  ymlive
//
//  Created by jay yu on 2017/12/1.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let device = UIDevice.current
        
        let params: [String: Any]? = ["system_name": device.systemName,
        "system_version": device.systemVersion,
        "device_model": "iPhone8,1",
        "platform": "iPhone8,1",
        "carrier": "",
        "udid": "h00ed73c44ad1b7ff29e904d24cd9b0df",
        "app_version": Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String,
        "app_channel": "APP_STORE",
        "app_bundleID": Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String,
        "lang": Locale.current.languageCode!,
        "jailbroken": "0",
        "idfa": "D96044AF-2807-44E9-B986-BF405175ACB1",
        "ry": "1"]
//        print("params:", params!)
        APIManager.request(.get, URLString: "index/sync", parameters: params ) { (response) in
            
        }
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print(self.view.frame.width)
        
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
