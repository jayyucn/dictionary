//
//  DiscoveryViewController.swift
//  ymlive
//
//  Created by jay yu on 2017/12/1.
//  Copyright © 2017年 nalanrola. All rights reserved.
//

import UIKit
import IJKMediaFramework

class DiscoveryViewController: UIViewController {

    var player:IJKFFMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        // Do any additional setup after loading the view.
        let options = IJKFFOptions.byDefault()
        
        //视频源地址
        //rtmp://live.hkstv.hk.lxdns.com/live/hks
        let url = NSURL(string: "rtmp://live.hkstv.hk.lxdns.com/live/hks")
        //let url = NSURL(string: "http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8")
        //初始化播放器，播放在线视频或直播（RTMP）
        let player = IJKFFMoviePlayerController(contentURL: url! as URL, with: options)!
        //播放页面视图宽高自适应
        let autoresize = UIViewAutoresizing.flexibleWidth.rawValue |
            UIViewAutoresizing.flexibleHeight.rawValue
        player.view.autoresizingMask = UIViewAutoresizing(rawValue: autoresize)
        
        player.view.frame = self.view.bounds
        player.scalingMode = .aspectFit //缩放模式
        player.shouldAutoplay = true //开启自动播放
        
        self.view.autoresizesSubviews = true
        self.view.addSubview((player.view)!)
        self.player = player
        self.player.prepareToPlay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //开始播放
        
        self.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //关闭播放器
        self.player.pause()
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
