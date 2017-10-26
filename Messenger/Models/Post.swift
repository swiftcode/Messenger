//
//  Post.swift
//  Messenger
//
//  Created by mpc on 10/17/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

typealias ID = String

struct Post {
    var id: ID
    var topic: String
    var message: String
    var email: String
    var replyToId: ID?
    var createdDateTime: Date?
    var updatedDateTime: Date?
    
    
    init(id: String = "",
         topic: String = "",
         message: String = "",
         email: String = "",
         replyToId: ID? = nil) {
        self.id = id
        self.topic = topic
        self.message = message
        self.email = email
        
        if let replyToId = replyToId {
            self.replyToId = replyToId
        }
        
        self.createdDateTime = Date()
        self.updatedDateTime = Date()
    }
}
