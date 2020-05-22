//
//  DoctorDetailsTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class DoctorDetailsTVCell: UITableViewCell {

    @IBOutlet weak var cell_containerView: UIView!
    @IBOutlet weak var cell_doctorImage: UIImageView!
    @IBOutlet weak var cell_doctorName: UILabel!
    @IBOutlet weak var floatRatingView_cell: FloatRatingView!
    @IBOutlet weak var cell_comment: UILabel!
    
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
