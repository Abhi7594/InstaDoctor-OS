//
//  MainPageViewController.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 19/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    lazy var vcList:[UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstVC")
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecoandVC")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdVC")
        
        return [firstVC, secondVC, thirdVC]
        
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUpLoad()
    }
    
    func setUpLoad()
    {
        self.dataSource = self
        
        if let vc = vcList.first
        {
            self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index + 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
    }
    
}
