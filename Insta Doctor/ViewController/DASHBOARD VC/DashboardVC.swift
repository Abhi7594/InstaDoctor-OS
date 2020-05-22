//
//  DashboardVC.swift
//
//  Created by Abhishek Rathod on 21/12/19.
//  Copyright © 2019 Soft Gates. All rights reserved.
//

import UIKit

//let navigationControllerMenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SidePanelNavigationController") as! SidePanelNavigationController

class DashboardVC: UITabBarController {

    var selectedItem: UITabBarItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUpOnLoad()
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.title =  ""
    }
    
    //MARK: Helper Method
    func setUpOnLoad()
    {
        //setTabBarItemBackgroundImage()
        
        tabBarDropShadow()
    }
    
    //MARK: Tabbar Item Background Image Set Image function
    func setTabBarItemBackgroundImage()
    {
        // set red as selected background color
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height - 3)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.2486087329), size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
    }
    
    //MARK: Tabbar drop shadow function
    func tabBarDropShadow()
    {
        // remove default border
        tabBar.frame.size.width = self.view.frame.width + 1
        tabBar.frame.origin.x = -2
        
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = UIColor.white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        
    }
    
    //MARK: drop shadow top tab bar controller function
    func addTopShadow()
    {
        let frame = CGRect(x: 0, y: 35, width: self.view.frame.width, height: 6)
        
        let backgroundView = UIView(frame: frame)
        self.view.addSubview(backgroundView)
        
        //A linear Gradient Consists of two colours: top colour and bottom colour
        let topColor = UIColor.black
        let bottomColor = UIColor.clear
        
        //Add the top and bottom colours to an array and setup the location of those two.
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [CGFloat] = [0.0, 1.0]
        
        //Create a Gradient CA layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        gradientLayer.frame = frame
        gradientLayer.opacity = 0.2
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        backgroundView.layer.zPosition = 100
    }
    
}


extension UIImage
{
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
