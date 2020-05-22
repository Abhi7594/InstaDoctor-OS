//
//  SelectYourSymptomsTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 08/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class SelectYourSymptomsTVCell: UITableViewCell {

    @IBOutlet weak var cell_container_view: UIView!
    @IBOutlet weak var sympotmsName_label: UILabel!
    @IBOutlet weak var selectionImage_imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        cell_container_view.layer.cornerRadius = 20.0
        cell_container_view.clipsToBounds = true
    }

}
