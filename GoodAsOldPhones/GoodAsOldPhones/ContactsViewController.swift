//
//  ContactsViewController.swift
//  GoodAsOldPhones
//
//  Created by Pierce Tu on 7/14/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewController: UIViewController {
    
    
    @IBOutlet weak var ContactsScrollView: UIScrollView!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            ContactsScrollView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top)
        } else {
            ContactsScrollView.frame = CGRect(x: 0, y: topLayoutGuide.length, width: view.frame.width, height: view.frame.height - topLayoutGuide.length - bottomLayoutGuide.length)
        }
        
        ContactsScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
    
    }
}
