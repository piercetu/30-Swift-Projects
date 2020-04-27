//
//  ViewController.swift
//  QuoraLoadScreen
//
//  Created by Pierce Tu on 4/23/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dotOne: UIImageView!
    @IBOutlet weak var dotTwo: UIImageView!
    @IBOutlet weak var dotThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beginAnimation()
    }
    
    func beginAnimation() {
        dotOne.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dotTwo.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        dotThree.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.repeat, .autoreverse], animations: { self.dotOne.transform = CGAffineTransform.identity }, completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 0.2, options: [.repeat, .autoreverse], animations: { self.dotTwo.transform = CGAffineTransform.identity }, completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 0.4, options: [.repeat, .autoreverse], animations: { self.dotThree.transform = CGAffineTransform.identity }, completion: nil)
        
    }


}

