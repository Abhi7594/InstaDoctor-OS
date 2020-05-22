


import Foundation
import UIKit
import Alamofire

//MARK: LoginVC DESIGN & UI
extension LoginVC
{
    func login_UI()
    {
        self.view.backgroundColor = .clear
        self.container_View.backgroundColor = .white
        //self.imageSlider_View.backgroundColor = .clear
        self.login_View.backgroundColor = .clear
        self.signup_View.backgroundColor = .clear
        self.socialMedia_View.backgroundColor = .clear
        self.createAccount_Button.backgroundColor = .clear
        self.forgotPassword_Button.backgroundColor = .clear
        self.facebookLogin_button.backgroundColor = .clear
        self.googleLogin_button.backgroundColor = .clear
        self.slider_ImageView.backgroundColor = .clear
        
        //MARK: Make UI Corner Radius from top
        /*if let StatusbarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
        {
            StatusbarView.backgroundColor = Color.statusBarColor
        }*/
        
        email_TextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        password_textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        
        self.google_Label.font = UIFont.appRegularFontWith(size: 16)
        self.facebook_Label.font = UIFont.appRegularFontWith(size: 16)
        self.emailAddress_Label.font = UIFont.appRegularFontWith(size: 16)
        self.password_textField.font = UIFont.appRegularFontWith(size: 16)
        self.socialMediaSignin_Label.font = UIFont.appRegularFontWith(size: 14)
        
        login_Button.layer.cornerRadius = 25.0
        login_Button.clipsToBounds = true
        login_Button.layer.shadowColor = UIColor.lightText.cgColor
        login_Button.layer.shadowOffset = CGSize(width: 5, height: 5)
        login_Button.layer.shadowRadius = 5
        login_Button.layer.shadowOpacity = 1.0
        
        facebook_View.layer.cornerRadius = 15.0
        facebook_View.clipsToBounds = true
        
        google_view.layer.cornerRadius = 15.0
        google_view.clipsToBounds = true
        
    }
}

//MARK: SignupVC DESIGN & UI
extension SignupVC
{
    func SignupVC_UI()
    {
        self.view.backgroundColor = .clear
        self.container_view.backgroundColor = .white
        self.createAccount_view.backgroundColor = .clear
        self.male_female_view.backgroundColor = .clear
        self.createAccount_Button.backgroundColor = .clear
        self.termsCondition_view.backgroundColor = .clear
        self.signin_View.backgroundColor = .clear
        
        male_view.layer.cornerRadius = 10.0
        male_view.clipsToBounds = true
        
        female_view.layer.cornerRadius = 10.0
        female_view.clipsToBounds = true
        
        createAccount_Button.layer.cornerRadius = 20.0
        createAccount_Button.clipsToBounds = true
        createAccount_Button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        createAccount_Button.layer.shadowColor = UIColor.lightText.cgColor
        createAccount_Button.layer.shadowOffset = CGSize(width: 5, height: 5)
        createAccount_Button.layer.shadowRadius = 5
        createAccount_Button.layer.shadowOpacity = 1.0
        
        emailAddress_Textfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        dateOfBirth_textfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        password_Textfield.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        
        self.emailAddress_Label.font = UIFont.appRegularFontWith(size: 16)
        self.dateOfBirth_Label.font = UIFont.appRegularFontWith(size: 16)
        self.emailAddress_Label.font = UIFont.appRegularFontWith(size: 16)
        self.termsCondition_label.font = UIFont.appRegularFontWith(size: 13)
        self.already_label.font = UIFont.appRegularFontWith(size: 13)
        self.men_label.font = UIFont.appBoldFontWith(size: 16)
        self.female_label.font = UIFont.appBoldFontWith(size: 16)
    }
}

//MARK: ForgotPasswordVC DESIGN & UI
extension ForgotPasswordVC
{
    func ForgotPasswordVC_UI()
    {
        self.view.backgroundColor = .clear
        self.container_view.backgroundColor = .white
        self.sliderImage_view.backgroundColor = .clear
        self.formField_view.backgroundColor = .clear
        self.emailWelcomeText_view.backgroundColor = .clear
        self.recoverMyPasswordButton_view.backgroundColor = .clear
        
        recoverMyPassword_button.layer.cornerRadius = 20.0
        recoverMyPassword_button.clipsToBounds = true
        recoverMyPassword_button.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        recoverMyPassword_button.layer.shadowColor = UIColor.lightText.cgColor
        recoverMyPassword_button.layer.shadowOffset = CGSize(width: 5, height: 5)
        recoverMyPassword_button.layer.shadowRadius = 5
        recoverMyPassword_button.layer.shadowOpacity = 1.0
      
        emailAddress_textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.appFontWith_PoppinsRegular(size: 14.0)
            ])
        
        self.emailAddress_Label.font = UIFont.appRegularFontWith(size: 14)
        
    }
}

