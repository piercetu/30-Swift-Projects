//
//  PhotoInfoViewController.swift
//  PhotoScroll
//
//  Created by Pierce Tu on 4/11/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    
    var photoName: String!
    var photoInfo: String!
    var photoIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoName = photoName {
            imageView.image = UIImage(named: photoName)
            labelInfo.text = photoInfo
        }
        
        let zoomTapGesture = UITapGestureRecognizer(target: self, action: Selector.zoomTap)
        imageView.addGestureRecognizer(zoomTapGesture)
        
    }
    
    @objc func openZoomingController(sender: AnyObject) {
        performSegue(withIdentifier: "zooming", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier,
            let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController {
            if id == "zooming" {
                zoomedPhotoViewController.photoName = photoName
            }
        }
    }
}

private extension Selector {
    static let zoomTap = #selector(PhotoInfoViewController.openZoomingController(sender:))
}
