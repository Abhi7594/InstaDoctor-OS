//
//  AreYouTakingMedicineVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class AreYouTakingMedicineVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var subHeading_Message_label: UILabel!
    @IBOutlet weak var subHeading_Message_view: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var banner_view: UIView!
    @IBOutlet weak var button_view: UIView!
    @IBOutlet weak var banner_imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        AreYouTakingMedicineVC_UI()
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
    
    @IBAction func yes_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhichMedicineVC") as! WhichMedicineVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func no_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HaveAnyDrugAllergyVC") as! HaveAnyDrugAllergyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

