//
//  SeeADoctorVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class SeeADoctorVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var backButton_Button: UIButton!
    @IBOutlet weak var logo_imageView: UIImageView!
    @IBOutlet weak var doctorsList_tableView: UITableView!
    
    var sectionHeaderTitle = ["Online Doctors","Offline Doctors"]
    
    var onlineDoctorArray = ["Dr. William Jones","Dr. William Jones","Dr. William Jones"]
    var offlineDoctorArray = ["Dr. William Jones","Dr. William Jones"]
    var cell_Button_tittleArray = ["Meet Now","Meet Now", "Waiting Room"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        SeeADoctorVC_UI()
        
        doctorsList_tableView.backgroundColor = .white
        
        //MARK: TABLE VIEW HEADER FONT
        if let font = UIFont(name: "Poppins-Bold", size: 18)
        {
            UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = font
        }
        
        // Auto resizing the height of the cell
        doctorsList_tableView.estimatedRowHeight = 130.0
        doctorsList_tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: Button Action
    @IBAction func back_Button_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Tableview Datasource & Delegates
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if (indexPath.section == 0)
        {
            return 130
        }
        else
        {
            return 130
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.text = sectionHeaderTitle[section] //"Online Doctors"//sectionTitles[section]
        label.frame = CGRect(x: 45, y: 5, width: 300, height: 45)
        label.font = UIFont.appBoldFontWith(size: 20)
        view.addSubview(label)
        
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionHeaderTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
     {
     return "Online Doctors"
     }*/
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (section == 0)
        {
            return onlineDoctorArray.count
        }
        else
        {
            return offlineDoctorArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .white
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeeADoctorTVCell") as! SeeADoctorTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        cell.imageView?.layer.cornerRadius = 10.0
        
        cell.cell_Action_Button.tag = indexPath.row
        cell.cell_Action_Button.addTarget(self, action: #selector(cellButtonAction), for: .touchUpInside)
        cell.cell_Action_Button.layer.setValue(indexPath.row, forKey: "index")
        
        if (indexPath.section == 0)
        {
            cell.floatRatingView_cell.editable = false
            
            cell.horizontal_Label.isHidden = true
            
            cell.cell_activeInactive_view.layer.cornerRadius = cell.cell_activeInactive_view.layer.frame.width/2
            cell.cell_activeInactive_view.clipsToBounds = true
            
            cell.doctorImage_imageView.layer.cornerRadius = cell.doctorImage_imageView.layer.frame.width/2
            cell.doctorImage_imageView.clipsToBounds = true
            
            cell.cell_Action_Button.layer.cornerRadius = 15.0
            cell.cell_Action_Button.clipsToBounds = true
            
            cell.doctorName_Label.text = onlineDoctorArray[indexPath.row]
            
            cell.cell_Action_Button.setTitle(cell_Button_tittleArray[indexPath.row], for: .normal)
        
            let buttonTitle = cell.cell_Action_Button.titleLabel?.text
            if buttonTitle == "Meet Now"
            {
                cell.cell_Action_Button.backgroundColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
                
                cell.activeInactive_Label.text = "Active"
                
                cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
            }
            else
            {
                cell.cell_Action_Button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                
                cell.activeInactive_Label.text = "Busy"
                
                cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
        else
        {
            cell.floatRatingView_cell.editable = false
            
            cell.horizontal_Label.isHidden = true
            
            cell.doctorName_Label.text = onlineDoctorArray[indexPath.row]
            cell.activeInactive_Label.text = "Offline"
            
            cell.cell_Action_Button.layer.cornerRadius = 15.0
            cell.cell_Action_Button.clipsToBounds = true
            cell.cell_Action_Button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            
            cell.cell_Action_Button.setTitle("Schedule", for: .normal)
            
            cell.cell_activeInactive_view.layer.cornerRadius = cell.cell_activeInactive_view.layer.frame.width/2
            cell.cell_activeInactive_view.clipsToBounds = true
            cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            
            cell.doctorImage_imageView.layer.cornerRadius = cell.doctorImage_imageView.layer.frame.width/2
            cell.doctorImage_imageView.clipsToBounds = true
            
        }
        
        
        return cell
        
    }
    
    @objc func cellButtonAction(sender: UIButton)
    {
        let position: CGPoint = sender.convert(CGPoint.zero, to: self.doctorsList_tableView)
        
        if let indexPath = self.doctorsList_tableView.indexPathForRow(at: position)
        {
            let section = indexPath.section
            let row = indexPath.row
            let indexPath = NSIndexPath.init(row: row, section: section)
            
            if (indexPath.section == 0)
            {
                let buttonTitle = sender.title(for: .normal) ?? String()
                if buttonTitle == "Meet Now"
                {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MeetNowDoctorVC") as! MeetNowDoctorVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else
                {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "WaittingRoomVC") as! WaittingRoomVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            else
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleAppointmentVC") as! ScheduleAppointmentVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeeADoctorTVCell") as! SeeADoctorTVCell
        
        if (indexPath.section == 0)
        {
            let buttonTitle = cell.cell_Action_Button.titleLabel?.text
            if buttonTitle == "Meet Now"
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MeetNowDoctorVC") as! MeetNowDoctorVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "WaittingRoomVC") as! WaittingRoomVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleAppointmentVC") as! ScheduleAppointmentVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

