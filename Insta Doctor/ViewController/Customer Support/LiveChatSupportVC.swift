//
//  LiveChatSupportVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 07/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class LiveChatSupportVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var liveChatSupportHeading_label: UILabel!
    @IBOutlet weak var subheading_view: UIView!
    @IBOutlet weak var subheading_label: UILabel!
    @IBOutlet weak var collectionView_view: UIView!
    @IBOutlet weak var teamReply_view: UIView!
    @IBOutlet weak var teamReply_label: UILabel!
    @IBOutlet weak var selectReason_view: UIView!
    @IBOutlet weak var selectReasonHeading_label: UILabel!
    @IBOutlet weak var selectReason_textfield: UITextField!
    @IBOutlet weak var selectReason_selectButton: UIButton!
    @IBOutlet weak var horizontal_label: UILabel!
    @IBOutlet weak var startChat_view: UIView!
    @IBOutlet weak var startChat_button: UIButton!
    @IBOutlet weak var emergencyMessage_view: UIView!
    @IBOutlet weak var emergencyMeaasge_label: UILabel!
    @IBOutlet weak var liveChatSupport_CollectionView: UICollectionView!
    @IBOutlet weak var startReason_button: UIButton!
    
    var selectReasonArray = ["Prescription","Technical support","Account Assistance","Others"]//NSMutableArray()
    var optionPicker = GKActionSheetPicker()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        LiveChatSupportVC_UI()
        
        self.selectReason_textfield.addTarget(self, action: #selector(selectReasonTextfieldAction), for: .touchDown)
        self.selectReason_textfield.isUserInteractionEnabled = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        //MARK: CHANGE STATUS BAR BACKGROUND COLOR
        /*let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor))
        {
            statusBar.backgroundColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        }*/
        
    }
    
    //MARK: SELECT REASON TEXTFIELD ACTION
    @objc func selectReasonTextfieldAction(textField: UITextField)
    {
        selectChatReasonMethod()
        self.selectReason_textfield.resignFirstResponder()
    }
    
    //MARK: Button Action
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func selectReason_select_Button_Action(_ sender: Any)
    {
        selectChatReasonMethod()
    }
    
    @IBAction func selectReasonButton_Action(_ sender: Any)
    {
        selectChatReasonMethod()
    }
    
    //MARK: Collection View Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //return CGSize(width: (collectionView.frame.size.width) - 10, height: 145)
        return CGSize(width: 115, height: 145);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveChatSupportCVCell", for: indexPath) as! LiveChatSupportCVCell
            
        cell.image_cell.layer.cornerRadius = cell.image_cell.layer.frame.width/2
        cell.image_cell.clipsToBounds = true
        
        cell.label_cell.textColor = #colorLiteral(red: 0.3056670427, green: 0.6915470958, blue: 0.5328731537, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
       
    }
    
    //MARK: SELECT REASON TEXTFIELD SET DATA METHOD
    func selectChatReasonMethod()
    {
        if selectReasonArray.count > 0
        {
            self.optionPicker = GKActionSheetPicker.stringPicker(withItems: selectReasonArray as [Any], selectCallback: { (selected: Any) in
                
                let reasonInfo = self.selectReasonArray[Int(self.optionPicker.indexOfElement)] //as! OBMStateInfo
                
                self.selectReason_textfield.text = reasonInfo
                
            }, cancelCallback: nil)
            self.optionPicker.present(on: self.view)
        }
        else
        {
            self.present(UIAlertController.alertWithTitle(title: "", message: "No reason found", buttonTitle: "OK"), animated: true, completion: nil)
        }
    }
    
}
