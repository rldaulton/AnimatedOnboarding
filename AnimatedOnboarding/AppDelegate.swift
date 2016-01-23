//
//  AppDelegate.swift
//  Calendar Loader
//
//  Created by Ryan Daulton on 1/13/15.
//  Copyright (c) 2015 Fade, LLC. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

var storyboard = UIStoryboard(name: "Main", bundle: nil)

var initialViewControllerRoot: AnyObject = storyboard.instantiateInitialViewController()!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let userHasOnboardedKey = "user_has_onboarded"
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //        self.window!.backgroundColor = UIColor.whiteColor()
        // Override point for customization after application launch.
        
        
        self.setupNormalRootVC(false)
        
            
        // Determine if the user has completed onboarding yet or not
        let userHasOnboardedAlready = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey);
        
        
        // If the user has already onboarded, setup the normal root view controller for the application
        // without animation like you normally would if you weren't doing any onboarding
        
        if userHasOnboardedAlready {
            //self.window!.rootViewController = self.generateOnboardingViewController()
            self.setupNormalRootVC(false);
        }
            
            // Otherwise the user hasn't onboarded yet, so set the root view controller for the application to the
            // onboarding view controller generated and returned by this method.
        else {
            self.window!.rootViewController = self.generateOnboardingViewController()
        }
        
        self.window!.makeKeyAndVisible()
        return true
    }
    func generateOnboardingViewController() -> OnboardingViewController {
        // Generate the first page...
        
        let firstPage: OnboardingContentViewController = OnboardingContentViewController(title: "one", body: "", image: UIImage(named:
            ""), buttonText: "") {}
        
        
        // Generate the second page...
        let secondPage: OnboardingContentViewController = OnboardingContentViewController(title: "two", body: "", image: UIImage(named:
            ""), buttonText: "") {}
        
        // Generate the third page, and when the user hits the button we want to handle that the onboarding
        // process has been completed.
        let thirdPage: OnboardingContentViewController = OnboardingContentViewController(title: "three", body: "", image: UIImage(named:
            ""), buttonText: "") {}
        
        let fourthPage: OnboardingContentViewController = OnboardingContentViewController(title: "four", body: "", image: UIImage(named:
            ""), buttonText: "Get Started") {
                self.handleOnboardingCompletion()
        }
        // process has been completed.
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let ScreenSize = bounds.size.width
        let blockImages = ["mtnblock","flagblock","bsktballblock"]
        
        //TEMPORARY FUNCS GO HERE
        
        // Create the onboarding controller with the pages and return it.
        let onboardingVC: OnboardingViewController = OnboardingViewController(backgroundImage: UIImage(named: "background"), contents: [firstPage, secondPage, thirdPage, fourthPage])
        
        return onboardingVC
    }
    
    func handleOnboardingCompletion() {
        // Now that we are done onboarding, we can set in our NSUserDefaults that we've onboarded now, so in the
        // future when we launch the application we won't see the onboarding again.
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: userHasOnboardedKey)
        
        // Setup the normal root view controller of the application, and set that we want to do it animated so that
        // the transition looks nice from onboarding to normal app.
        setupNormalRootVC(true)
    }
    
    func setupNormalRootVC(animated : Bool) {
        // Here I'm just creating a generic view controller to represent the root of my application.
        let mainVC = UIViewController()
        mainVC.title = "RootView"
        
        // If we want to animate it, animate the transition - in this case we're fading, but you can do it
        // however you want.
        if animated {
            UIView.transitionWithView(self.window!, duration: 0.5, options:.TransitionCrossDissolve, animations: { () -> Void in
                self.window!.rootViewController = initialViewControllerRoot as? UIViewController
                }, completion:nil)
        }
            
            // Otherwise we just want to set the root view controller normally.
        else {
            self.window?.rootViewController = initialViewControllerRoot as? UIViewController;
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        NSNotificationCenter.defaultCenter().postNotificationName("StopSpinning", object: nil)
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.fade-co.Calendar_Loader" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Calendar_Loader", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("Calendar_Loader.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch var error1 as NSError {
            error = error1
            coordinator = nil
            // Report any error we got.
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error1
            //error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict as [NSObject : AnyObject])
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        } catch {
            fatalError()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges {
                do {
                    try moc.save()
                } catch let error1 as NSError {
                    error = error1
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    NSLog("Unresolved error \(error), \(error!.userInfo)")
                    abort()
                }
            }
        }
    }
    
}
