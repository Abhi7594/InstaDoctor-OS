//
//  FAQsTVCell.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 07/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

protocol FAQsTVCellDelegate
{
    func didTapOnMoreButton(cell:FAQsTVCell)
}

class FAQsTVCell: UITableViewCell {

    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    @IBOutlet weak var titleMessageContainer_view: UIView!
    @IBOutlet weak var answer_textView: UITextView!
    
    var delegate:FAQsTVCellDelegate!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func actionViewButtonTapped(_ sender: Any)
    {
        delegate.didTapOnMoreButton(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        container_view.layer.cornerRadius = 20.0
        container_view.clipsToBounds = true
        
        titleMessageContainer_view.layer.cornerRadius = 10.0
        titleMessageContainer_view.clipsToBounds = true
    }

}
