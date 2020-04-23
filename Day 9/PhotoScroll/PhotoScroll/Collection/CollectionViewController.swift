//
//  CollectionViewController.swift
//  PhotoScroll
//
//  Created by Pierce Tu on 4/11/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    let reuseIdentifier = "PhotoCell"
    let thumbnailSize: CGFloat = 70.0
    let sectionInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView?.indexPath(for: cell),
            let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController {
            zoomedPhotoViewController.photoName = "photo\(indexPath.row + 1)"
            }
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell),
            let photoInfoViewController = segue.destination as? PhotoInfoViewController {
            photoInfoViewController.photoName = "photo\(indexPath.row + 1)"
            photoInfoViewController.photoInfo = "\(indexPath.row + 1)"
            }
        
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell),
            let managePageViewController = segue .destination as? ManagePageViewController {
            managePageViewController.photos = photos
            managePageViewController.currentIndex = indexPath.row
        }
    }
}

extension CollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let fullSizedImage = UIImage(named: photos[indexPath.row])
        cell.imageView.image = fullSizedImage?.thumbnailOfSize(thumbnailSize)
        
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: thumbnailSize, height: thumbnailSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
