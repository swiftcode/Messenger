//
//  MessageViewController.swift
//  Messenger
//
//  Created by mpc on 10/19/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit
import AVFoundation

class MessageViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    var screenTitle: String?
    var currentTopic: String?
    var currentMessage: String?
    
    //For camera capture
    var captureSession: AVCaptureSession?
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var currentMessageText: UITextView!
    @IBOutlet weak var replyingToLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    
    /***
    @IBAction func saveButt(sender: AnyObject) {
        var imageData = UIImageJPEGRepresentation(imagePicker.image, 0.6)
        var compressedJPGImage = UIImage(data: imageData)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage, nil, nil, nil)
        
        var alert = UIAlertView(title: "Saved",
                                message: "Your image has been saved to the photo library",
                                delegate: nil,
                                cancelButtonTitle: "Ok")
        alert.show()
    }
    
    @IBAction func cameraButtonPressed(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(imagePicker.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.image = image
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        dismiss(animated:true, completion: nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    ***/
    
    func displayCurrentMessage() {
        self.title = screenTitle ?? ""
        currentMessageText.isEditable = false
        currentMessageText.backgroundColor = .clear
        
        guard
            let currentTopic = currentTopic,
            let currentMessage = currentMessage else {
                DispatchQueue.main.async {
                    self.currentMessageText.text = ""
                    self.currentMessageText.isHidden = true
                    self.replyingToLabel.isHidden = true
                }

                return
        }
        
        let message = "Subject: \(currentTopic)\n\n\(currentMessage)"
        
        DispatchQueue.main.async {
            self.currentMessageText.text = message
            self.currentMessageText.layer.borderWidth = 0.8
            self.currentMessageText.layer.borderColor = UIColor.black.cgColor
            self.currentMessageText.layer.cornerRadius = 5.0
            
            self.replyingToLabel.layer.borderWidth = 0.8
            self.replyingToLabel.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraButton.setImage(UIImage(named: "camera2.png"), for: .normal)
        cameraButton.layer.cornerRadius = cameraButton.frame.height * 0.5
        cameraButton.clipsToBounds = true
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.displayCurrentMessage()
    }
}
