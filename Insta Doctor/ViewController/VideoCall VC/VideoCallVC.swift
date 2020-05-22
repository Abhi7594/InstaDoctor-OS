//
//  VideoCallVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 14/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class VideoCallVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    //MARK: Button Action first view
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    

}
