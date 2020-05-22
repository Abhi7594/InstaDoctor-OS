//
//  LoginVC.swift
//
//  Created by Abhishek Rathod on 21/12/19.
//  Copyright © 2019 Soft Gates. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AlamofireObjectMapper
import SwiftyJSON

var dismissIt = Bool()
class LoginVC: UIViewController {

    @IBOutlet weak var container_View: UIView!
    @IBOutlet weak var imageSlider_View: UIView!
    @IBOutlet weak var slider_ImageView: UIImageView!
    @IBOutlet weak var login_View: UIView!
    @IBOutlet weak var emailAddress_Label: UILabel!
    @IBOutlet weak var horizantalLine_1_Label: UILabel!
    @IBOutlet weak var email_TextField: UITextField!
    @IBOutlet weak var password_Label: UILabel!
    @IBOutlet weak var horizantalLine_2_Label: UILabel!
    @IBOutlet weak var password_textField: UITextField!
    @IBOutlet weak var login_Button: UIButton!
    @IBOutlet weak var signup_View: UIView!
    @IBOutlet weak var createAccount_Button: UIButton!
    @IBOutlet weak var forgotPassword_Button: UIButton!
    @IBOutlet weak var dontAccount_label: UILabel!
    @IBOutlet weak var socialMediaSignin_Label: UILabel!
    @IBOutlet weak var socialMedia_View: UIView!
    @IBOutlet weak var facebook_View: UIView!
    @IBOutlet weak var facebook_Label: UILabel!
    @IBOutlet weak var facebook_imageView: UIImageView!
    @IBOutlet weak var facebookLogin_button: UIButton!
    @IBOutlet weak var google_view: UIView!
    @IBOutlet weak var google_ImageView: UIImageView!
    @IBOutlet weak var google_Label: UILabel!
    @IBOutlet weak var googleLogin_button: UIButton!
    
    var gradientLayer: CAGradientLayer!
    
    var isRememberMeSelected = Bool()
    var isSelected = Bool()
    
    var LoginUserInfo = LoginUser_Info()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        login_UI()
        
        createGradientLayer()
        
        self.email_TextField.delegate = self
        self.password_textField.delegate = self
        self.password_textField.isSecureTextEntry = true
        
        //MARK: Clear Almofire Cache
        URLCache.shared.removeAllCachedResponses()
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache?.removeAllCachedResponses()
        
        
        //MARK: Calling Corner Radius from Top
        self.roundCorners(view: imageSlider_View, corners: [.bottomLeft, .bottomRight], radius: 45.0)

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        //return.default
        return.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        createGradientLayer()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK:- create gradient color code
    func createGradientLayer()
    {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor(hex: "05DAAA"), UIColor(hex: "089675")]
        
