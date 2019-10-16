//
//  ToDoItemManager.swift
//  ToDoList
//
//  Created by Pierce Tu on 9/9/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation
import UIKit

class ToDoItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count}

    private var toDoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    // plist
    var toDoPathURL: URL {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let documentURL = fileURLs.first else {
            fatalError("Something went wrong. Documents url could not be found")
        }
        
        return documentURL.appendingPathComponent("toDoItems.plist")
    }
    
    // Create Notification Observer
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(save), name: UIApplication.willResignActiveNotification, object: nil)
        
        if let nsToDoItems = NSArray(contentsOf: toDoPathURL) {
            for dict in nsToDoItems {
                if let toDoItem = ToDoItem(dict: dict as! [String: Any]) {
                    toDoItems.append(toDoItem)
                }
            }
        }
    }
    
    // Remove Notification Observer
    deinit {
        NotificationCenter.default.removeObserver(self)
        save()
    }
    
    @objc func save() {
        let nsToDoItems = toDoItems.map { $0.plistDict }
    
        guard nsToDoItems.count > 0 else {
            try? FileManager.default.removeItem(at: toDoPathURL)
            return
        }
        
        do {
            let plistData = try PropertyListSerialization.data(
                fromPropertyList: nsToDoItems,
                format: PropertyListSerialization.PropertyListFormat.xml,
                options: PropertyListSerialization.WriteOptions(0)
            )
            try plistData.write(to: toDoPathURL, options: Data.WritingOptions.atomic)
        } catch {
            print(error)
        }
    }
    
    func add(_ item: ToDoItem) {
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func checkItem(at index: Int) {
        let checkedItem = toDoItems.remove(at: index)
        doneItems.append(checkedItem)
    }
    
    func uncheckItem(at index: Int) {
        let uncheckItem = doneItems.remove(at: index)
        toDoItems.append(uncheckItem)
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
