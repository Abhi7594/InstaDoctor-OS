

import Foundation
import UIKit

//MARK: Alert Message for Whole Classes

extension UIViewController
{
    func addToCartAlertmessage()
    {
//        present(UIAlertController.alertWithTitle(title: "", message: AlertMessage.addToCartMessage, buttonTitle: "OK"), animated: true, completion: nil)
    }
    
    func showAlertOK(title: String , message : String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func productPaymentSuccessAlertmessage()
    {
//        let alertController = UIAlertController(title: nil, message: AlertMessage.aproductPaymentSucessMessage, preferredStyle: .alert)
//        let OKAction = UIAlertAction(title: AlertButtonTitle.track, style: .default) { (action:UIAlertAction!) in
//
//            let dashVC = self.storyboard?.instantiateViewController(withIdentifier: "YUTabBarVC") as! YUTabBarVC
//            dashVC.selectedIndex = 1
//            self.navigationController?.pushViewController(dashVC, animated: true)
//        }
//        alertController.addAction(OKAction)
//        self.present(alertController, animated: true, completion:nil)
    }
    
    

}
