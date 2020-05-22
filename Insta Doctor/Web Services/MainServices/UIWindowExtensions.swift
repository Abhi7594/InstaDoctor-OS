//
//  UIWindowExtensions.swift
//  FitDesk
//
//  Created by Nivedita Gupta on 04/04/16.
//  Copyright © 2016 Clixlogix Technologies. All rights reserved.
//

import UIKit

extension UIWindow {
    
    var currentController: UIViewController?
    {
        if let vc = self.rootViewController
        {
            return getCurrentController(vc)
        }
        return nil
    }
    
    func getCurrentController(_ vc: UIViewController) -> UIViewController
    {
        if let pc = vc.presentedViewController
        {
            return getCurrentController(pc)
        }
        else if let nc = vc as? UINavigationController
        {
            if nc.viewControllers.count > 0
            {
                return getCurrentController(nc.viewControllers.last!)
            }
            else
            {
                return nc
            }
        }
        else
        {
            return vc
        }
    }
}
