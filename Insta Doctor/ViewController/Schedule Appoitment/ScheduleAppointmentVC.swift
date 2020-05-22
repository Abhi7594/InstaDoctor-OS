//
//  ScheduleAppointmentVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class ScheduleAppointmentVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var scheduleAppointment_tableView: UITableView!
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
    @IBOutlet weak var schedule_Button: UIButton!
    @IBOutlet weak var scheduleButton_view: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ScheduleAppointmentVC_UI()
        
        scheduleAppointment_tableView.backgroundColor = .white
        
        //MARK: TABLE VIEW HEADER FONT
        if let font = UIFont(name: "Poppins-Bold", size: 18)
        {
            UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = font
        }
        
        // Auto resizing the height of the cell
        scheduleAppointment_tableView.estimatedRowHeight = 130.0
        scheduleAppointment_tableView.rowHeight = UITableView.automaticDimension
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
    
    @IBAction func scheduleAppointment_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleDateTimeVC") as! ScheduleDateTimeVC
        self.navigationController?.pushViewController(vc, animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleAppointmentTVCell") as! ScheduleAppointmentTVCell
        
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