        self.login_Button.layer.addSublayer(gradientLayer)
    }
    
    //MARK:- Corner Radius of only two side of UIViews
    func roundCorners(view :UIView, corners: UIRectCorner, radius: CGFloat)
    {
        let path = UIBezierPath(roundedRect: imageSlider_View.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    // MARK:- TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
         if textField == email_TextField
        {
            email_TextField.backgroundColor = UIColor.white
        }
        else if textField == password_textField
        {
            password_textField.backgroundColor = UIColor.white
        }
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == email_TextField
        {
            LoginUserInfo.userEmailID = email_TextField.text!.lowercased()
        }
        else if textField == password_textField
        {
            LoginUserInfo.userPassword = password_textField.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == email_TextField
        {
            email_TextField.resignFirstResponder()
        }
        else if textField == password_textField
        {
            password_textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if LoginUserInfo.userEmailID.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Email Address", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if LoginUserInfo.userPassword.count == 0
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

    @IBAction func login_Button_Action(_ sender: Any)
    {
        self.view.endEditing(true)
        
        if isAllFieldVerified()
        {
            callWebServiceToLogin()
        }
    }
    
    @IBAction func createAccount_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotPassword_button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func facebookLogin_Button_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func googleLogin_Button_Action(_ sender: Any)
    {
        
    }
    
    
    // MARK:- Web Service API Methods
    func callWebServiceToLogin()
    {
        let params:[String:AnyObject] = [LoginApiParameter.PatientEmail:LoginUserInfo.userEmailID as AnyObject,
                                         LoginApiParameter.patientPassword:LoginUserInfo.userPassword as AnyObject,
                                         LoginApiParameter.deviceID:UIDevice.current.identifierForVendor!.uuidString as AnyObject,
                                         LoginApiParameter.roleID:LoginUserInfo.role_id as AnyObject,
                                         LoginApiParameter.apiName:LoginUserInfo.user_ApiName as AnyObject]
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
                        
                        self.LoginUserInfo.userEmailID = json["data"]["patient_email"].string!
                        self.LoginUserInfo.userName = json["data"]["patient_name"].string!
                        self.LoginUserInfo.token = json["data"]["token"].string!
                        self.LoginUserInfo.userGender = json["data"]["patient_gender"].string!
                        self.LoginUserInfo.user_dateofBirth = json["data"]["patient_dob"].string!
                        self.LoginUserInfo.deviceID = json["data"]["device_id"].string!
                        self.LoginUserInfo.patient_id = json["data"]["patient_id"].string!
                        
                        UserDefaults.standard.set(self.LoginUserInfo.userEmailID, forKey: "PATIENT_EMAILID")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.userName, forKey: "PATIENT_NAME")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.token, forKey: "TOKEN")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.userGender, forKey: "PATIENT_GENDER")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.user_dateofBirth, forKey: "PATIENT_DOB")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.deviceID, forKey: "PATIENT_DEVICE_ID")
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(self.LoginUserInfo.patient_id, forKey: "PATIENT_ID")
                        UserDefaults.standard.synchronize()
                        
                        self.switchToDashboard()
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
        
        paramDict[LoginApiParameter.apiName] = LoginUserInfo.user_ApiName
        paramDict[LoginApiParameter.PatientEmail] = LoginUserInfo.userEmailID
        paramDict[LoginApiParameter.patientPassword] = LoginUserInfo.userPassword
        //paramDict[LoginApiParameter.token] = ""
        //paramDict[LoginApiParameter.deviceType] = "IPhone"
        paramDict[LoginApiParameter.deviceID] = UIDevice.current.identifierForVendor!.uuidString
        
        print(paramDict)
        
        SVProgressHUD.show()
        //self.view.isUserInteractionEnabled = false
        
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
                            let dataArray = result!["data"] as? NSMutableArray
                            
                            for data in dataArray!
                            {
                                let dataDict = data as! Dictionary<String, AnyObject>
                                
                                self.LoginUserInfo.userEmailID = dataDict[""] as? String ?? ""
                                self.LoginUserInfo.user_dateofBirth = dataDict[""] as? String ?? ""
                                self.LoginUserInfo.userName = dataDict[""] as? String ?? ""
                                self.LoginUserInfo.userGender = dataDict[""] as? String ?? ""
                                self.LoginUserInfo.token = dataDict[""] as? String ?? ""
                                self.LoginUserInfo.user_ID = dataDict[""] as? String ?? ""
                            }
                           
                                UserDefaults.standard.set(true, forKey: "LOGGED_IN")
                                UserDefaults.standard.synchronize()
                                
                                UserDefaults.standard.set(self.LoginUserInfo.user_ID, forKey: "")
                            
                                UserDefaults.standard.set(self.LoginUserInfo.userEmailID, forKey: "USER_EMAILID")
                                UserDefaults.standard.synchronize()
                            
                                UserDefaults.standard.set(self.LoginUserInfo.userGender, forKey: "USER_GENDER")
                                UserDefaults.standard.synchronize()
                            
                                UserDefaults.standard.set(self.LoginUserInfo.user_dateofBirth, forKey: "USER_DOB")
                                UserDefaults.standard.synchronize()
                            
                                UserDefaults.standard.set(self.LoginUserInfo.userPassword, forKey: "USER_PASSWORD")
                                UserDefaults.standard.synchronize()
                            
                                UserDefaults.standard.set(self.LoginUserInfo.userName, forKey: "USER_NAME")
                                UserDefaults.standard.synchronize()
                            
                                self.switchToDashboard()
                            
                                self.dismiss(animated: true, completion: nil)
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
    
    //MARK: Switch to Dashboard
    func switchToDashboard()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhoIsVisitForVC") as! WhoIsVisitForVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
