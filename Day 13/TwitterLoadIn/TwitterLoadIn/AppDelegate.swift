//
//  AppDelegate.swift
//  TwitterLoadIn
//
//  Created by Pierce Tu on 4/24/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate {

    var window: UIWindow?
    var mask: CALayer?
    var imageView: UIImageView?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        if let window = window {
//             Load in twitter feed
            imageView = UIImageView(frame: window.frame)
            imageView!.image = UIImage(named: "Feed")
            imageView?.isHidden = true
            window.addSubview(imageView!)
            
            // Load in twitter icon
            mask = CALayer()
            mask?.contents = UIImage(named: "Icon")?.cgImage
            mask?.position = window.center
            mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
            imageView!.layer.mask = mask

            animateMask()
            
            window.rootViewController = UIViewController()
            window.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
            window.makeKeyAndVisible()
        }

        return true
    }

    func animateMask() {
        // Frame animation init
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1

        // Animate zoom in and then zoom out
        let initalBounds = NSValue(cgRect: mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 64))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]

        // Animation time interval
        keyFrameAnimation.keyTimes = [0, 0.5, 1.5]

        // Animate in view
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        mask!.add(keyFrameAnimation, forKey: "bounds")
        
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView?.layer.mask = nil
    }
}

