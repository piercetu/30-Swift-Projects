//
//  Pokemon.swift
//  Pokedex
//
//  Created by Pierce Tu on 10/28/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import Foundation

enum PokemonType {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
}

class Pokemon: NSObject {
    let name: String
    let id: Int
    let detailInfo: String
    let type: [PokemonType]
    let weakness: [PokemonType]
    let pokemonImgUrl: String
    
    init(name: String, id: Int, detailInfo: String, type: [PokemonType], weakness: [PokemonType], pokemonImgUrl: String) {
        self.name = name
        self.id = id
        self.detailInfo = detailInfo
        self.type = type
        self.weakness = weakness
        self.pokemonImgUrl = pokemonImgUrl
    }
}
