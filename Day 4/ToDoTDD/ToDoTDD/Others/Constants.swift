//
//  Constants.swift
//  ToDoTDD
//
//  Created by Pierce Tu on 10/24/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import Foundation

struct Constants {
    static let MainBundleIdentifer = "Main"
    static let ItemListViewControllerIdentifier = "ItemListViewController"
    static let DetailViewControllerIdentifier = "DetailViewController"
    static let InputViewControllerIndentifier = "InputViewController"
    
    static let ItemCellIdentifier = "ItemCell"
    
    static let userName = "Crystal"
    static let password = "1234"
}

extension Notification {
    static let ItemSelectedNotification = Notification.Name("ItemSelectedNotification")
}

