//
//  CustomerSupportVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class CustomerSupportVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var customerSupport_heading_view: UIView!
    @IBOutlet weak var customerSupport_heading_label: UILabel!
    @IBOutlet weak var imageBanner_view: UIView!
    @IBOutlet weak var bannerImage_imageView: UIImageView!
    @IBOutlet weak var getHelpQuickly_view: UIView!
    @IBOutlet weak var getHelpQuicklyHeading_Label: UILabel!
    @IBOutlet weak var browseOurFAQ_label: UILabel!
    @IBOutlet weak var getHelp_icon_imageView: UIImageView!
    @IBOutlet weak var getHekpQuickly_forwardButton: UIButton!
    @IBOutlet weak var liveChatSupport_view: UIView!
    @IBOutlet weak var liveChatSupportHeading_Label: UILabel!
    @IBOutlet weak var sendUsMessage_label: UILabel!
    @IBOutlet weak var liveChatSupport_icon_imageView: UIImageView!
    @IBOutlet weak var liveChatSupport_forwardButton: UIButton!
    @IBOutlet weak var callSupport_view: UIView!
    @IBOutlet weak var callSupportHeading_Label: UILabel!
    @IBOutlet weak var callSupport_Message_label: UILabel!
    @IBOutlet weak var callSupport_icon_imageView: UIImageView!
    @IBOutlet weak var callSupport_forwardButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        CustomerSupportVC_UI()
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
    
    @IBAction func callSupportButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func liveChatSupportButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LiveChatSupportVC") as! LiveChatSupportVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func getHelpQuicklyButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FAQVC") as! FAQVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    

}
