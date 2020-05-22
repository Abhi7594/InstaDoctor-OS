//
//  FAQVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 07/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class FAQVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var faqHeading_label: UILabel!
    @IBOutlet weak var subheading_view: UIView!
    @IBOutlet weak var subheading_label: UILabel!
    @IBOutlet weak var searchBar_view: UIView!
    @IBOutlet weak var faqList_tableView: UITableView!
    @IBOutlet weak var faqListSearchBar: UISearchBar!
    
    var sectionHeaderTitle = ["General","Doctor visit"]
    var sectionFooterTitle = ["View All (120)","View All (120)"]
    
    private let sectionTitles = ["How much does your service cost?","How much does your service cost?","How much does your service cost?"]
    
    private let sectionTitles_message = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard"]
    
    var thereIsCellTapped = false
    var selectedRowIndex = -1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        FAQVC_UI()
        
        // Auto resizing the height of the cell
        faqList_tableView.estimatedRowHeight = 70.0
        faqList_tableView.rowHeight = UITableView.automaticDimension
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

    //MARK: table view datasource and dalegates method
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.text = sectionHeaderTitle[section]
        label.frame = CGRect(x: 20, y: 5, width: 300, height: 45)
        label.font = UIFont.appBoldFontWith(size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .white
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
    
    /*func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }*/
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == selectedRowIndex && thereIsCellTapped {
            return 150
        }
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQsTVCell") as! FAQsTVCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.backgroundColor = UIColor.clear
        
        let origImage1 = UIImage(named: "downArrow")
        let tintedImage1 = origImage1?.withRenderingMode(.alwaysTemplate)
        cell.statusButton.setImage(tintedImage1, for: .normal)
        cell.statusButton.tintColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        cell.titleLabel.text = sectionTitles[indexPath.row]
        cell.answer_textView.text = sectionTitles_message[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if selectedRowIndex != indexPath.row
        {
            self.thereIsCellTapped = true
            self.selectedRowIndex = indexPath.row
        }
        else
        {
            self.thereIsCellTapped = false
            self.selectedRowIndex = -1
        }
        faqList_tableView.reloadRows(at: [indexPath], with: .fade)
    }

}
