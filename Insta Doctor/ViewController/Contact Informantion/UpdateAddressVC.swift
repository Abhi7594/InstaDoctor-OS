//
//  UpdateAddressVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 06/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class UpdateAddressVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var updateYourAddressHeading_Label: UILabel!
    @IBOutlet weak var address_heading_label: UILabel!
    @IBOutlet weak var address_textField: UITextField!
    @IBOutlet weak var horizontal_label_1: UILabel!
    @IBOutlet weak var address_two_heading_label: UILabel!
    @IBOutlet weak var address_two_textField: UITextField!
    @IBOutlet weak var horizontal_label_2: UILabel!
    @IBOutlet weak var city_heading_label: UILabel!
    @IBOutlet weak var city_textField: UITextField!
    @IBOutlet weak var horizontal_label_3: UILabel!
    @IBOutlet weak var state_heading_label: UILabel!
    @IBOutlet weak var state_textField: UITextField!
    @IBOutlet weak var downArrowButton: UIButton!
    @IBOutlet weak var zipCode_heading_label: UILabel!
    @IBOutlet weak var zipCode_textField: UITextField!
    @IBOutlet weak var horizontal_label_4: UILabel!
    @IBOutlet weak var horizontal_label_5: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var addressModel = updateAddressInfo()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        UpdateAddressVC_UI()
        
        self.backButton.isHidden = true
        
        self.address_textField.delegate = self
        self.address_two_textField.delegate = self
        self.city_textField.delegate = self
        self.state_textField.delegate = self
        self.zipCode_textField.delegate = self
        
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        
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
        if textField == address_textField
        {
            address_textField.backgroundColor = UIColor.clear
        }
        else if textField == address_two_textField
        {
            address_two_textField.backgroundColor = UIColor.clear
        }
        else if textField == city_textField
        {
            city_textField.backgroundColor = UIColor.clear
        }
        else if textField == state_textField
        {
            state_textField.backgroundColor = UIColor.clear
        }
        else if textField == zipCode_textField
        {
            zipCode_textField.backgroundColor = UIColor.clear
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == address_textField
        {
            address_textField.resignFirstResponder()
        }
        else if textField == address_two_textField
        {
            address_two_textField.resignFirstResponder()
        }
        else if textField == city_textField
        {
            city_textField.resignFirstResponder()
        }
        else if textField == state_textField
        {
            state_textField.resignFirstResponder()
        }
        else if textField == zipCode_textField
        {
            zipCode_textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if textField == address_textField
        {
            self.addressModel.address = address_textField.text!
            contactInfo_updatedAddress = address_textField.text!
        }
        else if textField == address_two_textField
        {
            self.addressModel.address2 = address_two_textField.text!
            contactInfo_updatedAddress2 = address_two_textField.text!
        }
        else if textField == city_textField
        {
            self.addressModel.city = city_textField.text!
            contactInfo_updatedCity = city_textField.text!
        }
        else if textField == state_textField
        {
            self.addressModel.state = state_textField.text!
            contactInfo_updatedState = state_textField.text!
        }
        else if textField == zipCode_textField
        {
            self.addressModel.zipcode = zipCode_textField.text!
            contactInfo_updatedZipcode = zipCode_textField.text!
        }
    }
    
    // MARK:- Validations
    func isAllFieldVerified() -> Bool
    {
        var isFieldVerified = false
        
        if addressModel.address.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Address", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if addressModel.address2.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your Address", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if addressModel.city.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your city", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if addressModel.state.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your state", buttonTitle: "OK"), animated: true, completion: nil)
        }
        else if addressModel.zipcode.count == 0
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "Please enter your zipcode", buttonTitle: "OK"), animated: true, completion: nil)
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

    @IBAction func saveButton_Action(_ sender: Any)
    {
        if isAllFieldVerified()
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func downArrowButton_Action(_ sender: Any)
    {
        
    }
    
}
