//
//  MessageViewController.swift
//  Messenger
//
//  Created by mpc on 10/19/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit
import AVFoundation

class MessageViewController: UIViewController, UIImagePickerControllerDelegate {

    var screenTitle: String?
    var currentTopic: String?
    var currentMessage: String?
    
    //For camera capture
    var captureSession: AVCaptureSession?
    
    @IBOutlet var currentMessageText: UITextView!
    @IBOutlet weak var replyingToLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBAction func cameraButtonPressed(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
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
