//
//  ProductsViewController.swift
//  GoodAsOldPhones
//
//  Created by Pierce Tu on 7/14/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation
import UIKit

class ProductsViewController: UIViewController {
    
    var product: Product?
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productLabel.text = product?.name
        
        if let imageName = product?.fullScreenImageName {
            productImage.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        print("Added to cart successfully!")
    }
    
}
