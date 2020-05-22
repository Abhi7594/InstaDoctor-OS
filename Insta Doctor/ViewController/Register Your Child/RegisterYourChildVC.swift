//
//  RegisterYourChildVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class RegisterYourChildVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var registerYourChildHeading_view: UIView!
    @IBOutlet weak var registerYourChildHeading_label: UILabel!
    @IBOutlet weak var bannerImage_view: UIView!
    @IBOutlet weak var bannerImage_imageView: UIImageView!
    @IBOutlet weak var formField_view: UIView!
    @IBOutlet weak var range_label: UILabel!
    @IBOutlet weak var horizontal_label: UILabel!
    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var name_textField: UITextField!
    @IBOutlet weak var selectAge_Heading_Label: UILabel!
    @IBOutlet weak var selectAge_view: UIView!
    @IBOutlet weak var addYourChild_view: UIView!
    @IBOutlet weak var addYourChild_Button: UIButton!
    @IBOutlet weak var yearsheading_label: UILabel!
    @IBOutlet weak var monthsHeading_label: UILabel!
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var monthSlider: UISlider!
    
    //MARK: for slider count
    var year_Slider_count : Int = 0
    var month_Slider_count : Int = 0
    
    //MARK: SET SLIDER VALUE FOR JSON DATA
    var x_YEAR : Int = 0
    var x_MONTH : Int = 0
    
    var month_year_Array = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        RegisterYourChildVC_UI()
        
        yearSlider.maximumValue = 12
        yearSlider.minimumValue = 1
        monthSlider.maximumValue = 12
        monthSlider.minimumValue = 1
        
        //self.yearsheading_label.text = "\(Int(yearSlider.minimumValue))" + " Years"
   
        //self.monthsHeading_label.text = "\(Int(monthSlider.minimumValue))" + " Months"
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
    
    @IBAction func addYourChild_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectyourSymptomsVC") as! SelectyourSymptomsVC
        vc.isFromRegisterYourChild = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Slider Width
    func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint
    {
        let slidertTrack : CGRect = slider.trackRect(forBounds: slider.bounds)
        let sliderFrm : CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
        return CGPoint(x: sliderFrm.origin.x + slider.frame.origin.x + 8, y: slider.frame.origin.y + 20)
    }
    
    @IBAction func yearSlider_Action(_ sender: UISlider)
    {
        x_YEAR = Int(sender.value)
        self.yearsheading_label.text = "\(x_YEAR)" + " Years"
        
        /*let strNumber: NSString = "\(x_YEAR)" + " Years" as NSString
        let range = (strNumber).range(of: "Years")
        let attribute = NSMutableAttributedString.init(string: strNumber as String)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        yearsheading_label.attributedText = attribute*/
        yearsheading_label.halfTextColorChange(fullText: yearsheading_label.text!, changeText: "Years")
    }
    
    @IBAction func monthSlider_Action(_ sender: UISlider)
    {
        x_MONTH = Int(sender.value)
        self.monthsHeading_label.text = "\(x_MONTH)" + " Months"
        monthsHeading_label.halfTextColorChange(fullText: monthsHeading_label.text!, changeText: "Months")
    }
    
}


