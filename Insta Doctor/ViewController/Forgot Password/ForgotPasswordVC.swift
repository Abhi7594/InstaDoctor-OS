//
//  ForgotPasswordVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 01/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AlamofireObjectMapper
import SwiftyJSON

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var sliderImage_view: UIView!
    @IBOutlet weak var sliderImage_imageView: UIImageView!
    @IBOutlet weak var emailWelcomeText_view: UIView!
    @IBOutlet weak var emailWelcomeText_Label: UILabel!
    @IBOutlet weak var formField_view: UIView!
    @IBOutlet weak var emailAddress_Label: UILabel!
    @IBOutlet weak var emailAddress_textField: UITextField!
    @IBOutlet weak var horizontal_Label: UILabel!
    @IBOutlet weak var recoverMyPasswordButton_view: UIView!
    @IBOutlet weak var recoverMyPassword_button: UIButton!
    
    var gradientLayer: CAGradientLayer!
    var isSelected = Bool()
    var userDetails = signUpInfo()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ForgotPasswordVC_UI()
        
        self.emailAddress_textField.delegate = self
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
    
    // MARK:- TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == emailAddress_textField
        {
            emailAddress_textField.backgroundColor = UIColor.clear
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailAddress_textField
        {
            emailAddress_textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == emailAddress_textField
        {
            self.userDetails.userEmailID = emailAddress_textField.text!.lowercased()
        }
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if userDetails.userEmailID.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please check your email", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else
        {
            isFieldVerified = true
        }
        return isFieldVerified
    }
    
    //MARK: button Action
    @IBAction func recoverMyPasswordButton_Action(_ sender: Any)
    {
        if isAllFieldVerified()
        {
            forgotPasswordServices()
        }
    }
    
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: SERVICE FOR UPDATE EMAIL
    func forgotPasswordServices()
    {
        let params:[String:AnyObject] = ["f_email":emailAddress_textField.text as AnyObject,
                                         "apiname":"forget_password" as AnyObject]
        print(params)
        SVProgressHUD.show()
        
        Alamofire.request(ApiGet.baseURL, method: .get, parameters: params, encoding:URLEncoding.default) //httpBody
            .responseJSON{
                
                response in
                print(response)
                SVProgressHUD.dismiss()
                
                if let value = response.result.value as AnyObject?
                {
                    let json = JSON(response.result.value!)
                    
                    let status = value.object(forKey: "status") as! Int
                    let message = value.object(forKey: "message") as! String
                    
                    if (status==200)
                    {
                        KSToastView.ks_showToast(message, duration: 3.0)
                        
                        self.navigationController?.popViewController(animated: true)
                        
                        //self.updateEmailID.userEmailID = json["data"]["patient_email"].string!
                        
                        //UserDefaults.standard.set(self.updateEmailID.userEmailID, forKey: "USER_EMAILID")
                        //UserDefaults.standard.synchronize()
                        
                        self.dismiss(animated: true, completion: nil)
                    }
                    else
                    {
                        KSToastView.ks_showToast(message, duration: 3.0)
                    }
                }
        }
    }
    
}
