//
//  WhichDrugAllergyTextFieldTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 09/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class WhichDrugAllergyTextFieldTVCell: UITableViewCell {

    @IBOutlet weak var cell_horizontal_Label_1: UILabel!
    @IBOutlet weak var cell_DrugName_textField: UITextField!
    @IBOutlet weak var cell_containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        cell_containerView.backgroundColor = .white
    }

}
