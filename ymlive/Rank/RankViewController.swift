//
//  RankViewController.swift
//  ymlive
//
//  Created by jay yu on 2017/12/1.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit
import Alamofire

class RankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//
        let params = ["account":18516774419,"pwd":123456]
        APIManager.requestData(.post, URLString: "index/login", parameters: params) { (response) in
            print("response: \(response)")
        }
        
        
//        Alamofire.request("http://phone.hainantaohua.com/index/login").responseString { (response) in
//            print("response:\(response)")
//        }
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
