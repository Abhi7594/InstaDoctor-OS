//
//  SignupVC.swift
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

class SignupVC: UIViewController {

    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var male_female_view: UIView!
    @IBOutlet weak var male_view: UIView!
    @IBOutlet weak var female_view: UIView!
    @IBOutlet weak var men_icon_imageView: UIImageView!
    @IBOutlet weak var men_label: UILabel!
    @IBOutlet weak var female_icon_imageView: UIImageView!
    @IBOutlet weak var female_label: UILabel!
    @IBOutlet weak var selectMale_button: UIButton!
    @IBOutlet weak var selectFemale_Button: UIButton!
    @IBOutlet weak var signup_form_view: UIView!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var horizontal_Label_4: UILabel!
    @IBOutlet weak var name_Textfield: UITextField!
    @IBOutlet weak var emailAddress_Label: UILabel!
    @IBOutlet weak var horizontal_Label_1: UILabel!
    @IBOutlet weak var emailAddress_Textfield: UITextField!
    @IBOutlet weak var dateOfBirth_Label: UILabel!
    @IBOutlet weak var horizontal_Label_2: UILabel!
    @IBOutlet weak var dateOfBirth_textfield: UITextField!
    @IBOutlet weak var password_label: UILabel!
    @IBOutlet weak var horizontal_Label_3: UILabel!
    @IBOutlet weak var password_Textfield: UITextField!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var termsCondition_label: UILabel!
    @IBOutlet weak var termsCondition_view: UIView!
    @IBOutlet weak var createAccount_view: UIView!
    @IBOutlet weak var createAccount_Button: UIButton!
    @IBOutlet weak var signin_View: UIView!
    @IBOutlet weak var already_label: UILabel!
    @IBOutlet weak var signinButton: UIButton!
    
    var male_female = ""
    
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
        
        SignupVC_UI()
        
        //createGradientLayer()
        
        emailAddress_Textfield.delegate = self
        name_Textfield.delegate = self
        password_Textfield.delegate = self
        dateOfBirth_textfield.delegate = self
        
        self.dateOfBirth_textfield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        
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
    
    //MARK: Datepicker Done Button Method
    @objc func tapDone()
    {
        if let datePicker = self.dateOfBirth_textfield.inputView as? UIDatePicker
        {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            dateformatter.dateFormat = "yyyy-mm-d"
            self.dateOfBirth_textfield.text = dateformatter.string(from: datePicker.date)
        }
        self.dateOfBirth_textfield.resignFirstResponder()
    }
    
    //MARK:- create gradient color code
    func createGradientLayer()
    {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor(hex: "05DAAA"), UIColor(hex: "089675")]
        
