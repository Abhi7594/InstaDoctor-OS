//
//  LabelHalfColor.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 20/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    func halfTextColorChange (fullText : String , changeText : String )
    {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray , range: range)
        self.attributedText = attribute
    }
}
