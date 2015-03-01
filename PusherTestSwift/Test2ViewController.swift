//
//  Test2ViewController.swift
//  PusherTestSwift
//
//  Created by Alex Bechmann on 01/03/2015.
//  Copyright (c) 2015 Alex Bechmann. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController, PTPusherDelegate { //PTPusherPresenceChannelDelegate {

    var client:AnyObject? = nil
    var channel: PTPusherPresenceChannel = PTPusherPresenceChannel()
    var api: PTPusherAPI = PTPusherAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.client = PTPusher.pusherWithKey("3bed0224e216f7d3c3a4", delegate: self)
        
        self.api = PTPusherAPI(key: "3bed0224e216f7d3c3a4", appID: "109110", secretKey: "c1e850ac3781ed00bf63")
        
        self.client?.connect()
        self.channel = self.client!.subscribeToPresenceChannelNamed("50")
        
        self.client?.setAuthorizationURLFromString("http://bechmann.net76.net/topik/auth.php?channel_name=\(self.channel.name)&socket_id=\(self.client!.socketID)")
        
        self.client?.authorizeWithCompletionHandler { (b, obj, error) -> Void in
            //
        }

        //self.channel.bindToEventNamed("testEvent", handleWithBlock: { (response) -> Void in
            
        //})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pusher(pusher: PTPusher!, didReceiveErrorEvent errorEvent: PTPusherErrorEvent!) {
        //
    }
}
