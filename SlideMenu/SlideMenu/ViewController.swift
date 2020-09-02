//
//  ViewController.swift
//  SlideMenu
//
//  Created by Pierce Tu on 4/26/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var openButton: UIBarButtonItem!
    @IBOutlet weak var aLabel: UILabel!
    
    var varView = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        openButton.target = self.revealViewController()
        openButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if varView == 0 {
            aLabel.text = "hi"
        } else {
            aLabel.text = "bye"
        }
    }


}