//MARK: HomeVC DESIGN & UI
extension HomeVC
{
    func HomeVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .white
        self.bottom_view.backgroundColor = .white
        self.container_view.backgroundColor = .white
        self.doctorsList_tableView.backgroundColor = .white
        
        seeAdoctor_Button.layer.cornerRadius = 25.0
        seeAdoctor_Button.clipsToBounds = true
        seeAdoctor_Button.backgroundColor =  #colorLiteral(red: 0.01960784314, green: 0.8549019608, blue: 0.6666666667, alpha: 1)  //UIColor(hex: "#05DAAA")
        seeAdoctor_Button.layer.shadowColor = UIColor.lightGray.cgColor
        seeAdoctor_Button.layer.shadowOffset = CGSize(width: 5, height: 5)
        seeAdoctor_Button.layer.shadowRadius = 5
        seeAdoctor_Button.layer.shadowOpacity = 1.0
        
        bottom_view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        seeAdoctor_Button.layer.shadowColor = UIColor.lightGray.cgColor
        seeAdoctor_Button.layer.shadowOffset = CGSize(width: 5, height: 5)
        seeAdoctor_Button.layer.shadowRadius = 5
        seeAdoctor_Button.layer.shadowOpacity = 1.0
        
    }
}


//MARK: DoctorDetailsVC DESIGN & UI
extension DoctorDetailsVC
{
    func DoctorDetailsVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.profile_view.backgroundColor = .clear
        self.ratingExperience_view.backgroundColor = .clear
        self.availableCheckup_view.backgroundColor = .clear
        self.biography_view.backgroundColor = .clear
        
        doctorImage_imageView.layer.cornerRadius = doctorImage_imageView.layer.frame.width/2
        doctorImage_imageView.clipsToBounds = true
        
        onlineoffline_view.layer.cornerRadius = onlineoffline_view.layer.frame.width/2
        onlineoffline_view.clipsToBounds = true
        
        onlineoffline_view.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        
        patientCount_view.layer.cornerRadius = 8.0
        patientCount_view.clipsToBounds = true
        patientCount_view.layer.shadowColor = UIColor.lightText.cgColor
        patientCount_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        patientCount_view.layer.shadowRadius = 5
        patientCount_view.layer.shadowOpacity = 1.0
        
        rating_View.layer.cornerRadius = 8.0
        rating_View.clipsToBounds = true
        rating_View.layer.shadowColor = UIColor.lightText.cgColor
        rating_View.layer.shadowOffset = CGSize(width: 5, height: 5)
        rating_View.layer.shadowRadius = 5
        rating_View.layer.shadowOpacity = 1.0
        
        experience_view.layer.cornerRadius = 8.0
        experience_view.clipsToBounds = true
        experience_view.layer.shadowColor = UIColor.lightText.cgColor
        experience_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        experience_view.layer.shadowRadius = 5
        experience_view.layer.shadowOpacity = 1.0
        
        availableToday_view.layer.cornerRadius = 8.0
        availableToday_view.clipsToBounds = true
        availableToday_view.layer.shadowColor = UIColor.lightText.cgColor
        availableToday_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        availableToday_view.layer.shadowRadius = 5
        availableToday_view.layer.shadowOpacity = 1.0
        
        checkupFee_view.layer.cornerRadius = 8.0
        checkupFee_view.clipsToBounds = true
        checkupFee_view.layer.shadowColor = UIColor.lightText.cgColor
        checkupFee_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        checkupFee_view.layer.shadowRadius = 5
        checkupFee_view.layer.shadowOpacity = 1.0
        
        doctorSpecialist_label.layer.cornerRadius = 5.0
        doctorSpecialist_label.clipsToBounds = true
        doctorSpecialist_label.layer.shadowColor = UIColor.lightText.cgColor
        doctorSpecialist_label.layer.shadowOffset = CGSize(width: 5, height: 5)
        doctorSpecialist_label.layer.shadowRadius = 5
        doctorSpecialist_label.layer.shadowOpacity = 1.0
        
    }
}

//MARK: ProfileVC DESIGN & UI
extension ProfileVC
{
    func ProfileVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.user_profile_view.backgroundColor = .clear
        self.payment_view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        self.profile_view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        self.getInTouch_view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        payment_view.layer.cornerRadius = 5.0
        payment_view.clipsToBounds = true
        
        profile_view.layer.cornerRadius = 5.0
        profile_view.clipsToBounds = true
        
        getInTouch_view.layer.cornerRadius = 5.0
        getInTouch_view.clipsToBounds = true
        
        doctorProfileImage_imageView.layer.cornerRadius = doctorProfileImage_imageView.layer.frame.width/2
        doctorProfileImage_imageView.clipsToBounds = true
        
    }
}

//MARK: CreditCardListVC DESIGN & UI
extension CreditCardListVC
{
    func CreditCardListVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.creditcardList_tableView.backgroundColor = .clear
        
        self.addCreditCard_Button.layer.cornerRadius = 20.0
        self.addCreditCard_Button.clipsToBounds = true
        
    }
}

