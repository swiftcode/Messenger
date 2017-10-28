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
    var replyCount: [ID : Int] = [ : ]
    
    
    init(id: String = "",
         topic: String = "",
         message: String = "",
         email: String = "",
         replyToId: ID? = nil) {
        self.id = id
        self.topic = topic
        self.message = message
        self.email = email
        self.replyCount = [ : ]
        
        if let replyToId = replyToId {
            self.replyToId = replyToId
        }
        
        self.createdDateTime = Date()
        self.updatedDateTime = Date()
    }
}

extension Post {
    mutating func incrementPostCount(id: ID) {
        if let count = replyCount[id] {
            let newCount = count + 1
            self.replyCount[id] = newCount
        }
    }
    
    mutating func decrementPostCount(id: ID) {
        if let count = replyCount[id] {
            let newCount = count - 1
            self.replyCount[id] = newCount
        }
    }
}
