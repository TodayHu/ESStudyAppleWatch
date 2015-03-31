//
//  AppDelegate.swift
//  ESStudyAppleWatch
//
//  Created by MAEDAHAJIME on 2015/03/31.
//  Copyright (c) 2015年 MAEDAHAJIME. All rights reserved.
//

import UIKit

// WatchKitをインポート
import WatchKit

/// カウント値が更新されたことを通知します。
let ApplicationUpdateCountNotification = "ApplicationUpdateCountNotification"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
    // WatchKit Extension から openParentApplication:reply: が実行されると、このメソッドが呼び出されます。
    func application(application: UIApplication!, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]!, reply: (([NSObject : AnyObject]!) -> Void)!) {
        
        // 適切なカウント値が送られてきたときに通知を送信します。
        if let count = userInfo["count"] as? NSNumber {
            
            NSLog("AppDelegate通知を送信 %d", count)
            
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName(ApplicationUpdateCountNotification, object: count)
        }
        
        // 今回は常に空の情報を呼び出し元に返します。
        reply([:])
    }
    
    //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