//MARK: AddPaymentDetailsVC DESIGN & UI
extension AddPaymentDetailsVC
{
    func AddPaymentDetailsVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.addCreditCardButton_view.backgroundColor = .clear
        self.addPaymentMethodHeading_view.backgroundColor = .clear
        self.creditCardContainer_view.backgroundColor = .clear
        self.scanCard_view.backgroundColor = .clear
        self.creditCardNumber_view.backgroundColor = .clear
        self.expirtCCV_view.backgroundColor = .clear
        self.creditcard_view.backgroundColor = .clear
        
        addCreditCard_Button.layer.cornerRadius = 25.0
        addCreditCard_Button.clipsToBounds = true
        
        //MARK: CARD VIEW TEXTFIELD DALEGATES METHOD
        cardHolderName_textField.delegate = self
        CreditCardView_ccv_textfield.delegate = self
        creditCard_AccountNumber_textField_1.delegate = self
        creditCard_Accountnumber_textField_2.delegate = self
        creditCardView_AccountNumber_textField_3.delegate = self
        creditCardView_textField_4.delegate = self
        
        cardHolderName_textField.font = UIFont.appBoldFontWith(size: 19)
        CreditCardView_ccv_textfield.font = UIFont.appBoldFontWith(size: 19)
        creditCard_AccountNumber_textField_1.font = UIFont.appRegularFontWith(size: 16)
        creditCard_Accountnumber_textField_2.font = UIFont.appRegularFontWith(size: 16)
        creditCardView_AccountNumber_textField_3.font = UIFont.appRegularFontWith(size: 16)
        creditCardView_textField_4.font = UIFont.appRegularFontWith(size: 16)
        
        //MARK: ENTER CREDIT CARD NUMBER TEXTFIELD DALEGATES METHOD
        EnterCreditCard_AccountNumber_textField_1.delegate = self
        EnterCreditCard_AccountNumber_textField_2.delegate = self
        EnterCreditCard_AccountNumber_textField_3.delegate = self
        EnterCreditCard_AccountNumber_textField_4.delegate = self
        card_expiryDate_textField.delegate = self
        ccv_textfield.delegate = self
        
        EnterCreditCard_AccountNumber_textField_1.keyboardType = .asciiCapableNumberPad
        EnterCreditCard_AccountNumber_textField_2.keyboardType = .asciiCapableNumberPad
        EnterCreditCard_AccountNumber_textField_3.keyboardType = .asciiCapableNumberPad
        EnterCreditCard_AccountNumber_textField_4.keyboardType = .asciiCapableNumberPad
        card_expiryDate_textField.keyboardType = .asciiCapableNumberPad
        ccv_textfield.keyboardType = .asciiCapableNumberPad
        
        EnterCreditCard_AccountNumber_textField_1.font = UIFont.appRegularFontWith(size: 15)
        EnterCreditCard_AccountNumber_textField_2.font = UIFont.appRegularFontWith(size: 15)
        EnterCreditCard_AccountNumber_textField_3.font = UIFont.appRegularFontWith(size: 15)
        EnterCreditCard_AccountNumber_textField_4.font = UIFont.appRegularFontWith(size: 15)
        card_expiryDate_textField.font = UIFont.appRegularFontWith(size: 15)
        ccv_textfield.font = UIFont.appRegularFontWith(size: 15)
        
    }
}

//MARK: ContactInformantionVC DESIGN & UI
extension ContactInformantionVC
{
    func ContactInformantionVC_UI()
    {
        self.view.backgroundColor = .white
        self.container_view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.contactInformationHeading_view.backgroundColor = .clear
        self.address_view.backgroundColor = #colorLiteral(red: 0.208106339, green: 0.5424117446, blue: 0.6805691123, alpha: 1)
        self.edityourAddress_view.backgroundColor = .clear
        self.email_view.backgroundColor = .clear
        self.phoneNumber_view.backgroundColor = .clear
        self.saveContactInformation_view.backgroundColor = .clear
        self.profileImage_view.backgroundColor = .clear
        
        self.editYourAddress_Button.layer.cornerRadius = 18.0
        self.editYourAddress_Button.clipsToBounds = true
        
        self.saveContactInformationButton.layer.cornerRadius = 25.0
        self.saveContactInformationButton.clipsToBounds = true
        
        userImage_imageView.layer.cornerRadius = userImage_imageView.layer.frame.width/2
        userImage_imageView.clipsToBounds = true
        
        //MARK:EXTFIELD DALEGATES METHOD
        email_textfield.delegate = self
        phoneNumber_textfield.delegate = self
        
        let origImage = UIImage(named: "editWhitePencile")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        editEmail_button.setImage(tintedImage, for: .normal)
        editEmail_button.tintColor = #colorLiteral(red: 0.208106339, green: 0.5424117446, blue: 0.6805691123, alpha: 1)
        
        let origImage1 = UIImage(named: "editWhitePencile")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        phoneNumberEditButton.setImage(tintedImage1, for: .normal)
        phoneNumberEditButton.tintColor = #colorLiteral(red: 0.208106339, green: 0.5424117446, blue: 0.6805691123, alpha: 1)
        
    }
}

