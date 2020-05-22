//
//  NetworkErrorMessage.swift
//  WC CarPool
//
//  Created by Aximo on 26/03/18.
//  Copyright © 2018 Webcoir. All rights reserved.
//

import Foundation
import UIKit

class NetworkError:UIViewController
{
    func networkErrormessage()
    {
        let objAlertController = UIAlertController(title: "Network Error", message: nil, preferredStyle: UIAlertController.Style.alert)
        let objAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:
        {
            (action) -> Void in
        })
        objAlertController.addAction(objAction)
        self.present(objAlertController, animated: true, completion: nil)
    }
}
