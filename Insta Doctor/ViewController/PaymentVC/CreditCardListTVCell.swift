//
//  CreditCardListTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 05/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class CreditCardListTVCell: UITableViewCell {

    @IBOutlet weak var CreditCard_view: UIView!
    @IBOutlet weak var card_expiryDate_textField: UITextField!
    @IBOutlet weak var cardHolderName_textField: UITextField!
    @IBOutlet weak var CreditCard_AccountNumber_textField_1: UITextField!
    @IBOutlet weak var CreditCard_AccountNumber_textField_2: UITextField!
    @IBOutlet weak var CreditCard_AccountNumber_textField_3: UITextField!
    @IBOutlet weak var CreditCard_AccountNumber_textField_4: UITextField!
    @IBOutlet weak var activeinactive_view: UIView!
    @IBOutlet weak var activeinactiveHeading_label: UILabel!
    @IBOutlet weak var edit_view: UIView!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        CreditCard_view.backgroundColor = .clear

    }

}