//MARK: GalleryCameraSelectVC DESIGN & UI
extension GalleryCameraSelectVC
{
    func GalleryCameraSelectVC_UI()
    {
        self.top_view.backgroundColor = .clear
        self.selectPhotoFromGalleryCameraImage_view.backgroundColor = .clear//#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.7)
                
        userImage.layer.cornerRadius = userImage.layer.frame.width/2
        userImage.clipsToBounds = true
        
        userImage.layer.borderWidth = 5.0
        userImage.layer.borderColor = UIColor.white.cgColor
        
        self.selectFromGalleryButton.layer.cornerRadius = 25.0
        self.selectFromGalleryButton.clipsToBounds = true
        
        self.takePhotoButton.layer.cornerRadius = 25.0
        self.takePhotoButton.clipsToBounds = true
        
    }
}

//MARK: UpdateEmailConfirmationVC DESIGN & UI
extension UpdateEmailConfirmationVC
{
    func UpdateEmailConfirmationVC_UI()
    {
        self.top_view.backgroundColor = .clear
        self.container_view.backgroundColor = .clear//#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.7)
        self.updateEmailConfirmation_view.backgroundColor = .clear
        
        self.verifyPasswordButton.layer.cornerRadius = 25.0
        self.verifyPasswordButton.clipsToBounds = true
        
        let image = UIImage(named: "ic_eye_closed")
        showPasswordButton.setImage(image, for: .normal)
    }
}

//MARK: UpdateAddressVC DESIGN & UI
extension UpdateAddressVC
{
    func UpdateAddressVC_UI()
    {
        self.top_view.backgroundColor = .clear
        self.container_view.backgroundColor = .clear
        
        self.saveButton.layer.cornerRadius = 25.0
        self.saveButton.clipsToBounds = true
        
        let origImage1 = UIImage(named: "downArrow")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        downArrowButton.setImage(tintedImage1, for: .normal)
        downArrowButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
}

//MARK: ChangePasswordVC DESIGN & UI
extension ChangePasswordVC
{
    func ChangePasswordVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.bannerImage_view.backgroundColor = .clear
        self.formField_view.backgroundColor = .clear
        self.passwordCombination_view.backgroundColor = .clear
        self.savesChanges_view.backgroundColor = .clear
        self.cancleButton_view.backgroundColor = .clear
        
        self.saveChanges_button.layer.cornerRadius = 25.0
        self.saveChanges_button.clipsToBounds = true
        
        self.saveChanges_button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        self.cancle_button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.cancle_button.layer.cornerRadius = 25.0
        self.cancle_button.clipsToBounds = true
        self.cancle_button.layer.borderWidth = 2.0
        self.cancle_button.layer.borderColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1).cgColor
        
    }
}

//MARK: InsuranceVC DESIGN & UI
extension InsuranceVC
{
    func InsuranceVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        
    }
}

//MARK: EmployerVC DESIGN & UI
extension EmployerVC
{
    func EmployerVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        
    }
}

//MARK: CustomerSupportVC DESIGN & UI
extension CustomerSupportVC
{
    func CustomerSupportVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.customerSupport_heading_view.backgroundColor = .clear
        self.imageBanner_view.backgroundColor = .clear
        self.liveChatSupport_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.callSupport_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.getHelpQuickly_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        self.liveChatSupport_view.layer.cornerRadius = 10.0
        self.liveChatSupport_view.clipsToBounds = true
        
        self.callSupport_view.layer.cornerRadius = 10.0
        self.callSupport_view.clipsToBounds = true
        
        self.getHelpQuickly_view.layer.cornerRadius = 10.0
        self.getHelpQuickly_view.clipsToBounds = true
        
        let origImage1 = UIImage(named: "forward_1")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        getHekpQuickly_forwardButton.setImage(tintedImage1, for: .normal)
        getHekpQuickly_forwardButton.tintColor = #colorLiteral(red: 0.2925279737, green: 0.7238749862, blue: 0.8695214391, alpha: 1)
        
        callSupport_forwardButton.setImage(tintedImage1, for: .normal)
        callSupport_forwardButton.tintColor = #colorLiteral(red: 0.2925279737, green: 0.7238749862, blue: 0.8695214391, alpha: 1)
        
        liveChatSupport_forwardButton.setImage(tintedImage1, for: .normal)
        liveChatSupport_forwardButton.tintColor = #colorLiteral(red: 0.2925279737, green: 0.7238749862, blue: 0.8695214391, alpha: 1)
    }
}

//MARK: LiveChatSupportVC DESIGN & UI
extension LiveChatSupportVC
{
    func LiveChatSupportVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        self.subheading_view.backgroundColor = .clear
        self.emergencyMessage_view.backgroundColor = .clear
        self.teamReply_view.backgroundColor = .clear
        self.selectReason_view.backgroundColor = .clear
        self.startChat_view.backgroundColor = .clear
        self.collectionView_view.backgroundColor = .clear
        
