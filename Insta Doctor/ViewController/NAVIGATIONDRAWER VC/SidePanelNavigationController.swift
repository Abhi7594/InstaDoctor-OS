//
//  SidePanelNavigationController.swift
//
//  Created by Abhishek Rathod on 21/12/19.
//  Copyright © 2019 Soft Gates. All rights reserved.
//

import UIKit

class SidePanelNavigationController: UINavigationController {

    // MARK:- View Life Cycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    // MARK:- Memory Warning Method
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func panGestureRecognized(_ sender: UIPanGestureRecognizer)
    {
        self.view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.panGestureRecognized(sender)
    }

}
