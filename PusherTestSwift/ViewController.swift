//
//  ViewController.swift
//  PusherTestSwift
//
//  Created by Alex Bechmann on 28/02/2015.
//  Copyright (c) 2015 Alex Bechmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PTPusherDelegate {

    var client:AnyObject? = nil
    var channel: PTPusherChannel = PTPusherChannel()
    var api: PTPusherAPI = PTPusherAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "send")
        
        self.client = PTPusher.pusherWithKey("3bed0224e216f7d3c3a4", delegate: self)
        self.client?.connect()
        self.api = PTPusherAPI(key: "3bed0224e216f7d3c3a4", appID: "109110", secretKey: "c1e850ac3781ed00bf63")
        
        self.channel = self.client!.subscribeToChannelNamed("50")
        self.channel.bindToEventNamed("testEvent", handleWithBlock: { (event) -> Void in
            println(event.data)
        })
    }


    func send(){
        self.api.triggerEvent("testEvent", onChannel: "50", data: ["foo": "bar"], socketID: nil)
    }
    
}