        let origImage1 = UIImage(named: "downArrow")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        selectReason_selectButton.setImage(tintedImage1, for: .normal)
        selectReason_selectButton.tintColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .white
        
        self.startChat_button.layer.cornerRadius = 25.0
        self.startChat_button.clipsToBounds = true
    }
}

//MARK: FAQVC DESIGN & UI
extension FAQVC
{
    func FAQVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        self.subheading_view.backgroundColor = .clear
        self.searchBar_view.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .white
      
    }
}


//MARK: AboutInstaDoctorVC DESIGN & UI
extension AboutInstaDoctorVC
{
    func AboutInstaDoctorVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        
    }
}



//MARK: TermsAndConditionVC DESIGN & UI
extension TermsAndConditionVC
{
    func TermsAndConditionVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.bannerImage_view.backgroundColor = .clear
        self.termConditionHeading_view.backgroundColor = .clear
        self.termsCondition_tableView.backgroundColor = .clear
        
    }
}

//MARK: TermsOfUseVC DESIGN & UI
extension TermsOfUseVC
{
    func TermsOfUseVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        self.subHeading_view.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .white
    }
}

//MARK: SelectyourSymptomsVC DESIGN & UI
extension SelectyourSymptomsVC
{
    func SelectyourSymptomsVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.seeAllSymptoms_view.backgroundColor = .clear
        self.selectyourSymptoms_tableView.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .black
        
        self.seeAllSymptoms_Button.layer.cornerRadius = 25.0
        self.seeAllSymptoms_Button.clipsToBounds = true
        
    }
}

//MARK: RegisterYourChildVC DESIGN & UI
extension RegisterYourChildVC
{
    func RegisterYourChildVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.bannerImage_view.backgroundColor = .clear
        self.registerYourChildHeading_view.backgroundColor = .clear
        self.formField_view.backgroundColor = .clear
        self.selectAge_view.backgroundColor = .clear
        self.addYourChild_view.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .black
        
        self.addYourChild_Button.layer.cornerRadius = 25.0
        self.addYourChild_Button.clipsToBounds = true
        
    }
}

//MARK: HowLongFeltWayDaysVC DESIGN & UI
extension HowLongFeltWayDaysVC
{
    func HowLongFeltWayDaysVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.subHeading_view.backgroundColor = .clear
        self.slider_view.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .black
        
        let origImage1 = UIImage(named: "downArrow")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        daysDropDown_Button.setImage(tintedImage1, for: .normal)
        daysDropDown_Button.tintColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        
        let origImage2 = UIImage(named: "next")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        next_Button.setImage(tintedImage2, for: .normal)
        next_Button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.next_Button.layer.cornerRadius = next_Button.layer.frame.width/2
        self.next_Button.clipsToBounds = true
        
    }
}

//MARK: SeeADoctorVC DESIGN & UI
extension SeeADoctorVC
{
    func SeeADoctorVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .white
        self.container_view.backgroundColor = .white
        self.doctorsList_tableView.backgroundColor = .white
    }
}

//MARK: MeetNowDoctorVC DESIGN & UI
extension MeetNowDoctorVC
{
    func MeetNowDoctorVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.profile_view.backgroundColor = .clear
        self.ratingExperience_view.backgroundColor = .clear
        self.availableCheckup_view.backgroundColor = .clear
        self.biography_view.backgroundColor = .clear
        self.meetNowButton_view.backgroundColor = .clear
        
        doctorImage_imageView.layer.cornerRadius = doctorImage_imageView.layer.frame.width/2
        doctorImage_imageView.clipsToBounds = true
        
        onlineoffline_view.layer.cornerRadius = onlineoffline_view.layer.frame.width/2
        onlineoffline_view.clipsToBounds = true
        
        onlineoffline_view.backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        
        meetNow_Button.layer.cornerRadius = 20.0
        meetNow_Button.clipsToBounds = true
        meetNow_Button.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        
        patientCount_view.layer.cornerRadius = 8.0
        patientCount_view.clipsToBounds = true
        patientCount_view.layer.shadowColor = UIColor.lightText.cgColor
        patientCount_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        patientCount_view.layer.shadowRadius = 5
        patientCount_view.layer.shadowOpacity = 1.0
        
        rating_View.layer.cornerRadius = 8.0
        rating_View.clipsToBounds = true
        rating_View.layer.shadowColor = UIColor.lightText.cgColor
        rating_View.layer.shadowOffset = CGSize(width: 5, height: 5)
        rating_View.layer.shadowRadius = 5
        rating_View.layer.shadowOpacity = 1.0
        
        experience_view.layer.cornerRadius = 8.0
        experience_view.clipsToBounds = true
        experience_view.layer.shadowColor = UIColor.lightText.cgColor
        experience_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        experience_view.layer.shadowRadius = 5
        experience_view.layer.shadowOpacity = 1.0
        
