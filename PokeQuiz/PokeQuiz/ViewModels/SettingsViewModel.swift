//
//  SettingsViewModel.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/23/22.
//

import Combine
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @AppStorage("isDarkMode") var isDarkMode = false
    
    @AppStorage("kanto") var kanto = false
    @AppStorage("johto") var johto = false
    @AppStorage("hoenn") var hoenn = false
    @AppStorage("sinnoh") var sinnoh = false
    @AppStorage("unova") var unova = false
    @AppStorage("kalos") var kalos = false
    @AppStorage("alola") var alola   = false
    @AppStorage("galar") var galar = false
    
    @Published var selectedRegionArr: [String] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(selectedRegionArr) {
                UserDefaults.standard.set(encoded, forKey: "selectedRegionArr")
            }
        }
    }
    
    @Published var selectedPokemonArr: [Pokemon] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(selectedPokemonArr) {
                UserDefaults.standard.set(encoded, forKey: "selectedPokemonArr")
            }
        }
    }
    
    func switchLightDark() {
        isDarkMode = !isDarkMode
    }
    
    
    func unselectOrAddRegion(type: String) {
        if let index = selectedRegionArr.firstIndex(of: type) {
            selectedRegionArr.remove(at: index)
            } else {
                selectedRegionArr.append(type)
        }
    }
    
    func createPokemonArrRegionSelection(chosenArr: [String], pokemonArr: [Pokemon]) {
        selectedPokemonArr = []
        for region in chosenArr {
            for pokemon in pokemonArr {
                if pokemon.region == region {
                    selectedPokemonArr.append(pokemon)
                }
            }
        }
    }
    
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
            if let savedSelectedPokemonArr = UserDefaults.standard.data(forKey: "selectedPokemonArr") {
                if let loadedSelectedPokemonArr = try? JSONDecoder().decode([Pokemon].self, from: savedSelectedPokemonArr) {
                    self.selectedPokemonArr = loadedSelectedPokemonArr
                }
            }
            if let savedSelectedRegionArr = UserDefaults.standard.data(forKey: "selectedRegionArr") {
                if let loadedSelectedRegionArr = try? JSONDecoder().decode([String].self, from: savedSelectedRegionArr) {
                    self.selectedRegionArr = loadedSelectedRegionArr
                }
            }
        }
    }
    
    
    
        


