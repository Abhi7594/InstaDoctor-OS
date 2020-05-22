//
//  LikeToSeeTheDoctorVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class LikeToSeeTheDoctorVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sub_heading_view: UIView!
    @IBOutlet weak var sub_heading_label: UILabel!
    @IBOutlet weak var seeDoctorNow_view: UIView!
    @IBOutlet weak var seeDoctorNow_Heading_Label: UILabel!
    @IBOutlet weak var seeDoctorNow_SubHeading_label: UILabel!
    @IBOutlet weak var seeDoctorNow_icon_imageView: UIImageView!
    @IBOutlet weak var seeDoctorNow_forwardButton: UIButton!
    @IBOutlet weak var scheduleApponyment_view: UIView!
    @IBOutlet weak var scheduleApponyment_Heading_Label: UILabel!
    @IBOutlet weak var scheduleApponyment_icon_imageView: UIImageView!
    @IBOutlet weak var scheduleApponyment_forwardButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        LikeToSeeTheDoctorVC_UI()
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
    
    @IBAction func seeDoctorNow_ButtonButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeeADoctorVC") as! SeeADoctorVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func scheduleApponyment_Button_Action(_ sender: Any)
    {
        /*let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterYourChildVC") as! RegisterYourChildVC
        self.navigationController?.pushViewController(vc, animated: true)*/
    }
 
    

}
