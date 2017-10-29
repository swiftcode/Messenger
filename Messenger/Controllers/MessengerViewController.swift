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
    
    //A scrollview that displays latest information, etc
    @IBOutlet weak var newsScroller: UIScrollView!
    @IBOutlet weak var newsTextView: UITextView!
    
    var posts = [Post]()
    var selectedRow: Int?
    var selectedReplyToId: ID?
    
    
    //MARK: - IBActions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "NewMessageIdentifier", sender: nil)
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {}
    
    private func setScreenAttributes() {
        //Set the appearance of the buttons
        menuButton.tintColor = .white
        addButton.tintColor = .white
        
        //Set the title text
        self.title = ScreenTitle.posts
        
        //Set the controllerView properties
        controllerView.backgroundColor = AppColor.cdgPurple
    
        //Set the news ticker properties
        newsTextView.backgroundColor = AppColor.cdgPurple
        newsTextView.textColor = .white
        newsTextView.font = UIFont.boldSystemFont(ofSize: 18.0)
        newsTextView.isEditable = false
        newsTextView.isSelectable = false
        
        //Do not have a blank space at top of screen
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScreenAttributes()
        posts = createPosts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewMessageIdentifier" {
            let vc = segue.destination as! MessageViewController
            vc.screenTitle = ScreenTitle.newPosts
        } else if segue.identifier == "ReplyIdentifier" {
            let vc = segue.destination as! MessageViewController
            vc.screenTitle = ScreenTitle.reply
            
            if let selectedRow = self.selectedRow {
                vc.currentTopic = posts[selectedRow].topic
                vc.currentMessage = posts[selectedRow].message
            }
        }
    }
}

extension MessengerViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Editing actions
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            //Display an alert controller to make sure the user wants to logout
            let alert = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this post?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (alert: UIAlertAction!) -> Void in
                
                self.posts.remove(at: indexPath.row)
                tableView.reloadData()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert: UIAlertAction!) -> Void in
                return
            }
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let reply =  UITableViewRowAction(style: .normal, title: "Reply") { (action, indexPath) in
            
            self.selectedRow = indexPath.row
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ReplyIdentifier", sender: nil)
            }
        }
        
        reply.backgroundColor = AppColor.green
        
        return [reply, delete]
    }
    
    //MARK: - Tableview delegates
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if posts[indexPath.row].replyToId != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReplyToId = posts[indexPath.row].id
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        selectedReplyToId = nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedReplyToId != nil &&
           posts[indexPath.row].replyToId == selectedReplyToId {
            return 70
        } else if posts[indexPath.row].replyToId != nil {
            return 0
        } else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messengerCell") as! MessengerTableViewCell
        let row = indexPath.row
        
        if posts[row].replyCount > 0 {
            cell.accessoryType = .disclosureIndicator
        }
        
        if posts[row].replyToId != nil {
            let replyColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 232 / 255, alpha: 1.0)
            cell.backgroundColor = replyColor
            cell.senderName.backgroundColor = .clear
            cell.subject.backgroundColor = .clear
            cell.datePosted.backgroundColor = .clear
        }
        
        cell.senderName.text = posts[row].email
        cell.subject.text =  posts[row].topic
        cell.datePosted.text = Date().microDate + " " + Date().shortTime

        return cell
    }
}


