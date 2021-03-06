//
//  AppDelegate.swift
//  i_Xplore
//
//  Created by Justin on 6/8/16.
//  Copyright © 2016 Justin Gasta. All rights reserved.
//

import UIKit
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mapNavigationController: UINavigationController?
    var navigationController: UINavigationController?



    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let basicViewController = MapViewController(nibName: "MapViewController", bundle: nil)
        mapNavigationController = UINavigationController(rootViewController: basicViewController)
        self.mapNavigationController?.navigationBarHidden = false
        
        let landingViewController = LandingViewController(nibName:"LandingViewController",bundle:nil)
        self.navigationController = UINavigationController(rootViewController: landingViewController)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = self.mapNavigationController
        self.window?.makeKeyAndVisible()


        
        return true
    }
    
    func navigateToJournalNavigationController() {
        window?.rootViewController = mapNavigationController
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

