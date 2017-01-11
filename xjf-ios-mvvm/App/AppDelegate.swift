//
//  AppDelegate.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/3/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initRealm()
        AccountManager.sharedInstance.loadUserData()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
     }

    func initRealm() {
        print("initRealm")
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // This must be greater than the previously used, migration will execute, or not
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { _, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }

}
