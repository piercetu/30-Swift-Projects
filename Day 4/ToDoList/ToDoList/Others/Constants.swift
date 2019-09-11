//
//  Constants.swift
//  ToDoList
//
//  Created by Pierce Tu on 9/9/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation

struct Constants {
    static let MainBundleIdentifier = "Main"
    
    static let ItemListViewControllerIdentifier = "ItemListViewController"
    static let DetailViewControllerIdentifier = "DetailViewController"
    static let inputViewControllerIdentifier = "InputViewController"
    
    static let ItemCellIdentifier = "ItemCell"
    
    static let username = "Pierce"
    static let password = "test1234"
}

extension Notification {
    static let ItemSelectedNotification = Notification.Name("ItemSelectedNotification")
}

