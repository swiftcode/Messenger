//
//  Alert.swift
//  Messenger
//
//  Created by mpc on 10/16/17.
//  Copyright © 2017 mpc. All rights reserved.
//

import UIKit

func showAlert(_ title: String = "", message: String = "", viewController: UIViewController) {
    if viewController.presentedViewController == nil {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
