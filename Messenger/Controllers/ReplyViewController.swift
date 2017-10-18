//
//  ReplyViewController.swift
//  Messenger
//
//  Created by mpc on 10/17/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
   
    private func setupDisplay() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Reply"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
