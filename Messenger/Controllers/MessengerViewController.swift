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
    
    
    var posts = [Post]()
    
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
    
    
    private func createPosts() {
        var id = String.idCode()
        var topic = "5K run this weekend"
        var message = "There is a 5K run this weekend at Brookstone Park"
        var email = "jsmith@nowhere.com"
        
        var post = Post(id: id, topic: topic, message: message, email: email)
        posts.append(post)
        
        id = String.idCode()
        topic = "Snow predicted"
        message = "A snow storm is predicted for parts of the east coast"
        email = "newscaster@news.com"
        post = Post(id: id, topic: topic, message: message, email: email)
        posts.append(post)
        
        id = String.idCode()
        topic = "5K run this weekend"
        message = "Sounds great.  I'll be there."
        email = "runningman@running.com"
        post = Post(id: id, topic: topic, message: message, email: email)
        posts.append(post)
        
        posts.sort { ($0.topic) < ($1.topic) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScreenAttributes()
        createPosts()
    }
}

extension MessengerViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Editing actions
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            showAlert("Delete", message: "Delete button pressed", viewController: self)
        }
        
        let reply =  UITableViewRowAction(style: .normal, title: "Reply") { (action, indexPath) in
            self.performSegue(withIdentifier: "ReplyIdentifier", sender: nil)
        }
        
        reply.backgroundColor = AppColor.green
        
        return [reply, delete]
    }
    
    
    //MARK: - Tableview delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messengerCell") as! MessengerTableViewCell
        
        let row = indexPath.row
        
        print("\(posts[row].id) \(posts[row].email) \(posts[row].topic)")
        
        cell.senderName.text = posts[row].email
        cell.subject.text =  posts[row].topic
        cell.datePosted.text = Date().microDate + " " + Date().shortTime

        return cell
    }
}