        availableToday_view.layer.cornerRadius = 8.0
        availableToday_view.clipsToBounds = true
        availableToday_view.layer.shadowColor = UIColor.lightText.cgColor
        availableToday_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        availableToday_view.layer.shadowRadius = 5
        availableToday_view.layer.shadowOpacity = 1.0
        
        checkupFee_view.layer.cornerRadius = 8.0
        checkupFee_view.clipsToBounds = true
        checkupFee_view.layer.shadowColor = UIColor.lightText.cgColor
        checkupFee_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        checkupFee_view.layer.shadowRadius = 5
        checkupFee_view.layer.shadowOpacity = 1.0
        
        doctorSpecialist_label.layer.cornerRadius = 5.0
        doctorSpecialist_label.clipsToBounds = true
        doctorSpecialist_label.layer.shadowColor = UIColor.lightText.cgColor
        doctorSpecialist_label.layer.shadowOffset = CGSize(width: 5, height: 5)
        doctorSpecialist_label.layer.shadowRadius = 5
        doctorSpecialist_label.layer.shadowOpacity = 1.0
        
    }
}

//MARK: ScheduleAppointmentVC DESIGN & UI
extension ScheduleAppointmentVC
{
    func ScheduleAppointmentVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.profile_view.backgroundColor = .clear
        self.ratingExperience_view.backgroundColor = .clear
        self.availableCheckup_view.backgroundColor = .clear
        self.biography_view.backgroundColor = .clear
        self.scheduleButton_view.backgroundColor = .clear
        
        doctorImage_imageView.layer.cornerRadius = doctorImage_imageView.layer.frame.width/2
        doctorImage_imageView.clipsToBounds = true
        
        onlineoffline_view.layer.cornerRadius = onlineoffline_view.layer.frame.width/2
        onlineoffline_view.clipsToBounds = true
        
        onlineoffline_view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        schedule_Button.layer.cornerRadius = 20.0
        schedule_Button.clipsToBounds = true
        schedule_Button.backgroundColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
        
        patientCount_view.layer.cornerRadius = 8.0
        patientCount_view.clipsToBounds = true
        patientCount_view.layer.shadowColor = UIColor.lightText.cgColor
        patientCount_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        patientCount_view.layer.shadowRadius = 5
        patientCount_view.layer.shadowOpacity = 1.0
        
        rating_View.layer.cornerRadius = 8.0
        rating_View.clipsToBounds = true
        rating_View.layer.shadowColor = UIColor.lightText.cgColor
        rating_View.layer.shadowOffset = CGSize(width: 5, height: 5)
        rating_View.layer.shadowRadius = 5
        rating_View.layer.shadowOpacity = 1.0
        
        experience_view.layer.cornerRadius = 8.0
        experience_view.clipsToBounds = true
        experience_view.layer.shadowColor = UIColor.lightText.cgColor
        experience_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        experience_view.layer.shadowRadius = 5
        experience_view.layer.shadowOpacity = 1.0
        
        availableToday_view.layer.cornerRadius = 8.0
        availableToday_view.clipsToBounds = true
        availableToday_view.layer.shadowColor = UIColor.lightText.cgColor
        availableToday_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        availableToday_view.layer.shadowRadius = 5
        availableToday_view.layer.shadowOpacity = 1.0
        
        checkupFee_view.layer.cornerRadius = 8.0
        checkupFee_view.clipsToBounds = true
        checkupFee_view.layer.shadowColor = UIColor.lightText.cgColor
        checkupFee_view.layer.shadowOffset = CGSize(width: 5, height: 5)
        checkupFee_view.layer.shadowRadius = 5
        checkupFee_view.layer.shadowOpacity = 1.0
        
        doctorSpecialist_label.layer.cornerRadius = 5.0
        doctorSpecialist_label.clipsToBounds = true
        doctorSpecialist_label.layer.shadowColor = UIColor.lightText.cgColor
        doctorSpecialist_label.layer.shadowOffset = CGSize(width: 5, height: 5)
        doctorSpecialist_label.layer.shadowRadius = 5
        doctorSpecialist_label.layer.shadowOpacity = 1.0
        
    }
}

//MARK: WhoIsVisitForVC DESIGN & UI
extension WhoIsVisitForVC
{
    func WhoIsVisitForVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.someOneElse_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.myChild_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.self_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.self_icon_view.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        self.myChild_icon_view.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        
        self_icon_view.layer.cornerRadius = self_icon_view.layer.frame.width/2
        self_icon_view.clipsToBounds = true
        
        myChild_icon_view.layer.cornerRadius = myChild_icon_view.layer.frame.width/2
        myChild_icon_view.clipsToBounds = true
        
        self.someOneElse_view.layer.cornerRadius = 10.0
        self.someOneElse_view.clipsToBounds = true
        
        self.myChild_view.layer.cornerRadius = 10.0
        self.myChild_view.clipsToBounds = true
        
