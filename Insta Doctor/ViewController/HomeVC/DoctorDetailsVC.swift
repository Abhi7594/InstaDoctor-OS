//
//  DoctorDetailsVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class DoctorDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var doctorsDetails_tableView: UITableView!
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var logo_imageView: UIImageView!
    @IBOutlet weak var profile_view: UIView!
    @IBOutlet weak var doctorImage_imageView: UIImageView!
    @IBOutlet weak var doctorName_Label: UILabel!
    @IBOutlet weak var doctorDesignation_Label: UILabel!
    @IBOutlet weak var doctorSpecialist_label: UILabel!
    @IBOutlet weak var ratingExperience_view: UIView!
    @IBOutlet weak var patientCount_view: UIView!
    @IBOutlet weak var patientCountHeading_Label: UILabel!
    @IBOutlet weak var patientCount_Label: UILabel!
    @IBOutlet weak var rating_View: UIView!
    @IBOutlet weak var ratingHeading_Label: UILabel!
    @IBOutlet weak var ratingCount_Label: UILabel!
    @IBOutlet weak var experience_view: UIView!
    @IBOutlet weak var experienceHeading_Label: UILabel!
    @IBOutlet weak var experienceCount_Label: UILabel!
    @IBOutlet weak var availableCheckup_view: UIView!
    @IBOutlet weak var availableToday_view: UIView!
    @IBOutlet weak var availabelHeading_Label: UILabel!
    @IBOutlet weak var availableTime_Label: UILabel!
    @IBOutlet weak var checkupFee_view: UIView!
    @IBOutlet weak var checkupFeesHeading_Label: UILabel!
    @IBOutlet weak var checkupFee_Label: UILabel!
    @IBOutlet weak var biography_view: UIView!
    @IBOutlet weak var bipgraphyHeading_label: UILabel!
    @IBOutlet weak var biography_Label: UILabel!
    @IBOutlet weak var onlineoffline_view: UIView!
    
    var isFromOnlineDoctor = Bool()
    
    
    var doctorName = ""
    var doctorEducation = ""
    var doctordocSpecialty = ""
    var doctorImage = ""
    var doctorBio = ""
    var doctorActiveStatus = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        DoctorDetailsVC_UI()
        
        doctorsDetails_tableView.backgroundColor = .white
        
        //MARK: TABLE VIEW HEADER FONT
        if let font = UIFont(name: "Poppins-Bold", size: 18)
        {
            UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = font
        }
        
        // Auto resizing the height of the cell
        doctorsDetails_tableView.estimatedRowHeight = 130.0
        doctorsDetails_tableView.rowHeight = UITableView.automaticDimension
        
        doctorInfoMethod()
        
    }
    
    //MARK: set data
    func doctorInfoMethod()
    {
        self.doctorName_Label.text = doctorName
        self.doctorDesignation_Label.text = doctordocSpecialty
        self.doctorSpecialist_label.text = doctorEducation
        self.biography_Label.text = doctorBio
        self.doctorImage_imageView.setImageWith(URL(string: doctorImage)!)
        
        if doctorActiveStatus == "1"
        {
            self.onlineoffline_view.backgroundColor = #colorLiteral(red: 0.01960784314, green: 0.8549019608, blue: 0.6666666667, alpha: 1)  // UIColor(hex: "#05DAAA")
        }
        else if doctorActiveStatus == "2"
        {
            self.onlineoffline_view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
        else
        {
            self.onlineoffline_view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorDetailsTVCell") as! DoctorDetailsTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        cell.imageView?.layer.cornerRadius = 10.0
        
        cell.cell_doctorImage.layer.cornerRadius = cell.cell_doctorImage.layer.frame.width/2
        cell.cell_doctorImage.clipsToBounds = true
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }

}
