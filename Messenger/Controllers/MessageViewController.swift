//
//  MessageViewController.swift
//  Messenger
//
//  Created by mpc on 10/19/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var screenTitle: String?
    var currentTopic: String?
    var currentMessage: String?
    
    @IBOutlet var currentMessageText: UITextView!
    @IBOutlet weak var replyingToLabel: UILabel!
    
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

        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.displayCurrentMessage()
        }
    }
}
