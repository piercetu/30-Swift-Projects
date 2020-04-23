//
//  LibraryAPI.swift
//  Pokedex
//
//  Created by Pierce Tu on 2/28/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    static let sharedInstance = LibraryAPI()
    let persistencyManager = PersistencyManager()
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector:#selector(LibraryAPI.downloadImage(_:)), name: NSNotification.Name(rawValue: downloadImageNotification), object: nil)
    }
    
    func getPokemons() -> [Pokemon] {
        return pokemons
    }
    
    func downloadImg(_ url: String) -> (UIImage) {
        let aUrl = URL(string: url)
        let data = try? Data(contentsOf: aUrl!)
       let image = UIImage(data: data!)
       return image!
    }
    
    @objc func downloadImage(_ notification: Notification) {
        // retrieve info from notification
        let userInfo = (notification as NSNotification).userInfo as! [String: AnyObject]
        let pokemonImageView = userInfo["pokemonImageView"] as! UIImageView?
        let pokemonImageUrl = userInfo["pokemonImageUrl"] as! String
        
        if let imageViewUnwrapped = pokemonImageView {
            imageViewUnwrapped.image = persistencyManager.getImage(URL(string: pokemonImageUrl)!.lastPathComponent)
            if imageViewUnwrapped.image == nil {
                DispatchQueue.global().async {
                    let downloadedImage = self.downloadImg(pokemonImageUrl as String)
                    DispatchQueue.main.async {
                        imageViewUnwrapped.image = downloadedImage
                        self.persistencyManager.saveImage(downloadedImage, filename: URL(string: pokemonImageUrl)!.lastPathComponent)
                    }
                }
            }
        }
    }
}
