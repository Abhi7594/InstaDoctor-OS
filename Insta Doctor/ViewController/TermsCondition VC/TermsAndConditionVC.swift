//
//  TermsAndConditionVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class TermsAndConditionVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var termConditionHeading_view: UIView!
    @IBOutlet weak var termsConditionHeading_label: UILabel!
    @IBOutlet weak var termsCondition_tableView: UITableView!
    @IBOutlet weak var bannerImage_view: UIView!
    @IBOutlet weak var bannerImage_1_imageView: UIImageView!
    @IBOutlet weak var bannerImage_2_imageView: UIImageView!
    
    var termsConditionArray = ["Terms of use",
                                "Informed Consent",
                                "Use of Health Information Agreement",
                                "Member Education Program Agreement",
                                "App Privacy Policy",
                                "Free Visit Promotion"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        TermsAndConditionVC_UI()
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
    
    //MARK: Button Action
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK: Tableview Datasource & Delegates
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    private func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return termsConditionArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermConditionTVCell") as! TermConditionTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        //cell.cell_containerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let origImage1 = UIImage(named: "forward_1")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        cell.cell_forwardButton.setImage(tintedImage1, for: .normal)
        cell.cell_forwardButton.tintColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        
        cell.cell_containerView.layer.cornerRadius = 5.0
        cell.cell_containerView.clipsToBounds = true
        
        cell.cell_itemName_label.text = termsConditionArray[indexPath.row]
        
        cell.cell_forwardButton.tag = indexPath.row
        cell.cell_forwardButton.addTarget(self, action: #selector(forwardButtonAction), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermsOfUseVC") as! TermsOfUseVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func forwardButtonAction(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermsOfUseVC") as! TermsOfUseVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
