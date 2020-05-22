//
//  UpdateEmailConfirmationVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 06/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AlamofireObjectMapper
import SwiftyJSON

class UpdateEmailConfirmationVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var updateEmailConfirmation_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var confirmPassword_textField: UITextField!
    @IBOutlet weak var password_label: UILabel!
    @IBOutlet weak var verifyPasswordButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    var iconClick = true
    
    var updateContact = updateContactInfo()
    
    var updatedEmail = ""
    var updatedPhone = ""
    var updatedAddress = ""
    var updatedAddress2 = ""
    var updatedCity = ""
    var updatedState = ""
    var updatedZipcode = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        UpdateEmailConfirmationVC_UI()
        
        self.backButton.isHidden = true
        
        self.confirmPassword_textField.delegate = self
        self.confirmPassword_textField.isSecureTextEntry = true
        
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        //MARK: Clear Almofire Cache
        URLCache.shared.removeAllCachedResponses()
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache?.removeAllCachedResponses()
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        // 2. add the gesture recognizer to a view
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer)
    {
        self.dismiss(animated: true, completion: nil)
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
        if textField == confirmPassword_textField
        {
            confirmPassword_textField.backgroundColor = UIColor.clear
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == confirmPassword_textField
        {
            confirmPassword_textField.resignFirstResponder()
        }
       
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == confirmPassword_textField
        {
            self.updateContact.password = confirmPassword_textField.text!.lowercased()
        }
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if updateContact.password.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Password", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else
        {
            isFieldVerified = true
        }
        return isFieldVerified
    }
    
    //MARK: Button Action first view
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func verifyPasswordButton_Action(_ sender: Any)
    {
        //self.dismiss(animated: true, completion: nil)
        if isAllFieldVerified()
        {
            saveInformationServices()
        }
    }
    
    @IBAction func showPasswordButton_Action(_ sender: Any)
    {
        if(iconClick == true)
        {
            confirmPassword_textField.isSecureTextEntry = false
            let image = UIImage(named: "ic_eye_open")
            showPasswordButton.setImage(image, for: .normal)
            
        }
        else
        {
            confirmPassword_textField.isSecureTextEntry = true
            let image = UIImage(named: "ic_eye_closed")
            showPasswordButton.setImage(image, for: .normal)
        }
        
        iconClick = !iconClick
    }
    
    //MARK: SERVICE FOR UPDATE EMAIL
    func saveInformationServices()
    {
        let params:[String:AnyObject] = [saveContactInformationApiParameter.apiName:updateContact.apiName as AnyObject,
                                         saveContactInformationApiParameter.email:updatedEmail as AnyObject,
                                         saveContactInformationApiParameter.old_email:UserDefaults.standard.string(forKey: "PATIENT_EMAILID") as AnyObject,
                                         saveContactInformationApiParameter.address:updatedAddress as AnyObject,
                                         saveContactInformationApiParameter.address2:updatedAddress2 as AnyObject,
                                         saveContactInformationApiParameter.city:updatedCity as AnyObject,
                                         saveContactInformationApiParameter.state:updatedState as AnyObject,
                                         saveContactInformationApiParameter.zipcode:updatedZipcode as AnyObject,
                                         saveContactInformationApiParameter.password:updateContact.password as AnyObject,
                                         saveContactInformationApiParameter.phone:updatedPhone as AnyObject,
                                         saveContactInformationApiParameter.token:UserDefaults.standard.string(forKey: "TOKEN") as AnyObject]
        print(params)
        SVProgressHUD.show()
        Alamofire.request(ApiGet.baseURL, method: .get, parameters: params, encoding:URLEncoding.default) 
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

