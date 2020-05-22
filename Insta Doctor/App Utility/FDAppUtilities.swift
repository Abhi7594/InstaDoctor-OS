

import UIKit


func trimWhiteSpace(str: String) -> String
{
    let trimmedString = str.trimmingCharacters(in: NSCharacterSet.whitespaces)
    return trimmedString
}

func win_width() -> CGFloat
{
    let bounds = UIScreen.main.bounds
    let width = bounds.size.width
    return width
}

func win_height() -> CGFloat
{
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    return height
}

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate


//MARK: Toolbar method
extension UIViewController: UITextFieldDelegate
{
    func addToolBar(textField: UITextField, title : String)
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(UIViewController.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(UIViewController.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc func donePressed()
    {
        view.endEditing(true)
    }
    
    @objc func cancelPressed()
    {
        view.endEditing(true)
    }
}

extension UIViewController: UITextViewDelegate
{
    func addToolBarToTextView(textField: UITextView, title : String)
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(UIViewController.doneClicked))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(UIViewController.cancelClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked()
    {
        view.endEditing(true)
    }
    
    @objc func cancelClicked()
    {
        view.endEditing(true)
    }
}

extension UIAlertController
{
    static func alertWithTitle(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(action)
        return alertController
    }
}


extension String
{
    subscript(r: Range<Int>) -> String?
    {
        get {
            let stringCount = self.count as Int
            if (stringCount < r.upperBound) || (stringCount < r.lowerBound)
            {
                return nil
            }
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
            return String(self[(startIndex ..< endIndex)])
        }
    }
    
    func containsAlphabets() -> Bool
    {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains( where: {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        })
    }
}


