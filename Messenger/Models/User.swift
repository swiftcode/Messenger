//
//  User.swift
//  Messenger
//
//  Created by mpc on 10/17/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var user: String
    var db: String
    var roles: [[String : String]] = [[:]]
    
    init(id: String = "", user: String = "", db: String = "") {
        self.id = id
        self.user = user
        self.db = db
    }
}
