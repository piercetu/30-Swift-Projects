//
//  TableKeys.swift
//  FacebookProfileTab
//
//  Created by Pierce Tu on 7/31/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import Foundation

public struct TableKeys {
    static let Section = "section"
    static let Rows = "rows"
    static let ImageName = "imageName"
    static let Title = "title"
    static let SubTitle = "subTitle"
    static let seeMore = "See More..."
    static let addFavorites = "Add Favorites..."
    static let logout = "Log Out"
    
    static func populate(withUser user: FBMeUser) -> [[String: Any]] {
        return [
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: user.avatarName, TableKeys.Title: user.name, TableKeys.SubTitle: "View your profile"]
                ]
            ],
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: Specs.imageName.saved, TableKeys.Title: "Saved"],
                    [TableKeys.ImageName: Specs.imageName.groups, TableKeys.Title: "Groups"],
                    [TableKeys.ImageName: Specs.imageName.friends, TableKeys.Title: "Friends"],
                    [TableKeys.ImageName: Specs.imageName.marketplace, TableKeys.Title: "Marketplace"],
                    [TableKeys.ImageName: Specs.imageName.videosOnWatch, TableKeys.Title: "Videos on Watch"],
                    [TableKeys.ImageName: Specs.imageName.events, TableKeys.Title: "Events"],
                    [TableKeys.ImageName: Specs.imageName.memories, TableKeys.Title: "Memories"],
                    [TableKeys.ImageName: Specs.imageName.pages, TableKeys.Title: "Pages"],
                    [TableKeys.ImageName: Specs.imageName.nearbyFriends, TableKeys.Title: "Nearby Friends"],
                    [TableKeys.ImageName: Specs.imageName.gaming, TableKeys.Title: "Gaming"],
                    [TableKeys.ImageName: Specs.imageName.jobs, TableKeys.Title: "Jobs"],
                    [TableKeys.ImageName: Specs.imageName.saved, TableKeys.Title: "Saved"],
                    [TableKeys.ImageName: Specs.imageName.local, TableKeys.Title: "Local"],
                    [TableKeys.ImageName: Specs.imageName.seeMore, TableKeys.Title: "See More"]
                ]
            ],
            [
                TableKeys.Rows: [
                    [TableKeys.ImageName: Specs.imageName.helpAndSupport, TableKeys.Title: "Help & Support"],
                    [TableKeys.ImageName: Specs.imageName.settingsAndPrivacy, TableKeys.Title: "Settings & Privacy"],
                    [TableKeys.ImageName: Specs.imageName.logOut, TableKeys.Title: "Log Out"]
                ]
                
            ],
            
        ]
    }
}
