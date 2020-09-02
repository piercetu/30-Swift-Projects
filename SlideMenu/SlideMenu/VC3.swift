//
//  VC3.swift
//  SlideMenu
//
//  Created by Pierce Tu on 4/27/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class VC3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
