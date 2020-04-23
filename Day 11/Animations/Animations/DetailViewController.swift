//
//  DetailViewController.swift
//  Animations
//
//  Created by Pierce Tu on 3/14/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var barTitle = ""
    var state = false
    var animateView: UIView!
    
    let duration = 2.0
    let delay = 0.2
    let scale = 1.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRect()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = barTitle
    }
    
    func setupRect() {
        if barTitle == "BezierCurve Position" {
            animateView = drawCircleView()
        } else if barTitle == "View Fade In" {
            animateView = UIImageView(image: UIImage(named: "Developer"))
            animateView.frame = generalFrame
            animateView.center = generalCenter
        } else {
            animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
        }
        view.addSubview(animateView)
    }
    
    @IBAction func buttonAnimate(_ sender: Any) {
        switch title! {
        case "2-Color":
            if state == false {
                changeColor(UIColor.green)
            } else {
                changeColor(UIColor.red)
            }
        
        case "Simple 2D Rotation":
            rotateView(Double.pi)
            
            
        case "View Fade In":
            if state == false {
                viewFadeIn()
            } else {
                viewFadeOut()
            }
            
        default:
            let alert = makeAlert("Alert", message: "The animation has not be added yet", actionTitle: "OK")
            self.present(alert, animated: true, completion: nil)
        }
        print("bartitle: \(title!)")
    }
    
    func changeColor(_ color: UIColor) {
        // Disable multiple presses of button while animation is happening
        self.view.isUserInteractionEnabled = false
        UIView.animate(withDuration: duration, animations: { self.animateView.backgroundColor = color }, completion: { finished in
            if finished {
                self.view.isUserInteractionEnabled = true
            }
        })
        state = !state
    }
    
    func rotateView(_ angel: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [.repeat], animations: {
            self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        }, completion: nil)
    }
    
    func viewFadeIn() {
        // Disable multiple presses of button while animation is happening
        self.view.isUserInteractionEnabled = false
        
        let secondView = UIImageView(image: UIImage(named: "News"))
        
        secondView.frame = self.animateView.frame
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: 2.5, delay: 0.05, options: .curveEaseOut ,animations: { 
            secondView.alpha = 1.0
            self.animateView.alpha = 0.0
        }, completion: { finished in
        if finished {
            self.view.isUserInteractionEnabled = true
            }
        })
        state = !state
    }
    
    func viewFadeOut() {
        // Disable multiple presses of button while animation is happening
        self.view.isUserInteractionEnabled = false
        
        let secondView = UIImageView(image: UIImage(named: "Developer"))
        
        secondView.frame = self.animateView.frame
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: 2.5, delay: 0.05, options: .curveEaseOut ,animations: {
            secondView.alpha = 1.0
            self.animateView.alpha = 0.0
        }, completion: { finished in
        if finished {
            self.view.isUserInteractionEnabled = true
            }
        })
        state = !state
    }
    
    func pop() {
        UIView.animate(withDuration: duration / 4,
                       animations: {
                        self.animateView.transform = CGAffineTransform(scaleX: CGFloat(self.scale), y: CGFloat(self.scale))
        }, completion: { finished in
            UIView.animate(withDuration: self.duration / 4, animations: {
                self.animateView.transform = CGAffineTransform.identity
            })
        })
    }
}
