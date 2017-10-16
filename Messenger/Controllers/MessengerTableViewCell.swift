//
//  MessengerTableViewCell.swift
//  Messenger
//
//  Created by mpc on 10/15/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit

class MessengerTableViewCell: UITableViewCell {

    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
