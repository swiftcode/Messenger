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
    
    
    func displayCurrentMessage() {
        self.title = screenTitle ?? ""
        currentMessageText.isEditable = false
        
        guard
            let currentTopic = currentTopic,
            let currentMessage = currentMessage else {
                self.currentMessageText.text = ""
                self.currentMessageText.isHidden = true
                return
        }
        
        let message = "\(currentTopic)\n\(currentMessage)"
        self.currentMessageText.text = message
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        displayCurrentMessage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
