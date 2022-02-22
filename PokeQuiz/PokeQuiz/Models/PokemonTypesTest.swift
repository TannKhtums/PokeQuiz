//
//  PokemonTypesTest.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import Foundation

struct PokemonTypes: Hashable {
    // must be hashable in order to be a key in a dictionary

    let name: String
    let number: String
    let type: [String]
    
    static var allPokemon = [
        
        PokemonTypes(name: "Bulbasaur", number: "001", type: ["Grass"]),
        PokemonTypes(name: "Ivysaur", number: "002", type: ["Grass"]),
        PokemonTypes(name: "Venusaur", number: "003", type: ["Grass"]),
        PokemonTypes(name: "Charmander", number: "004", type: ["Fire"]),
        PokemonTypes(name: "Charmeleon", number: "005", type: ["Fire"]),
        PokemonTypes(name: "Charizard", number: "006", type: ["Fire", "Flying"]),
        PokemonTypes(name: "Squirtle", number: "007", type: ["Water"]),
        PokemonTypes(name: "Wartortle", number: "008", type: ["Water"]),
        PokemonTypes(name: "Blastoise", number: "009", type: ["Water"]),
        PokemonTypes(name: "Caterpie", number: "010", type: ["Bug"]),
        PokemonTypes(name: "Metapod", number: "011", type: ["Bug"]),
        PokemonTypes(name: "Butterfree", number: "012", type: ["Bug", "Flying"])
        ]
}
