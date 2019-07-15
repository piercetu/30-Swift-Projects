//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by Pierce Tu on 7/14/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullScreenImageName: String?
    
    init(name: String, cellImageName: String, fullScreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullScreenImageName = fullScreenImageName
    }
}
