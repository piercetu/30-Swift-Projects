//
//  Specs.swift
//  FacebookProfileTab
//
//  Created by Pierce Tu on 7/31/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import UIKit

public struct Specs {
    public struct Color {
        public let tint = UIColor(hex: 0x3b5998)
        public let red = UIColor.red
        public let white = UIColor.white
        public let black = UIColor.black
        public let gray = UIColor.lightGray
    }
    
    public struct FontSize {
        public let tiny: CGFloat = 10
        public let small: CGFloat = 12
        public let regular: CGFloat = 14
        public let large: CGFloat = 16
    }
    
    public struct Font {
        private static let regularName = "Helvetica Neue"
        private static let boldName = "Helvetica Neue Bold"
        public let tiny = UIFont(name: regularName, size: Specs.fontSize.tiny)
        public let small = UIFont(name: regularName, size: Specs.fontSize.small)
        public let regular = UIFont(name: regularName, size: Specs.fontSize.regular)
        public let large = UIFont(name: regularName, size: Specs.fontSize.large)
        public let smallBold = UIFont(name: boldName, size: Specs.fontSize.small)
        public let regularBold = UIFont(name: boldName, size: Specs.fontSize.regular)
        public let largeBold = UIFont(name: boldName, size: Specs.fontSize.large)
    }
    
    public struct ImageName {
        public let groups = "fb_groups"
        public let oculus = "fb_oculus"
        public let friends = "fb_friends"
        public let marketplace = "fb_marketplace"
        public let videosOnWatch = "fb_videosOnWatch"
        public let events = "fb_events"
        public let memories = "fb_memories"
        public let saved = "fb_saved"
        public let pages = "fb_pages"
        public let nearbyFriends = "fb_nearbyFriends"
        public let gaming = "fb_gaming"
        public let jobs = "fb_jobs"
        public let local = "fb_local"
//        public let seeMore = "fb_seeMore"
        public let helpAndSupport = "fb_helpAndSupport"
        public let settingsAndPrivacy = "fb_settingsAndPrivacy"
        public let logOut = "fb_logOut"
        public let placeholder = "fb_placeholder"
    }
    
    public static var color: Color {
        return Color()
    }
    
    public static var fontSize: FontSize {
        return FontSize()
    }
    
    public static var font: Font {
        return Font()
    }
    
    public static var imageName: ImageName {
        return ImageName()
    }
}