        self.self_view.layer.cornerRadius = 10.0
        self.self_view.clipsToBounds = true
        
        let origImage1 = UIImage(named: "forward_1")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        self_forwardButton.setImage(tintedImage1, for: .normal)
        self_forwardButton.tintColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
        
        myChild_forwardButton.setImage(tintedImage1, for: .normal)
        myChild_forwardButton.tintColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
        
        someOneElse_forwardButton.setImage(tintedImage1, for: .normal)
        someOneElse_forwardButton.tintColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
    }
}

//MARK: AreYouTakingMedicineVC DESIGN & UI
extension AreYouTakingMedicineVC
{
    func AreYouTakingMedicineVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.banner_view.backgroundColor = .clear
        self.subHeading_view.backgroundColor = .clear
        self.subHeading_Message_view.backgroundColor = .clear
        self.button_view.backgroundColor = .clear
        
        self.yesButton.layer.cornerRadius = 25.0
        self.yesButton.clipsToBounds = true
        
        self.NoButton.layer.cornerRadius = 25.0
        self.NoButton.clipsToBounds = true
        
    }
}

//MARK: WhichMedicineVC DESIGN & UI
extension WhichMedicineVC
{
    func WhichMedicineVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.banner_view.backgroundColor = .clear
        self.subHeading_view.backgroundColor = .clear
        self.subHeading_Message_view.backgroundColor = .clear
        self.button_view.backgroundColor = .clear
        self.whichMedicine_tableView.backgroundColor = .clear
        self.Save_medication_view.backgroundColor = .clear
        
        self.yesButton.layer.cornerRadius = 25.0
        self.yesButton.clipsToBounds = true
        
        self.NoButton.layer.cornerRadius = 25.0
        self.NoButton.clipsToBounds = true
        
        self.Save_medication_Button.layer.cornerRadius = 25.0
        self.Save_medication_Button.clipsToBounds = true
    }
}

//MARK: HaveAnyDrugAllergyVC DESIGN & UI
extension HaveAnyDrugAllergyVC
{
    func HaveAnyDrugAllergyVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.HaveAnyDrugAllergy_tableView.backgroundColor = .clear
        self.subHeading_view.backgroundColor = .clear
        self.subHeading_Message_view.backgroundColor = .clear
        self.button_view.backgroundColor = .clear
        
        self.yesButton.layer.cornerRadius = 25.0
        self.yesButton.clipsToBounds = true
        
        self.NoButton.layer.cornerRadius = 25.0
        self.NoButton.clipsToBounds = true
        
    }
}

//MARK: WhichDrugAllergyVC DESIGN & UI
extension WhichDrugAllergyVC
{
    func WhichDrugAllergyVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.HaveAnyDrugAllergy_tableView.backgroundColor = .clear
        self.subHeading_view.backgroundColor = .clear
        self.subHeading_Message_view.backgroundColor = .clear
        self.button_view.backgroundColor = .clear
        self.Save_medication_view.backgroundColor = .clear
        
        self.yesButton.layer.cornerRadius = 25.0
        self.yesButton.clipsToBounds = true
        
        self.NoButton.layer.cornerRadius = 25.0
        self.NoButton.clipsToBounds = true
        
        self.Save_medication_Button.layer.cornerRadius = 25.0
        self.Save_medication_Button.clipsToBounds = true
        
    }
}

//MARK: YourWeightAndHeightVC DESIGN & UI
extension YourWeightAndHeightVC
{
    func YourWeightAndHeightVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.subHeading_view.backgroundColor = .clear
        self.slider_view.backgroundColor = .clear
        self.height_slider_view.backgroundColor = .clear
        self.weight_slider_view.backgroundColor = .clear
        
        let origImage = UIImage(named: "bac_black")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .black
        
        let origImage2 = UIImage(named: "next")
        let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
        next_Button.setImage(tintedImage2, for: .normal)
        next_Button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.next_Button.layer.cornerRadius = next_Button.layer.frame.width/2
        self.next_Button.clipsToBounds = true
        
    }
}

//MARK: LikeToSeeTheDoctorVC DESIGN & UI
extension LikeToSeeTheDoctorVC
{
    func LikeToSeeTheDoctorVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.seeDoctorNow_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.scheduleApponyment_view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        self.seeDoctorNow_view.layer.cornerRadius = 10.0
        self.seeDoctorNow_view.clipsToBounds = true
        
        self.scheduleApponyment_view.layer.cornerRadius = 10.0
        self.scheduleApponyment_view.clipsToBounds = true
        
        let origImage1 = UIImage(named: "forward_1")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        seeDoctorNow_forwardButton.setImage(tintedImage1, for: .normal)
        seeDoctorNow_forwardButton.tintColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
        
        scheduleApponyment_forwardButton.setImage(tintedImage1, for: .normal)
        scheduleApponyment_forwardButton.tintColor = #colorLiteral(red: 0.9620714784, green: 0.6701713204, blue: 0.2562068403, alpha: 1)
      
    }
}

