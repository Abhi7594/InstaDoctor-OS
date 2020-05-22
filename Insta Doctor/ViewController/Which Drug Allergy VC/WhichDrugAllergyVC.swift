//
//  WhichDrugAllergyVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class WhichDrugAllergyVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var subHeading_Message_label: UILabel!
    @IBOutlet weak var subHeading_Message_view: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var button_view: UIView!
    @IBOutlet weak var Save_medication_view: UIView!
    @IBOutlet weak var Save_medication_Button: UIButton!
    
    @IBOutlet weak var HaveAnyDrugAllergy_tableView: UITableView!
    @IBOutlet weak var whichDrugAllergy_tableView: UITableView!
    
    var sectionHeaderTitle = ["Which drug allergies"]
    var sectionFooterTitle = ["Add another"]
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
        
        WhichDrugAllergyVC_UI()
        
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
        
    }
    
    @IBAction func no_Button_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func Save_medication_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourWeightAndHeightVC") as! YourWeightAndHeightVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Tableview Datasource & Delegates
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if tableView == whichDrugAllergy_tableView
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = sectionHeaderTitle[section]
            label.frame = CGRect(x: 20, y: 5, width: 300, height: 45)
            label.font = UIFont.appBoldFontWith(size: 20)
            view.addSubview(label)
            
            return view
        }
        else
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = sectionHeaderTitle[section]
            label.frame = CGRect(x: 20, y: 5, width: 300, height: 0)
            label.font = UIFont.appBoldFontWith(size: 20)
            view.addSubview(label)
            
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        if tableView == whichDrugAllergy_tableView
        {
            return 50
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        if tableView == whichDrugAllergy_tableView
        {
            let footerView = UIView()
            footerView.backgroundColor = .white
            
            let label = UILabel()
            label.text = sectionFooterTitle[section]
            label.frame = CGRect(x: 20, y: 5, width: 300, height: 45)
            label.font = UIFont.appBoldFontWith(size: 17)
            label.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            
            footerView.addSubview(label)
            
            return footerView
        }
        else
        {
            let footerView = UIView()
            footerView.backgroundColor = .white
            
            let label = UILabel()
            label.text = ""
            label.frame = CGRect(x: 20, y: 5, width: 300, height: 0)
            label.font = UIFont.appBoldFontWith(size: 17)
            label.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            
            footerView.addSubview(label)
            
            return footerView
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if tableView == whichDrugAllergy_tableView
        {
            return sectionHeaderTitle.count
        }
        else
        {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == HaveAnyDrugAllergy_tableView
        {
            return 50
        }
        else
        {
            if (indexPath.section == 0)
            {
                return 60
            }
            else
            {
                return 60
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == HaveAnyDrugAllergy_tableView
        {
            return drugsAllergyArray.count
        }
        else
        {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == HaveAnyDrugAllergy_tableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhichDrugAllergyTVCell") as! WhichDrugAllergyTVCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = UIColor.clear
            
            cell.drugAllergyname.text = drugsAllergyArray[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhichDrugAllergyTextFieldTVCell") as! WhichDrugAllergyTextFieldTVCell
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = UIColor.clear
            
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
        
}
