//
//  AppDelegate.swift
//  iOS9-CoreSpotlight
//
//  Created by 51Testing on 15/11/11.
//  Copyright © 2015年 HHW. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(application: UIApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
        
        //取出userInfo中的 ID以便进一步操作，跳转到指定的位置，
        let friendID = userActivity.userInfo?["kCSSearchableItemActivityIdentifier"] as! String
       // (lldb) po userActivity.userInfo
         //   ▿ Optional([kCSSearchableItemActivityIdentifier: com.hhw.identifier 2])
          //    ▿ Some : 1 elements
      //          ▿ [0] : 2 elements
      //            - .0 : kCSSearchableItemActivityIdentifier
      //            - .1 : com.hhw.identifier 2

        let navigationController = (window?.rootViewController as! UINavigationController)
        navigationController.popToRootViewControllerAnimated(false)
        let friendTableViewController = navigationController.viewControllers.first as! ListTableViewController
        friendTableViewController.showPerson(friendID)
        return true
    }

}