//MARK: ThankYouOne DESIGN & UI
extension ThankYouOne
{
    func ThankYouOne_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
    }
}

//MARK: ThankYouTwo DESIGN & UI
extension ThankYouTwo
{
    func ThankYouTwo_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        self.nextButton.layer.cornerRadius = 18.0
        self.nextButton.clipsToBounds = true
        
    }
}

//MARK: ThankYouThree DESIGN & UI
extension ThankYouThree
{
    func ThankYouThree_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        self.nextButton.layer.cornerRadius = 18.0
        self.nextButton.clipsToBounds = true
        
    }
}

//MARK: VideoCallVC DESIGN & UI
extension VideoCallVC
{
    func VideoCallVC_UI()
    {
        self.view.backgroundColor = .white
        
    }
}

//MARK: JyoinAgainVC DESIGN & UI
extension JyoinAgainVC
{
    func JyoinAgainVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        
        self.jyoinAgain_Button.layer.cornerRadius = 25.0
        self.jyoinAgain_Button.clipsToBounds = true
        
        self.image_imageView.layer.cornerRadius = image_imageView.layer.frame.width/2
        self.image_imageView.clipsToBounds = true
        
    }
}

//MARK: WaittingRoomVC DESIGN & UI
extension WaittingRoomVC
{
    func WaittingRoomVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.timer_view.backgroundColor = .clear
        
        self.patientInQueueCount.layer.cornerRadius = patientInQueueCount.layer.frame.width/2
        self.patientInQueueCount.clipsToBounds = true
        self.patientInQueueCount.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        
        self.seeAnotherDoctor_Button.layer.cornerRadius = 25.0
        self.seeAnotherDoctor_Button.clipsToBounds = true
        self.seeAnotherDoctor_Button.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
        
        self.iWillWait_Button.layer.cornerRadius = 25.0
        self.iWillWait_Button.clipsToBounds = true
        self.iWillWait_Button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
    }
}

//MARK: ScheduleDateTimeVC DESIGN & UI
extension ScheduleDateTimeVC
{
    func ScheduleDateTimeVC_UI()
    {
        self.view.backgroundColor = .white
        self.top_view.backgroundColor = .clear
        self.date_view.backgroundColor = .clear
        
        self.schedule_Button.layer.cornerRadius = 25.0
        self.schedule_Button.clipsToBounds = true
        self.schedule_Button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
    }
}


//MARK: FirstVC DESIGN & UI
extension FirstVC
{
    func FirstVC_UI()
    {
        self.view.backgroundColor = .white
        self.pageControlView.backgroundColor = .clear
        
        self.index_One_indicator_View.layer.cornerRadius = index_One_indicator_View.layer.frame.width/2
        self.index_One_indicator_View.clipsToBounds = true
        self.index_One_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.index_Two_indicator_View.layer.cornerRadius = index_Two_indicator_View.layer.frame.width/2
        self.index_Two_indicator_View.clipsToBounds = true
        self.index_Two_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.index_Zero_indicator_View.layer.cornerRadius = index_Zero_indicator_View.layer.frame.width/2
        self.index_Zero_indicator_View.clipsToBounds = true
        self.index_Zero_indicator_View.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
       
    }
}

//MARK: SecoandVC DESIGN & UI
extension SecoandVC
{
    func SecoandVC_UI()
    {
        self.view.backgroundColor = .white
        self.pageControlView.backgroundColor = .clear
        
        self.index_One_indicator_View.layer.cornerRadius = index_One_indicator_View.layer.frame.width/2
        self.index_One_indicator_View.clipsToBounds = true
        self.index_One_indicator_View.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
        
        self.index_Two_indicator_View.layer.cornerRadius = index_Two_indicator_View.layer.frame.width/2
        self.index_Two_indicator_View.clipsToBounds = true
        self.index_Two_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.index_Zero_indicator_View.layer.cornerRadius = index_Zero_indicator_View.layer.frame.width/2
        self.index_Zero_indicator_View.clipsToBounds = true
        self.index_Zero_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
}

//MARK: ThirdVC DESIGN & UI
extension ThirdVC
{
    func ThirdVC_UI()
    {
        self.view.backgroundColor = .white
        self.pageControlView.backgroundColor = .clear
        
        self.index_One_indicator_View.layer.cornerRadius = index_One_indicator_View.layer.frame.width/2
        self.index_One_indicator_View.clipsToBounds = true
        self.index_One_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.index_Two_indicator_View.layer.cornerRadius = index_Two_indicator_View.layer.frame.width/2
        self.index_Two_indicator_View.clipsToBounds = true
        self.index_Two_indicator_View.backgroundColor = #colorLiteral(red: 0.3864063025, green: 0.8593739271, blue: 0.6703531742, alpha: 1)
        
        self.index_Zero_indicator_View.layer.cornerRadius = index_Zero_indicator_View.layer.frame.width/2
        self.index_Zero_indicator_View.clipsToBounds = true
        self.index_Zero_indicator_View.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
}
