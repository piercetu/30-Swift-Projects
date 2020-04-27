//
//  ViewController.swift
//  SpotifyLogin
//
//  Created by Pierce Tu on 4/24/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var spotifyIcon: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI() {
        // Spotify Icon
        if let myImage = UIImage(named: "Image") {
            let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
            spotifyIcon.image = tintableImage
        }
        
        spotifyIcon.tintColor = UIColor.white
        
        // Sign Up Button
        signUpButton.layer.cornerRadius = 22
        
        // Login Button
        loginButton.layer.cornerRadius = 22
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.lightGray.cgColor

        // Video Background
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = false
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
    }


}

