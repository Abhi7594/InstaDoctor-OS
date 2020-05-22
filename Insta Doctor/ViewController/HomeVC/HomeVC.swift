//
//  HomeVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 02/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AlamofireObjectMapper
import SwiftyJSON


class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var bottom_view: UIView!
    @IBOutlet weak var seeAdoctor_Button: UIButton!
    @IBOutlet weak var notification_Button: UIButton!
    @IBOutlet weak var logo_imageView: UIImageView!
    @IBOutlet weak var doctorsList_tableView: UITableView!
    
    var gradientLayer: CAGradientLayer!
    
    var sectionHeaderTitle = ["Online Doctors","Offline Doctors"]
    
    var online_doctorList = get_OnlineDoctorList_Info()
    var offline_doctorList = get_OfflineDoctorList_Info()
    
    var set_OnlineDoctorListArray = [[String:AnyObject]]()
    var set_OfflineDoctorListArray = [[String:AnyObject]]()
    
    var online_doctorListArray = NSMutableArray()
    var offLine_doctorListArray = NSMutableArray()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        HomeVC_UI()
        
        doctorsList_tableView.backgroundColor = .white
        
        //MARK: TABLE VIEW HEADER FONT
        if let font = UIFont(name: "Poppins-Bold", size: 18)
        {
            UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self]).font = font
        }
        
        // Auto resizing the height of the cell
        doctorsList_tableView.estimatedRowHeight = 110.0
        doctorsList_tableView.rowHeight = UITableView.automaticDimension
        
        //MARK: Clear Almofire Cache
        URLCache.shared.removeAllCachedResponses()
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache?.removeAllCachedResponses()
        
        callWebServiceToGetDoctorList()
        
        //createGradientLayer()
    }
    
    //MARK:- create gradient color code
    func createGradientLayer()
    {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor(hex: "05DAAA"), UIColor(hex: "089675")]
        
        self.seeAdoctor_Button.layer.addSublayer(gradientLayer)
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
    @IBAction func notificationButton_Action(_ sender: Any)
    {
        
    }
    
    @IBAction func seeAdoctorButton_Action(_ sender: Any)
    {
        if UserDefaults.standard.object(forKey: "TOKEN") != nil
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "WhoIsVisitForVC") as! WhoIsVisitForVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //MARK: Tableview Datasource & Delegates
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if online_doctorListArray.count != 0 && offLine_doctorListArray.count != 0
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = sectionHeaderTitle[section]
            label.frame = CGRect(x: 27, y: 0, width: 300, height: 30)
            label.font = UIFont.appFontWith_PoppinsSemiBold(size: 19) //appBoldFontWith appFontWith_PoppinsSemiBold
            view.addSubview(label)
            
            return view
        }
        else if online_doctorListArray.count != 0 && offLine_doctorListArray.count == 0
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = "Online Doctors"
            label.frame = CGRect(x: 27, y: 0, width: 300, height: 30)
            label.font = UIFont.appFontWith_PoppinsSemiBold(size: 19)
            view.addSubview(label)
            
            return view
        }
        else if offLine_doctorListArray.count != 0 && online_doctorListArray.count == 0
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = "Offline Doctors"
            label.frame = CGRect(x: 27, y: 0, width: 300, height: 30)
            label.font = UIFont.appFontWith_PoppinsSemiBold(size: 19)
            view.addSubview(label)
            
            return view
        }
        else
        {
            let view = UIView()
            view.backgroundColor = UIColor.white
            
            let label = UILabel()
            label.text = ""
            label.frame = CGRect(x: 27, y: 0, width: 300, height: 30)
            label.font = UIFont.appFontWith_PoppinsSemiBold(size: 19)
            view.addSubview(label)
            
            return view
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if online_doctorListArray.count != 0 && offLine_doctorListArray.count != 0
        {
             return sectionHeaderTitle.count
        }
        else if online_doctorListArray.count != 0 && offLine_doctorListArray.count == 0
        {
            return 1
        }
        else if online_doctorListArray.count == 0 && offLine_doctorListArray.count != 0
        {
            return 1
        }
        else
        {
             return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
        let dummyView = UIView()
        
        if online_doctorListArray.count != 0 && offLine_doctorListArray.count != 0
        {
            let separatorView = UIView(frame: CGRect(x: 0, y: footerView.frame.height + 5, width: doctorsList_tableView.frame.width, height: 1)) //x=doctorsList_tableView.separatorInset.left
            //width=doctorsList_tableView.frame.width - doctorsList_tableView.separatorInset.right - doctorsList_tableView.separatorInset.left
            separatorView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            footerView.addSubview(separatorView)
            
            if section == 0
            {
                return footerView
            }
            return dummyView
        }
        else if online_doctorListArray.count != 0 && offLine_doctorListArray.count == 0
        {
           return dummyView
        }
        else if online_doctorListArray.count == 0 && offLine_doctorListArray.count != 0
        {
            return dummyView
        }
        else
        {
            return dummyView
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            if (section == 0)
            {
                return online_doctorListArray.count
            }
            else
            {
               return offLine_doctorListArray.count
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if (indexPath.section == 0)
        {
            return 110
        }
        else
        {
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .white
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVCell") as! HomeTVCell
            
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
            
        cell.imageView?.layer.cornerRadius = 10.0
        
        cell.forwardButton.tag = indexPath.row
        cell.forwardButton.addTarget(self, action: #selector(readMoreButtonAction), for: .touchUpInside)
        
        if (indexPath.section == 0)
        {
            cell.floatRatingView_cell.editable = false
            
            cell.cell_activeInactive_view.layer.cornerRadius = cell.cell_activeInactive_view.layer.frame.width/2
            cell.cell_activeInactive_view.clipsToBounds = true
            
            cell.doctorImage_imageView.layer.cornerRadius = cell.doctorImage_imageView.layer.frame.width/2
            cell.doctorImage_imageView.clipsToBounds = true
            
            cell.doctorImage_imageView.layer.borderWidth = 0.1
            cell.doctorImage_imageView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
            cell.horizontal_Label.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            
            if indexPath.row == online_doctorListArray.count - 1
            {
                cell.horizontal_Label.isHidden = true
            }
            
            let setDoctorList = online_doctorListArray[indexPath.row] as! get_OnlineDoctorList_Info
            
            if setDoctorList.doc_online_status == "1"
            {
                cell.activeInactive_Label.text = "Active"
                cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 0.01960784314, green: 0.8549019608, blue: 0.6666666667, alpha: 1) //UIColor(hex: "#05daaa")
            }
            else if setDoctorList.doc_online_status == "2"
            {
                cell.activeInactive_Label.text = "In Call"
                cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
            cell.doctorName_Label.text = setDoctorList.doctor_name
            cell.doctorDesignation_Label.text = setDoctorList.doc_education
            cell.doctorImage_imageView.setImageWith(URL(string: setDoctorList.doc_image_link)!)
            
        }
        else
        {
            cell.floatRatingView_cell.editable = false
            
            cell.cell_activeInactive_view.layer.cornerRadius = cell.cell_activeInactive_view.layer.frame.width/2
            cell.cell_activeInactive_view.clipsToBounds = true
            cell.cell_activeInactive_view.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            
            cell.doctorImage_imageView.layer.cornerRadius = cell.doctorImage_imageView.layer.frame.width/2
            cell.doctorImage_imageView.clipsToBounds = true
            
            cell.doctorImage_imageView.layer.borderWidth = 0.1
            cell.doctorImage_imageView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
            if indexPath.row == offLine_doctorListArray.count - 1
            {
                cell.horizontal_Label.isHidden = true
            }
            
            let setDoctorList = offLine_doctorListArray[indexPath.row] as! get_OfflineDoctorList_Info
            
            if setDoctorList.doc_online_status == "0"
            {
                cell.activeInactive_Label.text = "Offline"
                cell.doctorName_Label.text = setDoctorList.doctor_name
                cell.doctorDesignation_Label.text = setDoctorList.doc_education
                cell.doctorImage_imageView.setImageWith(URL(string: setDoctorList.doc_image_link)!)
            }
            
        }
        
            
        return cell
        
    }
    
    @objc func readMoreButtonAction(sender: UIButton)
    {
        let position: CGPoint = sender.convert(CGPoint.zero, to: self.doctorsList_tableView)
        
        if let indexPath = self.doctorsList_tableView.indexPathForRow(at: position)
        {
            let section = indexPath.section
            let row = indexPath.row
            let indexPath = NSIndexPath.init(row: row, section: section)
            
            if (indexPath.section == 0)
            {
                let setDoctorList = online_doctorListArray[indexPath.row] as! get_OnlineDoctorList_Info
                
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorDetailsVC") as! DoctorDetailsVC
                    vc.isFromOnlineDoctor = true
                    vc.doctorBio = setDoctorList.doc_message
                    vc.doctorName = setDoctorList.doctor_name
                    vc.doctorEducation = setDoctorList.doc_education
                    vc.doctordocSpecialty = setDoctorList.doc_specialty
                    vc.doctorImage = setDoctorList.doc_image_link
                    vc.doctorActiveStatus = setDoctorList.doc_online_status
                    self.navigationController?.pushViewController(vc, animated: true)
            }
            else
            {
                let setDoctorList = offLine_doctorListArray[indexPath.row] as! get_OfflineDoctorList_Info
               
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorDetailsVC") as! DoctorDetailsVC
                    vc.isFromOnlineDoctor = true
                    vc.doctorBio = setDoctorList.doc_message
                    vc.doctorName = setDoctorList.doctor_name
                    vc.doctorEducation = setDoctorList.doc_education
                    vc.doctordocSpecialty = setDoctorList.doc_specialty
                    vc.doctorImage = setDoctorList.doc_image_link
                    vc.doctorActiveStatus = setDoctorList.doc_online_status
                    self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.section == 0)
        {
            let setDoctorList = online_doctorListArray[indexPath.row] as! get_OnlineDoctorList_Info
            
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorDetailsVC") as! DoctorDetailsVC
                vc.isFromOnlineDoctor = true
                vc.doctorBio = setDoctorList.doc_message
                vc.doctorName = setDoctorList.doctor_name
                vc.doctorEducation = setDoctorList.doc_education
                vc.doctordocSpecialty = setDoctorList.doc_specialty
                vc.doctorImage = setDoctorList.doc_image_link
                vc.doctorActiveStatus = setDoctorList.doc_online_status
                self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let setDoctorList = offLine_doctorListArray[indexPath.row] as! get_OfflineDoctorList_Info
           
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorDetailsVC") as! DoctorDetailsVC
                vc.isFromOnlineDoctor = true
                vc.doctorBio = setDoctorList.doc_message
                vc.doctorName = setDoctorList.doctor_name
                vc.doctorEducation = setDoctorList.doc_education
                vc.doctordocSpecialty = setDoctorList.doc_specialty
                vc.doctorImage = setDoctorList.doc_image_link
                vc.doctorActiveStatus = setDoctorList.doc_online_status
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK:- Web Service API Methods
    func callWebServiceToGetDoctorList()
    {
        let params:[String:AnyObject] = [getDoctorListApiParameter.apiName:online_doctorList.ApiName as AnyObject]
        
        print(params)
        
        SVProgressHUD.show()
        
        Alamofire.request(ApiGet.baseURL, method: .get, parameters: params, encoding:URLEncoding.default)
            .responseJSON{
                
                response in
                print(response)
                SVProgressHUD.dismiss()

            if((response.result.value) != nil)
            {
                if let value = response.result.value as AnyObject?
                {
                    let json = JSON(response.result.value!)
                    self.online_doctorListArray.removeAllObjects()
                    self.offLine_doctorListArray.removeAllObjects()
                    let status = value.object(forKey: "status") as! Int
                    let message = value.object(forKey: "message") as! String
                    if (status==200)
                    {
                       if json["data"] != JSON.null
                        {
                            self.set_OnlineDoctorListArray = json["data"][0]["online_doctor_array"].arrayObject as! [[String : AnyObject]]
                            self.set_OfflineDoctorListArray = json["data"][0]["offline_doctor_array"].arrayObject as! [[String : AnyObject]]
                            
                            for i in 0..<self.set_OnlineDoctorListArray.count
                            {
                                let getDoctorList_Info_New = get_OnlineDoctorList_Info()
                                
                                getDoctorList_Info_New.id = self.set_OnlineDoctorListArray[i]["id"] as! String
                                getDoctorList_Info_New.doctor_name = self.set_OnlineDoctorListArray[i]["doc_name"] as! String
                                getDoctorList_Info_New.doc_emirates_id = self.set_OnlineDoctorListArray[i]["doc_emirates_id"] as! String
                                getDoctorList_Info_New.doc_image_link = self.set_OnlineDoctorListArray[i]["doc_image_link"] as! String
                                getDoctorList_Info_New.doc_specialty = self.set_OnlineDoctorListArray[i]["doc_specialty"] as! String
                                getDoctorList_Info_New.doc_education = self.set_OnlineDoctorListArray[i]["doc_education"] as! String
                                getDoctorList_Info_New.doc_language = self.set_OnlineDoctorListArray[i]["doc_language"] as! String
                                getDoctorList_Info_New.doc_nationality = self.set_OnlineDoctorListArray[i]["doc_nationality"] as! String
                                getDoctorList_Info_New.doc_exp = self.set_OnlineDoctorListArray[i]["doc_exp"] as! String
                                getDoctorList_Info_New.doc_message = self.set_OnlineDoctorListArray[i]["doc_message"] as! String
                                getDoctorList_Info_New.doc_online_status = self.set_OnlineDoctorListArray[i]["doc_online_status"] as! String
                                getDoctorList_Info_New.hosp_id = self.set_OnlineDoctorListArray[i]["hosp_id"] as! String
                                getDoctorList_Info_New.hosp_name = self.set_OnlineDoctorListArray[i]["hosp_name"] as! String
                                
                                self.online_doctorListArray.add(getDoctorList_Info_New)
                             }
                            for i in 0..<self.set_OfflineDoctorListArray.count
                            {
                                let getDoctorList_Info_New = get_OfflineDoctorList_Info()
                                
                                getDoctorList_Info_New.id = self.set_OfflineDoctorListArray[i]["id"] as! String
                                getDoctorList_Info_New.doctor_name = self.set_OfflineDoctorListArray[i]["doc_name"] as! String
                                getDoctorList_Info_New.doc_emirates_id = self.set_OfflineDoctorListArray[i]["doc_emirates_id"] as! String
                                getDoctorList_Info_New.doc_image_link = self.set_OfflineDoctorListArray[i]["doc_image_link"] as! String
                                getDoctorList_Info_New.doc_specialty = self.set_OfflineDoctorListArray[i]["doc_specialty"] as! String
                                getDoctorList_Info_New.doc_education = self.set_OfflineDoctorListArray[i]["doc_education"] as! String
                                getDoctorList_Info_New.doc_language = self.set_OfflineDoctorListArray[i]["doc_language"] as! String
                                getDoctorList_Info_New.doc_nationality = self.set_OfflineDoctorListArray[i]["doc_nationality"] as! String
                                getDoctorList_Info_New.doc_exp = self.set_OfflineDoctorListArray[i]["doc_exp"] as! String
                                getDoctorList_Info_New.doc_message = self.set_OfflineDoctorListArray[i]["doc_message"] as! String
                                getDoctorList_Info_New.doc_online_status = self.set_OfflineDoctorListArray[i]["doc_online_status"] as! String
                                getDoctorList_Info_New.hosp_id = self.set_OfflineDoctorListArray[i]["hosp_id"] as! String
                                getDoctorList_Info_New.hosp_name = self.set_OfflineDoctorListArray[i]["hosp_name"] as! String
                                
                                self.offLine_doctorListArray.add(getDoctorList_Info_New)
                            }
                            self.doctorsList_tableView.reloadData()
                            KSToastView.ks_showToast(message, duration: 2.0)
                        }
                        else
                        {
                            KSToastView.ks_showToast(message, duration: 3.0)
                        }
                    }
                    else
                    {
                        KSToastView.ks_showToast(message, duration: 3.0)
                    }
                }
                else
                {
                    self.present(UIAlertController.alertWithTitle(title: "Connection Error!", message: "Internet connection appears to be offline. Please check your internet connection", buttonTitle: "OK"), animated: true, completion: nil)
                }
            }
            else
            {
                self.present(UIAlertController.alertWithTitle(title: "Connection Error", message: "Internet connection appears to be offline. Please check your internet connection", buttonTitle: "OK"), animated: true, completion: nil)
            }
        }
    }//END
    
}


