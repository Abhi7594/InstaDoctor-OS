//
//  CreditCardListVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class CreditCardListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var creditcardList_tableView: UITableView!
    @IBOutlet weak var addCreditCard_Button: UIButton!
    @IBOutlet weak var creditCardHeading_view: UIView!
    @IBOutlet weak var creditcard_heading_label: UILabel!
    @IBOutlet weak var bottom_view: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        CreditCardListVC_UI()
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
    
    @IBAction func addCreditCardButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddPaymentDetailsVC") as! AddPaymentDetailsVC
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditCardListTVCell") as! CreditCardListTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
                
        cell.activeinactive_view.layer.cornerRadius = cell.activeinactive_view.layer.frame.width/2
        cell.activeinactive_view.clipsToBounds = true
        
        cell.edit_view.layer.cornerRadius = cell.edit_view.layer.frame.width/2
        cell.edit_view.clipsToBounds = true
        
        cell.card_expiryDate_textField.isUserInteractionEnabled = false
        cell.cardHolderName_textField.isUserInteractionEnabled = false
        cell.CreditCard_AccountNumber_textField_1.isUserInteractionEnabled = false
        cell.CreditCard_AccountNumber_textField_2.isUserInteractionEnabled = false
        cell.CreditCard_AccountNumber_textField_3.isUserInteractionEnabled = false
        cell.CreditCard_AccountNumber_textField_4.isUserInteractionEnabled = false
        
        cell.cardHolderName_textField.attributedPlaceholder = NSAttributedString(string: "YOUR NAME",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cell.card_expiryDate_textField.attributedPlaceholder = NSAttributedString(string: "MM/YY",
                                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cell.CreditCard_AccountNumber_textField_1.attributedPlaceholder = NSAttributedString(string: "....",
                                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cell.CreditCard_AccountNumber_textField_2.attributedPlaceholder = NSAttributedString(string: "....",
                                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cell.CreditCard_AccountNumber_textField_3.attributedPlaceholder = NSAttributedString(string: "....",
                                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cell.CreditCard_AccountNumber_textField_4.attributedPlaceholder = NSAttributedString(string: "....",
                                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        return cell
        
    }

    @objc func editButtonAction(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddPaymentDetailsVC") as! AddPaymentDetailsVC
        vc.isFromCreditCardList = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }

}
