//
//  ManagePageViewController.swift
//  PhotoScroll
//
//  Created by Pierce Tu on 4/11/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class ManagePageViewController: UIPageViewController {
    var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var info = ["snow", "people", "more snow", "slow", "lift"]
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let viewController = viewPhotoLabelController(index: currentIndex ?? 0) {
            let viewControllers = [viewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        }
    }
    
    func viewPhotoLabelController(index: Int) -> PhotoInfoViewController? {
        if let storyboard = storyboard,
            let page = storyboard.instantiateViewController(withIdentifier: "PhotoInfoViewController") as? PhotoInfoViewController {
            page.photoName = photos[index]
            page.photoInfo = info[index]
            page.photoIndex = index
            return page
        }
        return nil
    }
}

extension ManagePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoInfoViewController {
            guard let index = viewController.photoIndex, index != 0 else {
                return nil
            }
            return viewPhotoLabelController(index: index - 1)
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoInfoViewController {
            guard let index = viewController.photoIndex, index != photos.count - 1 else {
                return nil
            }
            return viewPhotoLabelController(index: index + 1)
        }
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return photos.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex ?? 0
    }
}


