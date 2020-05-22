//
//  ProfileVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var logout_label: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var user_profile_view: UIView!
    @IBOutlet weak var doctorProfileImage_imageView: UIImageView!
    @IBOutlet weak var userName_label: UILabel!
    @IBOutlet weak var viewAndEdit_Label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var profileComplete_label: UILabel!
    @IBOutlet weak var payment_view: UIView!
    @IBOutlet weak var payment_heading_label: UILabel!
    @IBOutlet weak var paymentMethod_Label: UILabel!
    @IBOutlet weak var payment_imageView: UIImageView!
    @IBOutlet weak var profile_view: UIView!
    @IBOutlet weak var profile_heading_label: UILabel!
    @IBOutlet weak var contactInformantion_Button: UIButton!
    @IBOutlet weak var changePassword_Button: UIButton!
    @IBOutlet weak var insurance_Button: UIButton!
    @IBOutlet weak var employer_Button: UIButton!
    @IBOutlet weak var profileView_image_ImageView: UIImageView!
    @IBOutlet weak var getInTouch_view: UIView!
    @IBOutlet weak var customerSupport_Button: UIButton!
    @IBOutlet weak var aboutInstaDoctor_Button: UIButton!
    @IBOutlet weak var termsCondition_Button: UIButton!
    @IBOutlet weak var payment_Button: UIButton!
    @IBOutlet weak var getInTouch_imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ProfileVC_UI()
        
        if UserDefaults.standard.object(forKey: "TOKEN") != nil
        {
            userName_label.text = UserDefaults.standard.string(forKey: "PATIENT_NAME")?.uppercased()
        }
        
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
    @IBAction func logoutButton_Action(_ sender: Any)
    {
        let alertController = UIAlertController(title: "", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .default) { (action:UIAlertAction!) in
            
        }
        alertController.addAction(cancelAction)
        let OKAction = UIAlertAction(title: "Yes", style: .default)
        { (action:UIAlertAction!) in
            
            UserDefaults.standard.removeObject(forKey: "PATIENT_EMAILID")
            UserDefaults.standard.synchronize()
            
            UserDefaults.standard.removeObject(forKey: "PATIENT_NAME")
            UserDefaults.standard.synchronize()
            
            UserDefaults.standard.removeObject(forKey: "TOKEN")
            UserDefaults.standard.synchronize()
            
            self.frostedViewController.hideMenuViewController()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
         
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    @IBAction func PaymentButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreditCardListVC") as! CreditCardListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func contactInformantionButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactInformantionVC") as! ContactInformantionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changePasswordButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func insuranceButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterYourChildVC") as! RegisterYourChildVC//InsuranceVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func employerButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmployerVC") as! EmployerVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func customerSupportButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomerSupportVC") as! CustomerSupportVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func aboutInstaDoctorButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutInstaDoctorVC") as! AboutInstaDoctorVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func termsConditionButtonAction(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionVC") as! TermsAndConditionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
