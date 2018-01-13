//
//  ViewController.swift
//  SocketApplication
//
//  Created by SGI-Mac7 on 13/01/2018.
//  Copyright © 2018 Slash Global. All rights reserved.
//

import UIKit
import SocketIOClientSwift


class ViewController: UIViewController {

    
    
    @IBOutlet weak var LblCounter: UILabel!
    var timer = NSTimer()
    
    var second = 60
    
    func updatetimer()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ( #selector(ViewController.newtimer)), userInfo: nil, repeats: true)
    
    }
    func newtimer() {
        if second != 0 {
        print("Something")
        second -= 1
        LblCounter.text = "\(second)"
        }
        else
        {
        timer.invalidate()
            LblCounter.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // getIPAddress()
        updatetimer()
    }

    private func getIPAddress()
    {
        let url = NSURL(string: "http://www.google.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (responseData, responseURl, error) -> Void in
            guard let data = responseData where error == nil else {
              
                return
            }
            
            let ip = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
          
            print(data, ip)
    }
        task.resume()
        

}

}