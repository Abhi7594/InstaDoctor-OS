//
//  AppDelegate.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 29/04/20.
//  Copyright © 2020 Softgates. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let nav = UINavigationController()

    var googleMapConfiguration_APIKey = "AIzaSyDGpSr11DHsX8_n8pPlBdqRpEcWdfoRqRw"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        
        //AMRK: Google MAP SET API KEY
        //GMSServices.provideAPIKey("\(googleMapConfiguration_APIKey)")
        //GMSPlacesClient.provideAPIKey("\(googleMapConfiguration_APIKey)")
        
        //MARK: Calling RootView Controller
        self.setRootViewController()
        
        //MARK: App Budge Count
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        //MARK: IQKeyboardManager Method Calling
        IQKeyboardManager.shared.enable = true
        
        //MARK: Calling TAB Bar Modification function
        tabBarUI()
        
        //MARK: Calling Custom Font function
        setupGlobalAppearance()
        
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

    //MARK:- Set RootViewController
    func setRootViewController()
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        nav.viewControllers = [mainView]
        self.window!.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        /*self.window = UIWindow(frame: UIScreen.main.bounds)
         if UserDefaults.standard.bool(forKey: "ToHome") == true
         {
         let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
         nav.viewControllers = [mainView]
         }
         else
         {
         let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
         nav.viewControllers = [mainView]
         }
         self.window!.rootViewController = nav
         self.window?.makeKeyAndVisible()*/
    }
    
    //MARK: Navigation Bar UI Modification
    func navigationBarUIModification()
    {
        // MARK: Change Navigation Color
        UINavigationBar.appearance().barTintColor = Color.white
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.gray]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.gray,
             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
    }
    
    //MARK: Tab Bar UI Modification
    func tabBarUI()
    {
        /*UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.buttonColor], for:.selected)
         
         //MARK : Set Tab Bar Selected Color
         UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         UITabBar.appearance().barTintColor = Color.white*/
    }
    
    //MARK: Custom Font Methgod
    func setupGlobalAppearance()
    {
        let customFont = UIFont.appFontWith_PoppinsRegular(size: 16)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)
        //UITextField.appearance().substituteFontName = Constants.App.PoppinsRegular
        //UILabel.appearance().substituteFontName = Constants.App.PoppinsRegular
        //UILabel.appearance().substituteFontNameBold = Constants.App.PoppinsBold
    }
    
}

