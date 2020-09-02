//
//  HomeVC.swift
//  Interests
//
//  Created by Pierce Tu on 3/4/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var interests = Interest.createInterests()
    
    fileprivate struct Storyboard {
        static let cellIdentifier = "InterestCell"
    }
    
    var isFlipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

// MARK: - CollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as! InterestCollectionViewCell
        cell.interest = interests[indexPath.item]
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:))))

        return cell
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        guard let indexPath = self.collectionView.indexPathForItem(at: location) else { return }

        if isFlipped {
            // Back side
            isFlipped = false
            UICollectionViewCell.transition(with: collectionView.cellForItem(at: indexPath)!, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], animations: nil, completion: nil)
        } else {
            // Front side
            isFlipped = true
            UICollectionViewCell.transition(with: collectionView.cellForItem(at: indexPath)!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], animations: nil, completion: nil)
        }
    }
}

// MARK: - UIScrollViewDelegate
extension HomeVC: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithSpace = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpace
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthWithSpace - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    }
}
