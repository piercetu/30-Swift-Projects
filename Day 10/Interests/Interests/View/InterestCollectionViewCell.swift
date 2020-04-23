//
//  InterestCollectionVC.swift
//  Interests
//
//  Created by Pierce Tu on 3/4/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    @IBOutlet var frontSide: UIVisualEffectView!
    @IBOutlet var backSide: UIVisualEffectView!
    
    var isFlipped = true
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        cellLabel.text = interest.title
        cellDescription.text = interest.description
        cellImage.image = interest.featuredImage
    }
    
    func flipToFront() {
//        UIView.transition(from: backSide, to: frontSide, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        frontSide.isHidden = false
        backSide.isHidden = true
    }
    
    func flipToBack() {
//        UIView.transition(from: frontSide, to: backSide, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        frontSide.isHidden = true
        backSide.isHidden = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}
