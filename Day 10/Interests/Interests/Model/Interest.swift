//
//  Interest.swift
//  Interests
//
//  Created by Pierce Tu on 3/4/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class Interest {
    var id = ""
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    var isFlipped = false
    
    init(id: String, title: String, description: String, featuredImage: UIImage!, numberOfMembers: Int, numberOfPosts: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        self.numberOfMembers = numberOfMembers
        self.numberOfPosts = numberOfPosts
    }
    
    static func createInterests() -> [Interest] {
        return [
          Interest(id: "01", title: "Travel", description: "TRAVEL. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "Travel")!, numberOfMembers: 100, numberOfPosts: 1000),
          Interest(id: "02", title: "Romance", description: "ROMANCE. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "Romance")!, numberOfMembers: 150, numberOfPosts: 1500),
          Interest(id: "03", title: "Developer", description: "DEVELOPER. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "Developer")!, numberOfMembers: 200, numberOfPosts: 2000),
          Interest(id: "04", title: "Cars", description: "CARS. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "Cars")!, numberOfMembers: 250, numberOfPosts: 2500),
          Interest(id: "05", title: "Gym", description: "GYM. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "Gym")!, numberOfMembers: 300, numberOfPosts: 3000),
          Interest(id: "06", title: "News", description: "NEWS. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", featuredImage: UIImage(named: "News")!, numberOfMembers: 350, numberOfPosts: 3500),
        ]
    }
}
