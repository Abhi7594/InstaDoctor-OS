//
//  FirstVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 19/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myText_Label: UILabel!
    @IBOutlet weak var myText_Label_1: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var pageControlView: UIView!
    @IBOutlet weak var index_Zero_indicator_View: UIView!
    @IBOutlet weak var index_One_indicator_View: UIView!
    @IBOutlet weak var index_Two_indicator_View: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupOnLoad()
    }
    
    func setupOnLoad()
    {
        FirstVC_UI()
        
        skipButton.titleLabel?.font = UIFont.appFontWith_PoppinsMedium(size: 20) //appFontWith_PoppinsSemiBold appFontWith_PoppinsMedium
        
        NextButton.titleLabel?.font = UIFont.appFontWith_PoppinsMedium(size: 20)

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func skipButtonAction(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecoandVC") as! SecoandVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

