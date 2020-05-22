//
//  WhichMedicineVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class WhichMedicineVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var subHeading_view: UIView!
    @IBOutlet weak var subHeading_label: UILabel!
    @IBOutlet weak var subHeading_Message_label: UILabel!
    @IBOutlet weak var subHeading_Message_view: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var banner_view: UIView!
    @IBOutlet weak var button_view: UIView!
    @IBOutlet weak var banner_imageView: UIImageView!
    @IBOutlet weak var Save_medication_view: UIView!
    @IBOutlet weak var Save_medication_Button: UIButton!
    @IBOutlet weak var whichMedicine_tableView: UITableView!
    
    var sectionHeaderTitle = ["Which medication"]
    var sectionFooterTitle = ["Add another"]
    var medicineName_PlaceholderArray = ["Medication - 1","Medication - 1"]
    var howLongArray = ["1","2","3","4","5"]
    var optionPicker = GKActionSheetPicker()
    
    var medicineTakingDetails = whichMedicineVc_Info()
    
    var medicineArray = NSMutableArray()
    var isHowLongChanged = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        WhichMedicineVC_UI()
        
        // Auto resizing the height of the cell
        whichMedicine_tableView.estimatedRowHeight = 60.0
        whichMedicine_tableView.rowHeight = UITableView.automaticDimension
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HaveAnyDrugAllergyVC") as! HaveAnyDrugAllergyVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK:- TextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField.returnKeyType == .next
        {
            (self.view.viewWithTag(textField.tag + 1) as! UITextField).becomeFirstResponder()
        }
        
        if textField.returnKeyType == .done
        {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        switch textField.tag {
        case 0:
            self.medicineTakingDetails.medicineName = trimWhiteSpace(str: textField.text!)
            break
        default:
            break
        }
    }
    
    //MARK: Tableview Datasource & Delegates
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
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
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionHeaderTitle.count
    }

    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (section == 0)
        {
            return medicineName_PlaceholderArray.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .white
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhichMedicineTVCell") as! WhichMedicineTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
       
        cell.cell_dropDown_Button.tag = indexPath.row
        cell.cell_dropDown_Button.addTarget(self, action: #selector(cellButtonAction), for: .touchUpInside)
        cell.cell_dropDown_Button.layer.setValue(indexPath.row, forKey: "index")
        
        //let headingLabelData = medicineArray[indexPath.row] as! whichMedicineVc_Info
        
        //cell.cell_howLong_heading_label.text = headingLabelData.medicineName
        cell.cell_medicineName_textField.placeholder = medicineName_PlaceholderArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK: State Button Action
    @objc func cellButtonAction(sender: UIButton)
    {
        let position: CGPoint = sender.convert(CGPoint.zero, to: self.whichMedicine_tableView)
        let cell = whichMedicine_tableView.dequeueReusableCell(withIdentifier: "WhichMedicineTVCell") as! WhichMedicineTVCell
        if let indexPath = self.whichMedicine_tableView.indexPathForRow(at: position)
        {
            let section = indexPath.section
            let row = indexPath.row
            let indexPath = NSIndexPath.init(row: row, section: section)
            
            if howLongArray.count > 0
            {
                self.optionPicker = GKActionSheetPicker.stringPicker(withItems: howLongArray as [Any], selectCallback: { (selected: Any) in
                    
                    self.medicineTakingDetails.medicineName = (selected as? String)!
                    let medicineInfo = self.self.medicineArray[Int(self.optionPicker.indexOfElement)] as! whichMedicineVc_Info
                    self.medicineTakingDetails.medicineName = medicineInfo.medicineName
                    
                    let medicineSelectedInfo = self.howLongArray[Int(self.optionPicker.indexOfElement)]
                    //cell.cell_howLong_heading_label.text = medicineSelectedInfo
                        
                    self.isHowLongChanged = true
                    
                    //self.whichMedicine_tableView.reloadData()
                    //self.medicineArray.removeAllObjects()
                    
                }, cancelCallback: nil)
                self.optionPicker.present(on: self.view)
            }
            else
            {
                self.present(UIAlertController.alertWithTitle(title: "", message: "No reason found", buttonTitle: "OK"), animated: true, completion: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print([indexPath.row])
    }
    
}

