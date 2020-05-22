
import UIKit


extension UIColor
{
    
    class func loginTextField() -> UIColor
    {
        return UIColor(red: 197/255.0, green: 205/255.0, blue: 225/255.0, alpha: 1.0)
    }
    class func sliderHighlight() -> UIColor
    {
        return Image.navigationImage //UIColor(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
    }
    class func tabBarColor() -> UIColor
    {
        return UIColor(red: 42/255, green: 69/255, blue: 150/255, alpha: 1.0)
    }
    class func textFieldBorder() -> UIColor
    {
        return UIColor(red: 150/255, green: 151/255, blue: 152/255, alpha: 1.0)
    }
    class func imageViewBorder() -> UIColor
    {
        return UIColor(red: 212/255, green: 213/255, blue: 214/255, alpha: 1.0)
    }
    class func obmYellow() -> UIColor
    {
        return UIColor(red: 253/255, green: 215/255, blue: 69/255, alpha: 1.0)
    }
    class func obmGrey() -> UIColor
    {
        return UIColor(red: 244/255, green: 245/255, blue: 246/255, alpha: 1.0)
    }
    
}

extension UIFont
{
    class func textRegularFont(fontSize: CGFloat) -> UIFont
    {
        let font = UIFont(name: "EMprint-Regular", size: fontSize)!
        return font
    }

}

extension UIViewController
{
    
    func alert(message: String, title: String = "")
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}


