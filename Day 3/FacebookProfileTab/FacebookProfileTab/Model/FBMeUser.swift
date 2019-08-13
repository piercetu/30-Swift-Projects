//
//  FBMeUser.swift
//  FacebookProfileTab
//
//  Created by Pierce Tu on 8/1/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import UIKit

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "mePic", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
