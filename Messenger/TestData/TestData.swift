//
//  TestData.swift
//  Messenger
//
//  Created by mpc on 10/27/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

func createPosts() -> [Post] {
    var posts: [Post] = []
    var post: Post = Post()
    
    var id = String.idCode()
    var topic = "5K run this weekend"
    var message = "There is a 5K run this weekend at Brookstone Park"
    var email = "jsmith@nowhere.com"
    let testReplyId = id
    
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: nil)
    post.replyCount = 2
    posts.append(post)
    
    id = String.idCode()
    topic = "Snow predicted"
    message = "A snow storm is predicted for parts of the east coast"
    email = "newscaster@news.com"
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: nil)
    post.replyCount = 1
    let snowReplyId = id
    
    posts.append(post)
    
    id = String.idCode()
    topic = "5K run this weekend"
    message = "Sounds great.  I'll be there."
    email = "runningman@running.com"
    
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: testReplyId)
    posts.append(post)
    
    id = String.idCode()
    topic = "Favorite recipe"
    message = "Here's a great recipe."
    email = "foodie@foodnetwork.com"
    
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: nil)
    posts.append(post)
    
    
    id = String.idCode()
    topic = "5K run this weekend"
    message = "I'll be there too."
    email = "lurlene@running.com"
    
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: testReplyId)
    posts.append(post)
    
    id = String.idCode()
    topic = "Snow predicted"
    message = "That doesn't sound good."
    email = "ednakrabappel@someplace.com"
    
    post = Post(id: id, topic: topic, message: message, email: email, replyToId: snowReplyId)
    posts.append(post)
    
    //For now sort by title.  Later, sort date submitted + title
    posts.sort { ($0.topic) < ($1.topic) }
    
    return posts
}
