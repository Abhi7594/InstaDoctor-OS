//
//  TermsOfUseVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class TermsOfUseVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigationHeading_label: UILabel!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeadingView_Heading_Label: UILabel!
    @IBOutlet weak var subHeadingView_subHeading_Label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        TermsOfUseVC_UI()
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
    
    //MARK: Button Action
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
