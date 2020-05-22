//
//  HowLongFeltWayDaysVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import VerticalSlider

class HowLongFeltWayDaysVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var daysDropDown_Button: UIButton!
    @IBOutlet weak var slider_view: UIView!
    @IBOutlet weak var next_Button: UIButton!
    @IBOutlet weak var daysHeading_label: UILabel!
    @IBOutlet weak var verticalDaysSlider_view: VerticalSlider!
    
    //MARK: for slider count
    var days_Slider_count : Int = 0
    
    //MARK: SET SLIDER VALUE FOR JSON DATA
    var x_DAYS : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        HowLongFeltWayDaysVC_UI()
        
        verticalDaysSlider_view.slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        verticalDaysSlider_view.maximumValue = 30
        verticalDaysSlider_view.minimumValue = 1
        
        //self.daysHeading_label.text = "\(Int(verticalDaysSlider_view.minimumValue))" + " Days"
        
    }
    
    @objc func sliderChanged()
    {
        print("days slider value: ",verticalDaysSlider_view.value)
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
    
    @IBAction func next_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AreYouTakingMedicineVC") as! AreYouTakingMedicineVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func Days_verticalSlider_Action(_ sender: UISlider)
    {
        x_DAYS = Int(sender.value)
        self.daysHeading_label.text = "\(x_DAYS)" + " Days"
    }
}
