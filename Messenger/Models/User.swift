//
//  User.swift
//  Messenger
//
//  Created by mpc on 10/17/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

struct User {
    var userId: ID
    var user: String
    var db: String
    var roles: [[String : String]] = [[:]]
    var createdDateTime: Date?
    var updatedDateTime: Date?
    
    init(userId: String = "", user: String = "", db: String = "") {
        self.userId = userId
        self.user = user
        self.db = db
    }
}
