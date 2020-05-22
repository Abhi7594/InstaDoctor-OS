//
//  WaittingRoomVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 14/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class WaittingRoomVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var seeAnotherDoctor_Button: UIButton!
    @IBOutlet weak var iWillWait_Button: UIButton!
    @IBOutlet weak var image_imageView: UIView!
    @IBOutlet weak var timer_view: UIView!
    @IBOutlet weak var hourCount_label: UILabel!
    @IBOutlet weak var hourHeading_label: UILabel!
    @IBOutlet weak var vertical_label_1: UILabel!
    @IBOutlet weak var minuteCount_label: UILabel!
    @IBOutlet weak var minuteHeading_label: UILabel!
    @IBOutlet weak var vertical_label_2: UILabel!
    @IBOutlet weak var secoandCount_label: UILabel!
    @IBOutlet weak var secoandHeading_label: UILabel!
    @IBOutlet weak var patientInQueHeading_label: UILabel!
    @IBOutlet weak var patientInQueueCount: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        WaittingRoomVC_UI()
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
    
    @IBAction func seeAnotherDoctor_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeeADoctorVC") as! SeeADoctorVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func iWillWait_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddPaymentDetailsVC") as! AddPaymentDetailsVC
        vc.meetWaitingSchedule_value = "2"
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
