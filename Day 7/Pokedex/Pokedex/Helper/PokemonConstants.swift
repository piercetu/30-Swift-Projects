//
//  PokemonConstants.swift
//  Pokedex
//
//  Created by Pierce Tu on 3/1/20.
//  Copyright © 2020 Pierce Tu. All rights reserved.
//

import Foundation

let pokemons = [
  Pokemon(name: "Bulbasaur", id: 001,
    detailInfo: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
    type: [PokemonType.grass, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.ice, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
  
  Pokemon(name: "Ivysaur", id: 002,
    detailInfo: "There is a bud on this Pokémon's back. To support its weight, Ivysaur's legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it's a sign that the bud will bloom into a large flower soon.",
    type: [PokemonType.grass, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.ice, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png"),
  
  Pokemon(name: "Venusaur", id: 003,
    detailInfo: "There is a large flower on Venusaur's back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower's aroma soothes the emotions of people.",
    type: [PokemonType.grass, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.ice, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png"),
  
  Pokemon(name: "Charmander", id: 004,
    detailInfo: "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.",
    type: [PokemonType.fire],
    weakness: [PokemonType.ground, PokemonType.rock, PokemonType.water],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png"),
  
  Pokemon(name: "Charmeleon", id: 005,
    detailInfo: "Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.",
    type: [PokemonType.fire],
    weakness: [PokemonType.ground, PokemonType.rock, PokemonType.water],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png"),
  
  Pokemon(name: "Charizard", id: 006,
    detailInfo: "Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.",
    type: [PokemonType.fire, PokemonType.flying],
    weakness: [PokemonType.ground, PokemonType.electric, PokemonType.water],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png"),
  
  Pokemon(name: "Squirtle", id: 007,
    detailInfo: "Squirtle's shell is not merely used for protection. The shell's rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.",
    type: [PokemonType.water],
    weakness: [PokemonType.electric, PokemonType.grass],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png"),

  Pokemon(name: "Wartortle", id: 008,
    detailInfo: "Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon's toughness as a battler.",
    type: [PokemonType.water],
    weakness: [PokemonType.electric, PokemonType.grass],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png"),
  
  Pokemon(name: "Blastoise", id: 009,
    detailInfo: "Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.",
    type: [PokemonType.water],
    weakness: [PokemonType.electric, PokemonType.grass],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png"),
  
  Pokemon(name: "Caterpie", id: 010,
    detailInfo: "Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.",
    type: [PokemonType.bug],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png"),
  
  Pokemon(name: "Metapod", id: 011,
    detailInfo: "The shell covering this Pokémon's body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.",
    type: [PokemonType.bug],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/011.png"),
  
  Pokemon(name: "Butterfree", id: 012,
    detailInfo: "Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.",
    type: [PokemonType.bug, PokemonType.flying],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock, PokemonType.electric, PokemonType.ice],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png"),
  
  Pokemon(name: "Weedle", id: 013,
    detailInfo: "Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).",
    type: [PokemonType.bug, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/013.png"),
  
  Pokemon(name: "Kakuna", id: 014,
    detailInfo: "Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.",
    type: [PokemonType.bug, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png"),
  
  Pokemon(name: "Beedrill", id: 015,
    detailInfo: "Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.",
    type: [PokemonType.bug, PokemonType.poison],
    weakness: [PokemonType.fire, PokemonType.flying, PokemonType.rock, PokemonType.psychic],
    pokemonImgUrl: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/015.png")
]


