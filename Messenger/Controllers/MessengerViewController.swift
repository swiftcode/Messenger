//
//  MessengerViewController.swift
//  Messenger
//
//  Created by mpc on 10/15/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var controllerView: UIView!
    
    //MARK: - IBActions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    private func setScreenAttributes() {
        //Set the appearance of the buttons
        menuButton.tintColor = .white
        addButton.tintColor = .white
        
        //Set the title text
        self.title = Screen.messagesTitle
        
        //Set the controllerView properties
        controllerView.backgroundColor = AppColor.green
        
        //Do not have a blank space at top of screen
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScreenAttributes()
    }
}

extension MessengerViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Editing actions
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            showAlert("Delete", message: "Delete button pressed", viewController: self)
        }
        
        let reply =  UITableViewRowAction(style: .normal, title: "Reply") { (action, indexPath) in
            showAlert("Reply", message: "Reply button pressed", viewController: self)
        }
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { (action, indexPath) in
            showAlert("Share", message: "Share button pressed", viewController: self)
 
        }
        
        share.backgroundColor = UIColor.blue
        reply.backgroundColor = AppColor.green
        
        return [reply, share, delete]
    }
    
    
    //MARK: - Tableview delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messengerCell") as! MessengerTableViewCell
        cell.senderName.text = "Joe Smith"
        cell.subject.text = "What's new?"
        cell.datePosted.text = Date().microDate + " " + Date().shortTime
        return cell
    }
}


