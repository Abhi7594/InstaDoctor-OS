//
//  WhoIsVisitForVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class WhoIsVisitForVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sub_heading_view: UIView!
    @IBOutlet weak var sub_heading_label: UILabel!
    @IBOutlet weak var self_view: UIView!
    @IBOutlet weak var self_Heading_Label: UILabel!
    @IBOutlet weak var self_SubHeading_label: UILabel!
    @IBOutlet weak var self_icon_imageView: UIImageView!
    @IBOutlet weak var self_forwardButton: UIButton!
    @IBOutlet weak var myChild_view: UIView!
    @IBOutlet weak var myChild_Heading_Label: UILabel!
    @IBOutlet weak var myChild_subHeading_label: UILabel!
    @IBOutlet weak var myChild_icon_imageView: UIImageView!
    @IBOutlet weak var myChild_forwardButton: UIButton!
    @IBOutlet weak var someOneElse_view: UIView!
    @IBOutlet weak var someOneElse_Heading_Label: UILabel!
    @IBOutlet weak var someOneElse_subHeading_label: UILabel!
    @IBOutlet weak var someOneElse_forwardButton: UIButton!
    @IBOutlet weak var self_icon_view: UIView!
    @IBOutlet weak var myChild_icon_view: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        WhoIsVisitForVC_UI()
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
        //self.navigationController?.popViewController(animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func self_ButtonButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectyourSymptomsVC") as! SelectyourSymptomsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func myChild_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterYourChildVC") as! RegisterYourChildVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func someOneElse_Button_Action(_ sender: Any)
    {
        
    }
    
    
    
    
}


