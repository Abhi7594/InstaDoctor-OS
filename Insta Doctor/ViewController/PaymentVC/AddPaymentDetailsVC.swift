//
//  AddPaymentDetailsVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class AddPaymentDetailsVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addPaymentMethodHeading_view: UIView!
    @IBOutlet weak var addPaymentMethodHeading_label: UILabel!
    @IBOutlet weak var creditCardContainer_view: UIView!
    @IBOutlet weak var creditcard_view: UIView!
    @IBOutlet weak var scanCard_view: UIView!
    @IBOutlet weak var creditCardNumber_view: UIView!
    @IBOutlet weak var expirtCCV_view: UIView!
    @IBOutlet weak var addCreditCardButton_view: UIView!
    @IBOutlet weak var addCreditCard_Button: UIButton!
    @IBOutlet weak var scanYourCard_Label: UILabel!
    @IBOutlet weak var scanYourCardImage_imageView: UIImageView!
    @IBOutlet weak var scanYourCardButton: UIButton!
    @IBOutlet weak var cardExpirationHeading_Label: UILabel!
    @IBOutlet weak var card_expiryDate_textField: UITextField!
    @IBOutlet weak var horizontal_label_2: UILabel!
    @IBOutlet weak var ccv_heading_label: UILabel!
    @IBOutlet weak var ccv_textfield: UITextField!
    @IBOutlet weak var horizontal_label_3: UILabel!    
    @IBOutlet weak var cardHolderName_textField: UITextField!
    @IBOutlet weak var CreditCardView_ccv_textfield: UITextField!
    @IBOutlet weak var creditCard_AccountNumber_textField_1: UITextField!
    @IBOutlet weak var creditCard_Accountnumber_textField_2: UITextField!
    @IBOutlet weak var creditCardView_AccountNumber_textField_3: UITextField!
    @IBOutlet weak var creditCardView_textField_4: UITextField!
    @IBOutlet weak var enterCreditCardNumber_label: UILabel!
    @IBOutlet weak var EnterCreditCard_AccountNumber_textField_1: UITextField!
    @IBOutlet weak var EnterCreditCard_AccountNumber_textField_2: UITextField!
    @IBOutlet weak var EnterCreditCard_AccountNumber_textField_3: UITextField!
    @IBOutlet weak var EnterCreditCard_AccountNumber_textField_4: UITextField!
    
    var datePicker : UIDatePicker!
    
    var isFromCreditCardList = Bool()
    
    var meetWaitingSchedule_value = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
        
    }
   
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        AddPaymentDetailsVC_UI()
        
        setCreditcardTextFieldPlaceHolder()
        
        creditCardEnterAccountNumberTextField_Action()
        
        creditCardViewTextField_DisableMethod()
        
        if isFromCreditCardList == true
        {
            self.addPaymentMethodHeading_label.text = "Edit Credit Card Details"
            self.addCreditCard_Button.setTitle("Add Credit Card", for: .normal)
        }
        else
        {
             self.addPaymentMethodHeading_label.text = "Add Payment Details"
            self.addCreditCard_Button.setTitle("Add Credit Card", for: .normal)
        }
        
        if meetWaitingSchedule_value == "1"
        {
            self.addPaymentMethodHeading_label.text = "Payment"
            self.addCreditCard_Button.setTitle("Pay now", for: .normal)
        }
        else if meetWaitingSchedule_value == "2"
        {
            self.addPaymentMethodHeading_label.text = "Payment"
            self.addCreditCard_Button.setTitle("Pay now", for: .normal)
        }
        else if meetWaitingSchedule_value == "3"
        {
            self.addPaymentMethodHeading_label.text = "Payment"
            self.addCreditCard_Button.setTitle("Pay now", for: .normal)
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
    
    //MARK: UIDATEPICKER METHOD
    func pickUpDate(_ textField : UITextField)
    {
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = .white
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.backgroundColor = #colorLiteral(red: 0.208106339, green: 0.5424117446, blue: 0.6805691123, alpha: 1)
        toolBar.tintColor = .white//UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddPaymentDetailsVC.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddPaymentDetailsVC.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    //MARK: UIDATEPICKER DONE ACTION
    @objc func doneClick()
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        card_expiryDate_textField.text = dateFormatter1.string(from: datePicker.date)
        card_expiryDate_textField.resignFirstResponder()
    }
    
    //MARK: UIDATEPICKER CANCLE ACTION
    @objc func cancelClick()
    {
        card_expiryDate_textField.resignFirstResponder()
    }
    
    //MARK: TEXTFIELD DALEGATES METHOD FOR DATE PICKER
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.pickUpDate(self.card_expiryDate_textField)
    }
    
    //MARK: CREDIT CARD VIEW TEXTFIELD PLACEHOLDER METHOD
    func setCreditcardTextFieldPlaceHolder()
    {
        cardHolderName_textField.attributedPlaceholder = NSAttributedString(string: "YOUR NAME",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        CreditCardView_ccv_textfield.attributedPlaceholder = NSAttributedString(string: "CCV",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        creditCard_AccountNumber_textField_1.attributedPlaceholder = NSAttributedString(string: "....",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        creditCard_Accountnumber_textField_2.attributedPlaceholder = NSAttributedString(string: "....",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        creditCardView_AccountNumber_textField_3.attributedPlaceholder = NSAttributedString(string: "....",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        creditCardView_textField_4.attributedPlaceholder = NSAttributedString(string: "....",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    //MARK: CREDIT CARD VIEW TEXTFIELD DISABLE METHOD
    func creditCardViewTextField_DisableMethod()
    {
        cardHolderName_textField.isUserInteractionEnabled = false
        CreditCardView_ccv_textfield.isUserInteractionEnabled = false
        creditCard_AccountNumber_textField_1.isUserInteractionEnabled = false
        creditCard_Accountnumber_textField_2.isUserInteractionEnabled = false
        creditCardView_AccountNumber_textField_3.isUserInteractionEnabled = false
        creditCardView_textField_4.isUserInteractionEnabled = false
    }
    
    //MARK: CREDIT CARD Enter Account Number TEXTFIELD Action METHOD
    func creditCardEnterAccountNumberTextField_Action()
    {
        EnterCreditCard_AccountNumber_textField_1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        EnterCreditCard_AccountNumber_textField_2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        EnterCreditCard_AccountNumber_textField_3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        EnterCreditCard_AccountNumber_textField_4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    //MARK: TEXTFIELD METHOD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        EnterCreditCard_AccountNumber_textField_1.resignFirstResponder()
        EnterCreditCard_AccountNumber_textField_2.resignFirstResponder()
        EnterCreditCard_AccountNumber_textField_3.resignFirstResponder()
        EnterCreditCard_AccountNumber_textField_4.resignFirstResponder()
    }
    
    //MARK: TextField Action Method
    @objc func textFieldDidChange(textField: UITextField)
    {
        let text = textField.text
        
        if text?.utf16.count == 4
        {
            switch textField
            {
            case EnterCreditCard_AccountNumber_textField_1:
                EnterCreditCard_AccountNumber_textField_2.becomeFirstResponder()
            case EnterCreditCard_AccountNumber_textField_2:
                EnterCreditCard_AccountNumber_textField_3.becomeFirstResponder()
            case EnterCreditCard_AccountNumber_textField_3:
                EnterCreditCard_AccountNumber_textField_4.becomeFirstResponder()
            case EnterCreditCard_AccountNumber_textField_4:
                EnterCreditCard_AccountNumber_textField_4.resignFirstResponder()
            default:
                break
            }
        }
        else
        {
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let maxLength = 3
        let currentString: NSString = ccv_textfield.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        self.ccv_textfield.resignFirstResponder()
    }
    
    
    //MARK: Button Action
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func scanYourCardButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func addCreditCardButton_Action(_ sender: Any)
    {
        if meetWaitingSchedule_value == "1"
        {
            /*let alertController = UIAlertController(title: "", message: "Payment Sccessfully Completed", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            { (action:UIAlertAction!) in
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThankYouOne") as! ThankYouOne
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)*/
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThankYouTwo") as! ThankYouTwo
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if meetWaitingSchedule_value == "2"
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThankYouOne") as! ThankYouOne
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if meetWaitingSchedule_value == "3"
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThankYouThree") as! ThankYouThree
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
