//
//  HaveAnyDrugAllergyVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class HaveAnyDrugAllergyVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var subHeading_Message_label: UILabel!
    @IBOutlet weak var subHeading_Message_view: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var button_view: UIView!
   
    @IBOutlet weak var HaveAnyDrugAllergy_tableView: UITableView!
    
    var drugsAllergyArray = ["Examples","Amoxicillin","Bactrim","Aspirin"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        HaveAnyDrugAllergyVC_UI()
        
        // Auto resizing the height of the cell
        HaveAnyDrugAllergy_tableView.estimatedRowHeight = 50.0
        HaveAnyDrugAllergy_tableView.rowHeight = UITableView.automaticDimension
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
    
    @IBAction func yes_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhichDrugAllergyVC") as! WhichDrugAllergyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func no_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourWeightAndHeightVC") as! YourWeightAndHeightVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Tableview Datasource & Delegates
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
         return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return drugsAllergyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HaveYouAnyDrugAllergyTVcell") as! HaveYouAnyDrugAllergyTVcell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        cell.drugAllergyname.text = drugsAllergyArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
}

