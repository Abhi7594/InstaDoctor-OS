
import Foundation


//MARK: SignupApiParameter Api Parameter
struct SignupApiParameter
{
    static var apiName = "apiname"
    static var patientGender = "patient_gender"
    static var patientPassword = "patient_password"
    static var PatientName = "patient_name"
    static var PatientEmail = "patient_email"
    static var patientDOB = "patient_dob"
    static var deviceID = "device_id"
    static var deviceType = "device_type"
    static var roleID = "role_id"
}

//MARK: LoginApiParameter Api Parameter
struct LoginApiParameter
{
    static var apiName = "apiname"
    static var patientPassword = "patient_password"
    static var PatientEmail = "patient_email"
    static var deviceID = "device_id"
    static var deviceType = "device_type"
    static var roleID = "role_id"
    static var token = "token"
}

//MARK: forgotPasswordApiParameter Api Parameter
struct forgotPasswordApiParameter
{
    static var email = "f_email"
    static var apiName = "apiname"
}


//MARK: updateEmailApiParameter Api Parameter
struct updateEmailApiParameter
{
    static var email = "email"
    static var apiname = "apiname"
    static var token = "token"
}

//MARK: getDoctorListApiParameter Api Parameter
struct getDoctorListApiParameter
{
    static var apiName = "apiname"
    static var token = "token"
}

//MARK: changePasswordApiParameter Api Parameter
struct saveContactInformationApiParameter
{
    static var apiName = "apiname"
    static var token = "token"
    static var old_email = "old_email"
    static var email = "email"
    static var phone = "phone"
    static var address = "address"
    static var address2 = "address2"
    static var city = "city"
    static var state = "state"
    static var zipcode = "zipcode"
    static var password = "password"
}

//MARK: changePasswordApiParameter Api Parameter
struct changePasswordApiParameter
{
    static var apiName = "apiname"
    static var token = "token"
    static var old_password = "old_password"
    static var email = "email"
    static var new_password = "new_password"
}
