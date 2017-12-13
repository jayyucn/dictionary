//
//  APIManager.swift
//  ymlive
//
//  Created by jay yu on 2017/12/12.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

private var headers = Alamofire.SessionManager.defaultHTTPHeaders

class APIManager {
    
    static let baseUrl = NSURL.init(string: "http://phone.hainantaohua.com/")
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result: Any) -> ()) {
        
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        // 2.发送网络请求
        
//        let appVersion: String? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
//        let timeStamp = Date().timeIntervalSince1970
//        let md5String = MD5("ios\(timeStamp) \(appVersion!)DaUGaBzXe6&Kol@i")
//        headers["User-Agent"] = "ios;\(appVersion!);\(timeStamp);\(md5String)"
        
        let url = "http://www.weather.com.cn/data/city3jdata/china.html" //baseUrl?.appendingPathComponent(URLString)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseString { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            // 3.获取结果
            
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
}


