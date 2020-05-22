//
//  TermConditionTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 07/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class TermConditionTVCell: UITableViewCell {

    @IBOutlet weak var cell_containerView: UIView!
    @IBOutlet weak var cell_itemName_label: UILabel!
    @IBOutlet weak var cell_forwardButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