        self.createAccount_Button.layer.addSublayer(gradientLayer)
    }
    
    // MARK:- TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == emailAddress_Textfield
        {
            emailAddress_Textfield.backgroundColor = UIColor.clear
        }
        else if textField == password_Textfield
        {
            password_Textfield.backgroundColor = UIColor.clear
        }
        else if textField == dateOfBirth_textfield
        {
            dateOfBirth_textfield.backgroundColor = UIColor.clear
        }
        else if textField == name_Textfield
        {
            name_Textfield.backgroundColor = UIColor.clear
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == emailAddress_Textfield
        {
            self.userDetails.userEmailID = emailAddress_Textfield.text!.lowercased()
            emailAddress_Textfield.keyboardType = .emailAddress
            emailAddress_Textfield.returnKeyType = .next
            emailAddress_Textfield.autocapitalizationType = .words
        }
        else if textField == password_Textfield
        {
            self.userDetails.userPassword = password_Textfield.text!
            password_Textfield.keyboardType = .default
            password_Textfield.isSecureTextEntry = true
            password_Textfield.returnKeyType = .next
            password_Textfield.autocapitalizationType = .words
        }
        else if textField == dateOfBirth_textfield
        {
            self.userDetails.user_dateofBirth = dateOfBirth_textfield.text!
            dateOfBirth_textfield.keyboardType = .default
            dateOfBirth_textfield.returnKeyType = .next
            dateOfBirth_textfield.autocapitalizationType = .allCharacters
        }
        else if textField == name_Textfield
        {
            self.userDetails.userName = name_Textfield.text!
            name_Textfield.keyboardType = .default
            name_Textfield.returnKeyType = .next
            name_Textfield.autocapitalizationType = .words
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == emailAddress_Textfield
        {
            emailAddress_Textfield.resignFirstResponder()
        }
        else if textField == password_Textfield
        {
            password_Textfield.resignFirstResponder()
        }
        else if textField == dateOfBirth_textfield
        {
            dateOfBirth_textfield.resignFirstResponder()
        }
        else if textField == name_Textfield
        {
            name_Textfield.resignFirstResponder()
        }
        return true
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if userDetails.userEmailID.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Email Address", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if userDetails.user_dateofBirth.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter Date Of Birth", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if userDetails.userName.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter Patient Name", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if userDetails.userPassword.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter Password", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else
        {
            isFieldVerified = true
        }
        return isFieldVerified
    }
    
    //MARK: Button Action
    @IBAction func signinButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createAccountButton_Action(_ sender: Any)
    {
        if isAllFieldVerified()
        {
            callWebServiceToSignUp()
        }
    }
    
    @IBAction func agreeButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func selectMaleButton_Action(_ sender: Any)
    {
        male_view.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
        female_view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        self.male_female = "Male"
    }
    
    @IBAction func selectFemaleButton_Action(_ sender: Any)
    {
        male_view.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
        male_view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        self.male_female = "Female"
    }
    
    //MARk:- call webservices to signup api
    func callWebServiceToSignUp()
    {
        let params:[String:AnyObject] = [SignupApiParameter.PatientName:userDetails.userName as AnyObject,
                                         SignupApiParameter.PatientEmail:userDetails.userEmailID as AnyObject,
                                         SignupApiParameter.patientPassword:userDetails.userPassword as AnyObject,
                                         SignupApiParameter.patientGender:male_female as AnyObject,
                                         SignupApiParameter.patientDOB:userDetails.user_dateofBirth as AnyObject,
                                         SignupApiParameter.deviceID:UIDevice.current.identifierForVendor!.uuidString as AnyObject,
                                         SignupApiParameter.deviceType:"IPhone" as AnyObject,
                                         SignupApiParameter.roleID:userDetails.role_id as AnyObject,
                                         SignupApiParameter.apiName:userDetails.user_ApiName as AnyObject]
        print(params)
        SVProgressHUD.show()
        
        Alamofire.request(ApiGet.baseURL, method: .post, parameters: params, encoding:URLEncoding.httpBody)
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
                        
                        self.userDetails.userEmailID = json["data"]["patient_email"].string!
                        self.userDetails.userName = json["data"]["patient_name"].string!
                        self.userDetails.token = json["data"]["token"].string!
                        
                        UserDefaults.standard.set(self.userDetails.userEmailID, forKey: "PATIENT_EMAILID")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.userDetails.userName, forKey: "PATIENT_NAME")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.userDetails.token, forKey: "TOKEN")
                        UserDefaults.standard.synchronize()
                        
                        self.switchToNext()
                        print("Login Sucess \(json["data"]["token"].string!)")
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
        
        /*let paramDict = NSMutableDictionary()
        
        paramDict[SignupApiParameter.PatientName] = userDetails.userName
        paramDict[SignupApiParameter.PatientEmail] = userDetails.userEmailID
        paramDict[SignupApiParameter.patientPassword] = userDetails.userPassword
        paramDict[SignupApiParameter.patientGender] = male_female
        paramDict[SignupApiParameter.patientDOB] = userDetails.user_dateofBirth
        paramDict[SignupApiParameter.deviceID] = UIDevice.current.identifierForVendor!.uuidString
        paramDict[SignupApiParameter.deviceType] = "IPhone"
        paramDict[SignupApiParameter.roleID] = userDetails.role_id
        paramDict[SignupApiParameter.apiName] = userDetails.user_ApiName
       
        print(paramDict)
        print(ApiGet.baseURL)
        SVProgressHUD.show()
        
        //self.view.isUserInteractionEnabled = false
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        ServiceHelper.sharedInstance.callAPIWithParameters(paramDict, method: .post, apiName: ApiGet.baseURL, hudType: .default) { (result: AnyObject?, error: NSError?, authVerified: Bool?, internet: Bool?) in
            
            SVProgressHUD.dismiss()
            //self.view.isUserInteractionEnabled = true
            
            if internet == true
            {
                if authVerified == true
                {
                    if error == nil
                    {
                        print("result>>>>>>>>>>>>>>>>>>>", result!)
                        
                        let status = result!["status"] as? String ?? ""
                        let message = result!["message"] as? String ?? ""
                        
                        if status == "200"
                        {
                            //let dataArray = result!["data"] as? NSMutableArray
                            let datadict = result!["data"] as? NSDictionary
                            self.userDetails.userName = datadict!["patient_name"] as? String ?? ""
                            self.userDetails.userEmailID = datadict!["patient_email"] as? String ?? ""
                            self.userDetails.token = datadict!["token"] as? String ?? ""
                            /*for data in dataArray!
                            {
                                let dataDict = data as? Dictionary<String, AnyObject>
                                
                                //self.userDetails.user_ID = dataDict!["_id"] as? String ?? ""
                                self.userDetails.userName = dataDict!["patient_name"] as? String ?? ""
                                self.userDetails.userEmailID = dataDict!["patient_email"] as? String ?? ""
                                self.userDetails.token = dataDict!["token"] as? String ?? ""
                            }*/
                            /*
                            UserDefaults.standard.set(self.userDetails.user_ID, forKey: "USERID")
                            UserDefaults.standard.synchronize()
                            
                            UserDefaults.standard.set(self.userDetails.userGender, forKey: "USER_GENDER")
                            UserDefaults.standard.synchronize()
                            
                            UserDefaults.standard.set(self.userDetails.user_dateofBirth, forKey: "USER_DOB")
                            UserDefaults.standard.synchronize()
                            */
                            UserDefaults.standard.set(self.userDetails.userEmailID, forKey: "USER_EMAILID")
                            UserDefaults.standard.synchronize()
                            
                            UserDefaults.standard.set(self.userDetails.userName, forKey: "USER_NAME")
                            UserDefaults.standard.synchronize()
                            
                            UserDefaults.standard.set(self.userDetails.token, forKey: "USER_SIGNUP_TOKEN")
                            UserDefaults.standard.synchronize()
                            
                            ServiceHelper.sharedInstance.tempEmail = self.userDetails.userEmailID
                            
                            print("ServiceHelper.sharedInstance.tempEmail", ServiceHelper.sharedInstance.tempEmail)
                            
                            self.switchToNext()
                        }
                        else if status == "100"
                        {
                            KSToastView.ks_showToast(message, duration: 3.0)
                        }
                        else if status == "0"
                        {
                            KSToastView.ks_showToast(message, duration: 3.0)
                        }
                    }
                    else
                    {
                        print(error!.localizedDescription)
                    }
                }
                else
                {
                    self.present(UIAlertController.alertWithTitle(title: "Authentication", message: "Authentication verification failed.", buttonTitle: "OK"), animated: true, completion: nil)
                }
            }
            else
            {
                self.present(UIAlertController.alertWithTitle(title: "Connection Error!", message: "Internet connection appears to be offline. Please check your internet connection", buttonTitle: "OK"), animated: true, completion: nil)
            }
        }*/
    }
    
    //MARK: MOVE TO NEXT CONTYROLLER FUNCTION
    func switchToNext()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhoIsVisitForVC") as! WhoIsVisitForVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector)
    {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel()
    {
        self.resignFirstResponder()
    }
    
}
