//
//  HomeTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 03/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class HomeTVCell: UITableViewCell {

    @IBOutlet weak var cell_containerView: UIView!
    @IBOutlet weak var cell_activeInactive_view: UIView!
    @IBOutlet weak var floatRatingView_cell: FloatRatingView!
    @IBOutlet weak var doctorImage_imageView: UIImageView!
    @IBOutlet weak var doctorName_Label: UILabel!
    @IBOutlet weak var doctorDesignation_Label: UILabel!
    @IBOutlet weak var activeInactive_Label: UILabel!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var rattingCount_Label: UILabel!
    @IBOutlet weak var horizontal_Label: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        cell_containerView.backgroundColor = .white
        
    }
    

}
