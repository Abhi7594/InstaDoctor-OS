//
//  UpdateEmail.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 16/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import Foundation

class updateEmailInfo: NSObject
{
    var userEmailID = String()
    var password = String()
    var apiName = "change_email"
}

class updateAddressInfo: NSObject
{
    var address = String()
    var address2 = String()
    var city = String()
    var state = String()
    var zipcode = String()
}

class updateContactInfo: NSObject
{
    var apiName = "change_contact"
    var password = String()
}

class changePasswordInfo: NSObject
{
    var apiName = "change_password"
    var oldPassword = String()
    var NewPassword = String()
    var ConfirmPassword = String()
}
