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
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: "send")
        
        self.client = PTPusher.pusherWithKey("3bed0224e216f7d3c3a4", delegate: self)
        self.client?.connect()
        self.api = PTPusherAPI(key: "3bed0224e216f7d3c3a4", appID: "109110", secretKey: "c1e850ac3781ed00bf63")
        
        self.channel = self.client!.subscribeToChannelNamed("50")
        self.channel.bindToEventNamed("testEvent", handleWithBlock: { (response) -> Void in
            println("response: \(response)")
            self.lbl.text = response.data["message"] as? String
        })
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var v = Test2ViewController()
        //self.presentViewController(v, animated:false, completion:nil)
    }

    func send(){
        self.api.triggerEvent("testEvent", onChannel: "50", data: ["message": self.input.text], socketID: nil)
        self.input.text = ""
    }
    
}

