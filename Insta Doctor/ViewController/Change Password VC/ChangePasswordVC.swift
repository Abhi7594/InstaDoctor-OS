//
//  ChangePasswordVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AlamofireObjectMapper
import SwiftyJSON

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var passwordConfirmation_heading_view: UIView!
    @IBOutlet weak var passwordConfirmation_heading_label: UILabel!
    @IBOutlet weak var bannerImage_view: UIView!
    @IBOutlet weak var bannerImage_imageView: UIImageView!
    @IBOutlet weak var formField_view: UIView!
    @IBOutlet weak var oldPasswordHeading_Label: UILabel!
    @IBOutlet weak var oldPassword_textfield: UITextField!
    @IBOutlet weak var horizontal_label_1: UILabel!
    @IBOutlet weak var oldPassword_hideShow_button: UIButton!
    @IBOutlet weak var newPasswordHeading_Label: UILabel!
    @IBOutlet weak var newPassword_textfield: UITextField!
    @IBOutlet weak var horizontal_label_2: UILabel!
    @IBOutlet weak var newPassword_hideShow_button: UIButton!
    @IBOutlet weak var confirmNewPasswordHeading_Label: UILabel!
    @IBOutlet weak var confirmNewPassword_textfield: UITextField!
    @IBOutlet weak var horizontal_label_3: UILabel!
    @IBOutlet weak var confirmNewPassword_hideShow_button: UIButton!
    @IBOutlet weak var eightCharacter_Activity_button: UIButton!
    @IBOutlet weak var upperLowerCase_Activity_button: UIButton!
    @IBOutlet weak var oneNumber_Activity_button: UIButton!
    @IBOutlet weak var eightCharacter_heading_Label: UILabel!
    @IBOutlet weak var upperLowerCase_heading_label: UILabel!
    @IBOutlet weak var oneNumber_heading_label: UILabel!
    @IBOutlet weak var savesChanges_view: UIView!
    @IBOutlet weak var saveChanges_button: UIButton!
    @IBOutlet weak var cancleButton_view: UIView!
    @IBOutlet weak var cancle_button: UIButton!
    @IBOutlet weak var passwordCombination_view: UIView!
    
    var iconClick = true
    var changePasswordNew = changePasswordInfo()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ChangePasswordVC_UI()
        
        self.oldPassword_textfield.delegate = self
        self.newPassword_textfield.delegate = self
        self.confirmNewPassword_textfield.delegate = self
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
    
    // MARK:- TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == oldPassword_textfield
        {
            oldPassword_textfield.backgroundColor = UIColor.clear
        }
        else if textField == newPassword_textfield
        {
            newPassword_textfield.backgroundColor = UIColor.clear
        }
        else if textField == confirmNewPassword_textfield
        {
            confirmNewPassword_textfield.backgroundColor = UIColor.clear
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == oldPassword_textfield
        {
            oldPassword_textfield.resignFirstResponder()
        }
        else if textField == newPassword_textfield
        {
            newPassword_textfield.resignFirstResponder()
        }
        else if textField == confirmNewPassword_textfield
        {
            confirmNewPassword_textfield.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == oldPassword_textfield
        {
            self.changePasswordNew.oldPassword = oldPassword_textfield.text!
        }
        else if textField == newPassword_textfield
        {
            self.changePasswordNew.NewPassword = newPassword_textfield.text!
        }
        else if textField == confirmNewPassword_textfield
        {
            self.changePasswordNew.ConfirmPassword = confirmNewPassword_textfield.text!
        }
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if changePasswordNew.oldPassword.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Old Password", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if changePasswordNew.NewPassword.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter New Password", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if changePasswordNew.ConfirmPassword.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter Confirm Password", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else
        {
            isFieldVerified = true
        }
        return isFieldVerified
    }
    
    @IBAction func oldPasswordHideShowButton_Action(_ sender: Any)
    {
        if(iconClick == true)
        {
            oldPassword_textfield.isSecureTextEntry = false
            let image = UIImage(named: "ic_eye_open")
            oldPassword_hideShow_button.setImage(image, for: .normal)
            
        }
        else
        {
            oldPassword_textfield.isSecureTextEntry = true
            let image = UIImage(named: "ic_eye_closed")
            oldPassword_hideShow_button.setImage(image, for: .normal)
        }
        
        iconClick = !iconClick
    }
    
    @IBAction func newPasswordHideShowButton_Action(_ sender: Any)
    {
        if(iconClick == true)
        {
            newPassword_textfield.isSecureTextEntry = false
            let image = UIImage(named: "ic_eye_open")
            newPassword_hideShow_button.setImage(image, for: .normal)
            
        }
        else
        {
            newPassword_textfield.isSecureTextEntry = true
            let image = UIImage(named: "ic_eye_closed")
            newPassword_hideShow_button.setImage(image, for: .normal)
        }
        
        iconClick = !iconClick
    }
    
    @IBAction func confirmNewPasswordHideShowButton_Action(_ sender: Any)
    {
        if(iconClick == true)
        {
            confirmNewPassword_textfield.isSecureTextEntry = false
            let image = UIImage(named: "ic_eye_open")
            confirmNewPassword_hideShow_button.setImage(image, for: .normal)
            
        }
        else
        {
            confirmNewPassword_textfield.isSecureTextEntry = true
            let image = UIImage(named: "ic_eye_closed")
            confirmNewPassword_hideShow_button.setImage(image, for: .normal)
        }
        
        iconClick = !iconClick
    }
    
    @IBAction func eightCharacterButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func upperLowerCaseButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func oneNumberButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func saveChangesButton_Action(_ sender: Any)
    {
        if isAllFieldVerified()
        {
            callServiceToChangePassword()
        }
    }
    
    @IBAction func cancelButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: SERVICE FOR UPDATE EMAIL
    func callServiceToChangePassword()
    {
        let params:[String:AnyObject] = [changePasswordApiParameter.apiName:changePasswordNew.apiName as AnyObject,
                                         changePasswordApiParameter.new_password:changePasswordNew.NewPassword as AnyObject,
                                         changePasswordApiParameter.email:UserDefaults.standard.string(forKey: "PATIENT_EMAILID") as AnyObject,
                                         changePasswordApiParameter.old_password:changePasswordNew.oldPassword as AnyObject,
                                         changePasswordApiParameter.token:UserDefaults.standard.string(forKey: "TOKEN") as AnyObject]
        print(params)
        SVProgressHUD.show()
        Alamofire.request(ApiGet.baseURL, method: .post, parameters: params, encoding:URLEncoding.httpBody) 
            .responseJSON{
                response in
                print(response)
                SVProgressHUD.dismiss()
                if let value = response.result.value as AnyObject?
                {
                    //let json = JSON(response.result.value!)
                    let status = value.object(forKey: "status") as! Int
                    let message = value.object(forKey: "message") as! String
                    if (status==200)
                    {
                        KSToastView.ks_showToast(message, duration: 3.0)
                        self.dismiss(animated: true, completion: nil)
                    }
                    else
                    {
                        KSToastView.ks_showToast(message, duration: 3.0)
                    }
                }
                else
                {
                    self.present(UIAlertController.alertWithTitle(title: "Connection Error!", message: "Internet connection appears to be offline. Please check your internet connection", buttonTitle: "OK"), animated: true, completion: nil)
                }
        }
    }
    
    
}
