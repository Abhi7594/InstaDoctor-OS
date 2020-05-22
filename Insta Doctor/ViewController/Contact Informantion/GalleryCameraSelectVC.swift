//
//  GalleryCameraSelectVC.swift
//  Insta Doctor
//
//  Created by Abhishek Rathod on 06/05/20.
//  Copyright © 2020 Aximo. All rights reserved.
//

import UIKit

class GalleryCameraSelectVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var selectPhotoFromGalleryCameraImage_view: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var selectFromGalleryButton: UIButton!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var cameraIcon: UIImageView!
    @IBOutlet weak var takePhoto_label: UILabel!
    @IBOutlet weak var top_view: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    let picker = UIImagePickerController()
    var image_baseString = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupOnLoad()
    }
    
    //MARK: Healper Method
    func setupOnLoad()
    {
        self.navigationController?.isNavigationBarHidden = true
        
        GalleryCameraSelectVC_UI()
        
        backButton.isHidden = true
        
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        // 2. add the gesture recognizer to a view
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer)
    {
        self.dismiss(animated: true, completion: nil)
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
    
    @IBAction func selectPhotofromgalleryButton_Action(_ sender: Any)
    {
        takeGallery() //chooseFromGallery()
    }
    @IBAction func takePhotoButton_Action(_ sender: Any)
    {
       takeCamera() //takePhoto()
    }
    
    // MARK: image picker code
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!)
    {
        let pickedImage = editingInfo[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let jpegCompressionQuality: CGFloat = 0.75
        let base64String = image.jpegData(compressionQuality: jpegCompressionQuality)?.base64EncodedString()
       
        image_baseString = base64String!
        userImage.image = pickedImage
        print("FUCK YOU\(base64String!)")
        /*let selectedImage : UIImage = image
        var tempImage:UIImage = editingInfo[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imageData:NSData = image.pngData()! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        image_baseString = strBase64
        print(strBase64)
        userImage.image=selectedImage*/
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Image View Delegates
    func takeCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType=UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing=true
            imagePicker.showsCameraControls=true
            imagePicker.cameraCaptureMode = .photo
            self.present(imagePicker,animated: true,completion: nil)
        }
        else
        {
            noCamera()
        }
    }
    func takeGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    /*func chooseFromGallery()
    {
        picker.allowsEditing = true
        picker.sourceType = .savedPhotosAlbum
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!
        present(picker, animated: true, completion: nil)
    }
    func takePhoto()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        }
        else
        {
            noCamera()
        }
    }*/
    func noCamera()
    {
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    
}
