//
//  Ticker.swift
//  Messenger
//
//  Created by mpc on 10/23/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

struct Ticker {
    var tickerId: ID?
    var postId: ID?
    var nextScheduledNotification: Date?
    var createdDateTime: Date?
    var updatedDateTime: Date?
}
