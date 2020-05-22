//
//  SelectyourSymptomsVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class SelectyourSymptomsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var selectYourSympotm_view: UIView!
    @IBOutlet weak var selectYourSympotm_view_label: UILabel!
    @IBOutlet weak var selectyourSymptoms_tableView: UITableView!
    @IBOutlet weak var seeAllSymptoms_view: UIView!
    @IBOutlet weak var seeAllSymptoms_Button: UIButton!
    @IBOutlet weak var searchBar_View: UIView!
    @IBOutlet weak var message_label: UILabel!
    @IBOutlet weak var searchSymptoms_searchBar: UISearchBar!
    
    var sympotmsArray = ["Cold","Cough","Headech","Sore Throat","Nasal Congestion","Rash","Nasal Congestion"]
    
    var selectedCells:[Int] = []

    var isFromRegisterYourChild = Bool()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        SelectyourSymptomsVC_UI()
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

    @IBAction func seeAllSymptoms_Button_Action(_ sender: Any)
    {
        if isFromRegisterYourChild == true
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HowLongFeltWayDaysVC") as! HowLongFeltWayDaysVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HowLongFeltWayDaysVC") as! HowLongFeltWayDaysVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //MARK: table view datasource and dalegates method
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sympotmsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       let cell = tableView.dequeueReusableCell(withIdentifier: "SelectYourSymptomsTVCell") as! SelectYourSymptomsTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        cell.selectionImage_imageView.layer.cornerRadius = cell.selectionImage_imageView.layer.frame.width/2
        cell.selectionImage_imageView.clipsToBounds = true
        
        cell.selectionImage_imageView.isHidden = true
        /*let origImage = UIImage(named: "correctIcon_")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        cell.selectionImage_imageView.image = tintedImage
        cell.selectionImage_imageView.tintColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1) */
        
        cell.sympotmsName_label.text = sympotmsArray[indexPath.row]
        
        //cell.accessoryType = self.selectedCells.contains(indexPath.row) ? .checkmark : .none
        
        if self.selectedCells.contains(indexPath.row)
        {
           cell.selectionImage_imageView.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if self.selectedCells.contains(indexPath.row)
        {
            let myIndex = self.selectedCells.firstIndex(of: indexPath.row)
            self.selectedCells.remove(at: myIndex!)
        }
        else
        {
            self.selectedCells.append(indexPath.row)
        }
        selectyourSymptoms_tableView.reloadData()
    }
    
}
