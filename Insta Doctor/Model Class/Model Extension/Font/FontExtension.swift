//
//  FontExtension.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 02/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel
{
    var substituteFontName : String
    {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of:"-Bd") == nil
            {
                self.font = UIFont(name: newValue, size: self.font.pointSize)
            }
        }
    }
    var substituteFontNameBold : String
    {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of:"-Bd") != nil
            {
                self.font = UIFont(name: newValue, size: self.font.pointSize)
            }
        }
    }
}
extension UITextField
{
    var substituteFontName : String
    {
        get { return self.font!.fontName }
        set { self.font = UIFont(name: newValue, size: (self.font?.pointSize)!) }
    }
}

extension UIFont
{
    class func appRegularFontWith( size:CGFloat ) -> UIFont
    {
        return  UIFont(name: Constants.App.PoppinsRegular, size: size)!
    }
    
    class func appBoldFontWith( size:CGFloat ) -> UIFont
    {
        return  UIFont(name: Constants.App.PoppinsBold, size: size)!
    }
}

