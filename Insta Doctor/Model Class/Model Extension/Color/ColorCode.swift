

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

//MARK: COLOR
class Color
{
    static var statusBarColor = UIColor(hex: "ffffff")
    
    static var black = UIColor(hex: "000000")
    static var white = UIColor.white
    static var buttonColor = UIColor(hex: "1d7AF3")
    static var cancleButtonColor = UIColor(hex: "ea5b31")
    static var addToCartButtonColor = UIColor(hex: "ff8a22")
    static var addToCartCountButtonColor = UIColor(hex: "1bbc7e")
    
    static var color1 = UIColor(hex: "#730017")
    static var color2 = UIColor(hex: "#0d1730")
}

//MARK:  Navigation Bar COLOR
class Navigation_Bar_Color
{
    static var navigationBGColor = UIColor.white
    static var navigationColor = UIColor(hex: "3A7fc2")
    
}

//MARK: COLOR
class BorderColor
{
    static var  quantityBorder = UIColor.darkGray.cgColor
    static var  quantityMinusButtonBGColor = UIColor.clear
    static var  quantityPlusButtonBGColor = UIColor.clear
    static var  quantityValueLabelBGColor = UIColor.white
    static var  quantityVerticalLine = UIColor.darkGray
}


//MARK: Shadow Color
class Shadow
{
    static var  cellShadowColor = UIColor.lightGray.cgColor
    static var  clear = UIColor.clear.cgColor
    static var  lightText = UIColor.lightText.cgColor
}
