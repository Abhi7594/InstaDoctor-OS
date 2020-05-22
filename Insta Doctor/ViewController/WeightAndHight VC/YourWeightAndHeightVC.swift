//
//  YourWeightAndHeightVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import VerticalSlider

class YourWeightAndHeightVC: UIViewController {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var slider_view: UIView!
    @IBOutlet weak var weight_slider_view: UIView!
    @IBOutlet weak var height_slider_view: UIView!
    @IBOutlet weak var nextButton_view: UIView!
    @IBOutlet weak var next_Button: UIButton!
    @IBOutlet weak var heightSliderHeading_label: UILabel!
    @IBOutlet weak var weightSliderHeading_label: UILabel!
    @IBOutlet weak var heightSlider: VerticalSlider!
    @IBOutlet weak var weightSlider: VerticalSlider!
    @IBOutlet weak var weight_value_label: UILabel!
    @IBOutlet weak var height_value_label: UILabel!
    
    //MARK: for slider count
    var weight_Slider_count : Int = 0
    var height_Slider_count : Int = 0
    
    //MARK: SET SLIDER VALUE FOR JSON DATA
    var x_WEIGHT : Int = 0
    var x_HEIGHT : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        YourWeightAndHeightVC_UI()
        
        heightSlider.slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        weightSlider.slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        
        heightSlider.maximumValue = 10
        heightSlider.minimumValue = 0
        
        weightSlider.maximumValue = 100
        weightSlider.minimumValue = 0
        
    }
    
    @objc func heightSliderChanged()
    {
        print("days slider value: ",heightSlider.value)
    }
    
    @objc func weightSliderChanged()
    {
        print("days slider value: ",weightSlider.value)
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LikeToSeeTheDoctorVC") as! LikeToSeeTheDoctorVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Weight_verticalSlider_Action(_ sender: UISlider)
    {
        x_WEIGHT = Int(sender.value)
        self.weight_value_label.text = "\(x_WEIGHT)" + "  KG"
    }
    
    @IBAction func Height_verticalSlider_Action(_ sender: UISlider)
    {
        x_HEIGHT = Int(sender.value)
        self.height_value_label.text = "\(x_HEIGHT)" + "  Ft"
    }
    
}
