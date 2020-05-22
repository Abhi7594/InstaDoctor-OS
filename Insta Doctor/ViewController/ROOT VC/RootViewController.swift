//
//  RootViewController.swift
//
//  Created by Soft Gates on 01/05/20.
//  Copyright © 2020 Soft Gates. All rights reserved.
//

import UIKit

class RootViewController: REFrostedViewController {
    
     // MARK:- View Life Cycle Methods
     override func viewDidLoad()
     {
         super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
     }

    // MARK:- Memory Warning Method
     override func didReceiveMemoryWarning()
     {
         super.didReceiveMemoryWarning()
     }

     override func awakeFromNib()
     {
        /*if UserDefaults.standard.value(forKey: "") as! String == ""
         {
         self.contentViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
         }
         else
         {
         self.contentViewController = self.storyboard!.instantiateViewController(withIdentifier: "SidePanelNavigationController") as! UINavigationController
         }*/
        
        self.contentViewController = self.storyboard!.instantiateViewController(withIdentifier: "SidePanelNavigationController") as! UINavigationController
     }


}
