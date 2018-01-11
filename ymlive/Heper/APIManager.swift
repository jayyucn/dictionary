//
//  APIManager.swift
//  ymlive
//
//  Created by jay yu on 2017/12/12.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit
import Alamofire

/** request method type */
enum MethodType {
    case get
    case post
}

typealias responseDict = Any

class APIManager {
    fileprivate class Header {
        
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        static let header = Header()
        private init() {
            //Accept-Encoding: gzip, deflate
            headers["Accept-Encoding"] = "gzip, deflate"
            headers["Content-Type"] = "text/html; application/json; text/json; text/javascript; text/plain; charset=utf-8"
        }
    }
//    http://phone.hainantaohua.com/
    static let baseUrl = NSURL.init(string: "http://127.0.0.1/tp5/public/index/")
    
    /// 网络请求
    ///
    /// - Parameters:
    ///   - type: 请求方法类型
    ///   - URLString: 请求地址
    ///   - parameters: 请求参数
    ///   - finishedCallback: 请求结束回调
    class func request(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result: responseDict) -> ()) {
        
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        // 2.发送网络请求
        var headers = Header.header.headers
        var appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
//        let appVersion: String? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        if appVersion == nil {
            appVersion = ""
        }
        let timeStamp = Date().timeIntervalSince1970
        let md5String = ("ios\(timeStamp) \(appVersion!)DaUGaBzXe6&Kol@i").md5()
        headers["User-Agent"] = "ios;\(appVersion!);\(timeStamp);\(md5String)"
        let url = baseUrl?.appendingPathComponent(URLString)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url!, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseString { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            // 3.获取结果
//            print(response)
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            // 4.将结果回调出去
            if  parameters != nil {
                YMVerbose("︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾网络请求︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾︾")
                let string = """
                \(url!)
                请求参数:
                \(parameters!)
                请求结果:
                \(result)
                """
                YMRequestLog(string)
                YMVerbose("︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽网络请求︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽︽")
            }
            finishedCallback(result)
        }
    }
}


