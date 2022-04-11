//
//  SettingsViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/23/22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    
    enum LevelStyle: String, CaseIterable, Identifiable {
        case green = "Green"
        case red = "Red"
        case blue = "Blue"
        case yellow = "Yellow"
        var id: Self { self }
    }
    
    @Published var pokemonArr = Pokemon.allPokemon
    
//    @Published var settingsShownForFirstTime = true
    
    @Published var selectedStyle: LevelStyle = LevelStyle.red {
        //Property observers are pieces of code that run when properties change: didSet runs when the property just changed
        didSet {
            UserDefaults.standard.setValue(selectedStyle.rawValue, forKey: "selectedStyle")
        }
    }
    
    @Published var selectedPokemon: Pokemon = Pokemon(name: "Bulbasaur", number: "001", type: ["Grass", "Poison"], region: "Kanto") {
        didSet {
            if let encoded = try? JSONEncoder().encode(selectedPokemon) {
                UserDefaults.standard.set(encoded, forKey: "selectedPokemon")
            }
        }
    }
    
 

        init() {
            if let selectedStyleValue = UserDefaults.standard.string(forKey: "selectedStyle") {
                self.selectedStyle = LevelStyle(rawValue: selectedStyleValue) ?? .green
            }
            
            if let savedSelectedPokemon = UserDefaults.standard.data(forKey: "selectedPokemon") {
                if let loadedSelectedPokemon = try? JSONDecoder().decode(Pokemon.self, from: savedSelectedPokemon) {
                    self.selectedPokemon = loadedSelectedPokemon
                }
            }
        }
    }
    
    
    
        


