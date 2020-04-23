//
//  PersistencyManager.swift
//  Pokedex
//
//  Created by Pierce Tu on 3/1/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    func saveImage(_ image: UIImage, filename: String) {
        let path = NSHomeDirectory() + "/Documents/\(filename)"
        let data = image.pngData()
        try? data!.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    func getImage(_ filename: String) -> UIImage? {
        let path = NSHomeDirectory() + "/Documents/\(filename)"
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .uncachedRead)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
}
