//
//  ScheduleDateTimeVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 14/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

enum MyTheme
{
    case light
    case dark
}

class ScheduleDateTimeVC: UIViewController, CalenderDelegate {
    

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var date_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var schedule_Button: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var date_CalenderView: UIView!
    @IBOutlet weak var time_CollectionView: UICollectionView!
    
    var theme = MyTheme.light
    
    var timeArray = ["10:00 am","10:30 am","11:00 am","11:30 am","12:00 am","12:30 am","13:00 am","13:30 am","14:00 am","14:30 am","15:00 am","15:30 am"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ScheduleDateTimeVC_UI()
        
        date_CalenderView.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: date_view.topAnchor, constant: 10).isActive=true
        calenderView.rightAnchor.constraint(equalTo: date_view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: date_view.leftAnchor, constant: 12).isActive=true
        calenderView.bottomAnchor.constraint(equalTo: date_view.bottomAnchor, constant: 10).isActive=true
        //calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.light)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    func didTapDate(date: String, available: Bool)
    {
            print("selected date is \(date)")
    }
    /*func didTapDate(date: String, available: Bool)
    {
        if available == true
        {
            
        }
        else
        {
            //showAlert()
        }
    }*/
    
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
    
    @IBAction func schedule_Button_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddPaymentDetailsVC") as! AddPaymentDetailsVC
        vc.meetWaitingSchedule_value = "3"
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
}
