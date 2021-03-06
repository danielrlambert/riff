//
//  AppDelegate.swift
//  Riff
//
//  Created by Boariu Andy on 7/27/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import GiphyCoreSDK
import IQKeyboardManagerSwift
import Analytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var ref: DatabaseReference!
    
    var arrQuotes = [Quote]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        ref = Database.database().reference()
        
        //=>    Configure your API Key
        GiphyCore.configure(apiKey: "o8T0u70VfjuuY2WVcYgA1CrlmqRDLO95")
        
        //=>    Enable Keyboard manager
        IQKeyboardManager.sharedManager().enable = true
        
        //=>    Analytics segment.io setup
        let config = SEGAnalyticsConfiguration.init(writeKey: "eG8wnJ2rnGS8m0yk2kuqKEAffk4cV4nJ")
        config.trackApplicationLifecycleEvents = true
        config.recordScreenViews = true
        SEGAnalytics.setup(with: config)
        
        //=>    Load Quotes
        loadAllQuotes()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Custom Methods
    
    private func loadAllQuotes() {
        self.ref.child(Constants.RiffKeys.quotes).observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let me = self else { return }
            
            for data in snapshot.children {
                if let dataQuote = data as? DataSnapshot {
                    if var dictQuote = dataQuote.value as? [String: AnyObject] {
                        
                        var quote = Quote()
                        quote.text           = dictQuote[Constants.RiffKeys.text] as? String
                        quote.persona        = dictQuote[Constants.RiffKeys.person] as? String
                        me.arrQuotes.append(quote)
                    }
                }
            }
        }
    }
}

// MARK: - Convenience Constructors

let appDelegate = UIApplication.shared.delegate as! AppDelegate

