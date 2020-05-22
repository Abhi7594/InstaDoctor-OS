//
//  ContactInformantionVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 04/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

var contactInfo_updatedAddress = ""
var contactInfo_updatedAddress2 = ""
var contactInfo_updatedCity = ""
var contactInfo_updatedState = ""
var contactInfo_updatedZipcode = ""
var contactInfo_ImageBaseString = ""

class ContactInformantionVC: UIViewController {

    @IBOutlet weak var container_view: UIView!
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contactInformationHeading_view: UIView!
    @IBOutlet weak var contactInformationHeading_label: UILabel!
    @IBOutlet weak var profileImage_view: UIView!
    @IBOutlet weak var address_view: UIView!
    @IBOutlet weak var edityourAddress_view: UIView!
    @IBOutlet weak var phoneNumber_view: UIView!
    @IBOutlet weak var email_view: UIView!
    @IBOutlet weak var saveContactInformation_view: UIView!
    @IBOutlet weak var userImage_imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var addressHeading_label: UILabel!
    @IBOutlet weak var editYourAddress_Button: UIButton!
    @IBOutlet weak var phoneNumber_heading_label: UILabel!
    @IBOutlet weak var phoneNumber_textfield: UITextField!
    @IBOutlet weak var phoneNumberEditButton: UIButton!
    @IBOutlet weak var horizontal_Label_1: UILabel!
    @IBOutlet weak var email_heading_label: UILabel!
    @IBOutlet weak var email_textfield: UITextField!
    @IBOutlet weak var editEmail_button: UIButton!
    @IBOutlet weak var horizontal_label_2: UILabel!
    @IBOutlet weak var saveContactInformationButton: UIButton!
    
    @IBOutlet weak var viewMap: UIView!
    /*@IBOutlet weak var viewMap: GMSMapView!
    var googleMapsView:GMSMapView!
    var gmsFetcher: GMSAutocompleteFetcher!
    var locationManager = CLLocationManager()*/
    
    var userImageBaseString = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        ContactInformantionVC_UI()
        
        email_textfield.delegate = self
        phoneNumber_textfield.delegate = self
        
        email_textfield.isUserInteractionEnabled = false
        phoneNumber_textfield.isUserInteractionEnabled = false
        
        email_textfield.text = UserDefaults.standard.string(forKey: "PATIENT_EMAILID")?.lowercased()
        //googleMAPSetUp()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    //MARK: Button Action first view
    @IBAction func backButton_Action(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveContactInformationButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateEmailConfirmationVC") as! UpdateEmailConfirmationVC
        //self.navigationController?.pushViewController(vc, animated: true)
        vc.updatedEmail = email_textfield.text!
        vc.updatedPhone = phoneNumber_textfield.text!
        vc.updatedAddress = contactInfo_updatedAddress
        vc.updatedAddress2 = contactInfo_updatedAddress2
        vc.updatedCity = contactInfo_updatedCity
        vc.updatedState = contactInfo_updatedState
        vc.updatedZipcode = contactInfo_updatedZipcode
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func editEmailButton_Action(_ sender: Any)
    {
        email_textfield.isUserInteractionEnabled = true
    }
    
    @IBAction func editPhoneNumberButton_Action(_ sender: Any)
    {
        phoneNumber_textfield.isUserInteractionEnabled = true
    }
    
    @IBAction func editYourAddressButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateAddressVC") as! UpdateAddressVC
        //self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cameraButton_Action(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GalleryCameraSelectVC") as! GalleryCameraSelectVC
        //self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: Google Map Setup Method
    /*func googleMAPSetUp()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        self.googleMapsView = GMSMapView (frame: self.viewMap.frame)
        self.googleMapsView.settings.compassButton = true
        self.googleMapsView.isMyLocationEnabled = true
        self.googleMapsView.settings.myLocationButton = true
        self.view.addSubview(self.googleMapsView)
        gmsFetcher = GMSAutocompleteFetcher()
    }
    
    // MARK: Calling Google Map Function & Method
    func createMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.title = titleMarker
        marker.icon = iconMarker
        marker.map = googleMapsView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 16.0)
        
        self.googleMapsView?.animate(to: camera)
        self.googleMapsView.camera = camera
        self.googleMapsView.isMyLocationEnabled = true
        locationManager.startUpdatingLocation()
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool)
    {
        mapView.clear()
    }
    */
    
}
