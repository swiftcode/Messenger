//
//  StringExtensions.swift
//  Messenger
//
//  Created by mpc on 10/17/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import Foundation

extension String {
    static func idCode(length: Int = 10) -> String {
        let letters = "B78hZ9abWcCFIjnJKLM4NklmOPQ5RT2X1DE36defGqHgiUYoprVstuSvAwx0yz"
        var code: String = ""
        
        for _ in 0..<length {
            let random = arc4random_uniform(UInt32(letters.characters.count))
            code += "\(letters[letters.index(letters.startIndex, offsetBy: Int(random))])"
        }
        
        return code
    }
}
