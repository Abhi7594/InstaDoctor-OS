

import UIKit

func isValidEmail(testStr: String) -> Bool
{
    let emailRegEx = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidMobileNumber(testStr: String) -> Bool
{
    let mobileNoRegEx = "^((\\+)|(00)|(\\*)|())[0-9]{10,14}((\\#)|())$"
    let mobileNoTest = NSPredicate(format:"SELF MATCHES %@", mobileNoRegEx)
    return mobileNoTest.evaluate(with: testStr)
    
}

func isValidName(testStr: String) -> Bool
{
    let nameRegEx = "^[a-zA-Z\\s]+$"
    let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
    return nameTest.evaluate(with: testStr)
    
}
func isValidFirstName(testStr: String) -> Bool
{
    let nameRegEx = "^[a-zA-Z]+$"
    let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
    return nameTest.evaluate(with: testStr)
    
}
func isValidLastName(testStr: String) -> Bool
{
    let nameRegEx = "^[a-zA-Z]+$"
    let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
    return nameTest.evaluate(with: testStr)
    
}

func isValidPassword(testStr: String) -> Bool
{
    let passwordRegEx = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).{8,12}$"
    let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return passwordTest.evaluate(with: testStr)
    
}

func isValidWebAddress(testStr: String) -> Bool
{
    let webRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    let webTest = NSPredicate(format:"SELF MATCHES %@", webRegEx)
    return webTest.evaluate(with: testStr)
    
}

extension CGRect
{
    var wh: (w: CGFloat, h: CGFloat)
    {
        return (size.width, size.height)
    }
}


/* resolution of different i-Phones:(w × h)

4-  320 × 480
5-  320 × 568
6/7-  375 × 667
6+/7+- 414 × 736

*/
