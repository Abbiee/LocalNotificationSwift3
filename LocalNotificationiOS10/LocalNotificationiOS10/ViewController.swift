//
//  ViewController.swift
//  LocalNotificationiOS10
//
//  Created by PintLabs on 20/01/17.
//  Copyright © 2017 LostFrequencies. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var localNotificationButton: UIButton!
    var isGrantedNotificationAccess:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
        }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func localNotificationButtonAction(_ sender: Any) {
        
        if isGrantedNotificationAccess{
            //add notification code here
            let content = UNMutableNotificationContent()
            content.title = "10 Second Notification Demo"
            content.subtitle = "From MakeAppPie.com"
            content.body = "Notification after 10 seconds - Your pizza is Ready!!"
            content.categoryIdentifier = "message"
            
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: 10.0,
                repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)

        }
    }

}

