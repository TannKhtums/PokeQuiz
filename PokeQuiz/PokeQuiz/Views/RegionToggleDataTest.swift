//
//  RegionToggleDataTest.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/2/22.
//

import SwiftUI


struct RegionSettingsTest: View {
    @State private var kanto = false
    @State private var johto = false
    @State private var hoenn = false
    
    @State var pokemonArr: [Pokemon] = [
        Pokemon(name: "Bulbasaur", number: "001", type: ["Grass", "Poison"], region: "Kanto"),
        Pokemon(name: "Charmander", number: "004", type: ["Fire"], region: "Kanto"),
        Pokemon(name: "Squirtle", number: "007", type: ["Water"], region: "Kanto"),
        Pokemon(name: "Chikorita", number: "001", type: ["Grass", "Poison"], region: "Johto"),
        Pokemon(name: "Cindiquil", number: "004", type: ["Fire"], region: "Johto"),
        Pokemon(name: "Totodile", number: "007", type: ["Water"], region: "Johto"),
        Pokemon(name: "Treecko", number: "001", type: ["Grass", "Poison"], region: "Hoenn"),
        Pokemon(name: "Torchic", number: "004", type: ["Fire"], region: "Hoenn"),
        Pokemon(name: "Mudkip", number: "007", type: ["Water"], region: "Hoenn"),
    ]
    
    @State var selectedRegionArr: [String] = []
    @State var selectedPokemonArr: [Pokemon] = []
    
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
    
    var body: some View {
        VStack {
            ForEach(selectedPokemonArr, id: \.self) { pokemon in
                Text(pokemon.name)
            }
            HStack {
                Spacer()
                Toggle("Kanto", isOn: $kanto)
                    .onChange(of: kanto) { value in
                        unselectOrAddRegion(type: "Kanto")
                        print(value)
                        print(selectedRegionArr)
                    }
                Spacer()
            }.padding()
            HStack {
                Spacer()
                Toggle("Johto", isOn: $johto)
                    .onChange(of: johto) { value in
                        unselectOrAddRegion(type: "Johto")
                        print(value)
                        print(selectedRegionArr)
                    }
                Spacer()
            }.padding()
            HStack {
                Spacer()
                Toggle("Hoenn", isOn: $hoenn)
                    .onChange(of: hoenn) { value in
                        unselectOrAddRegion(type: "Hoenn")
                        print(value)
                        print(selectedRegionArr)
                    }
                Spacer()
            }.padding()
            Button("Print Selected Region Array") {
                createPokemonArrRegionSelection(chosenArr: selectedRegionArr, pokemonArr: pokemonArr)
                print(selectedRegionArr)
                print(selectedPokemonArr)
            }
            Button("Reset Pokemon Arr") {
                selectedPokemonArr = []
            }
        }
    }
}

struct RegionSettingsTest_Previews: PreviewProvider {
    static var previews: some View {
        RegionSettingsTest()
    }
}

//import Foundation
//
//enum Region: String {
//    case kanto = "Kanto"
//    case johto = "Johto"
//    case hoenn = "Hoenn"
//
//    func generation() -> Int {
//        switch self {
//        case .kanto: return 1
//        case .johto: return 2
//        }
//    }
//}
//
//class SomeClass {
//
//    let type = "fire"
//
//    func someFunction() {
//        print("here is a type: \(Region.kanto.rawValue)")
//
//        Region.kanto.generation()
//    }
//
//

//
//
//
//}

//struct PokemonRegion: Hashable {
//    enum Region: String {
//        case kanto = "Kanto"
//        case johto = "Johto"
//        case hoenn = "Hoenn"
//    }
//
//    var name: String
//    var region: Region
//}
//
//struct RegionToggleDataTest: View {
//    @State private var kanto = true
//    @State private var johto = true
//    @State private var hoenn = true
//
//    @State var pokemonArr: [PokemonRegion] = [
//        PokemonRegion(name: "Charmander", region: .kanto),
//        PokemonRegion(name: "Cyndiquil", region: .johto),
//        PokemonRegion(name: "Torchic", region: .hoenn)
//    ]
//
//    var regionOnDictionary = [
//        PokemonRegion.Region.kanto: false,
//        PokemonRegion.Region.johto: false,
//        PokemonRegion.Region.hoenn: false,
//    ]
//
//    mutating func setRegionOn(region: PokemonRegion.Region, on: Bool) {
//        regionOnDictionary[region] = true
//    }
//
//    @State var selectedRegionArr: [PokemonRegion] = [
//        PokemonRegion(name: "Charmander", region: .kanto),
//        PokemonRegion(name: "Cyndiquil", region: .johto),
//        PokemonRegion(name: "Torchic", region: .hoenn)
//    ]
//
//    var body: some View {
//        VStack {
//            ForEach(pokemonArr, id: \.self) { pokemon in
//                Text(pokemon.name)
//            }
//            HStack {
//                Spacer()
//                Toggle("Kanto", isOn: $kanto)
//                    .onChange(of: kanto) { value in
//                        setRegionOn(region: .kanto, on: true)
//                        print(value)
//                    }
//                Spacer()
//            }.padding()
//
//            Toggle("Johto", isOn: $johto)
//            Toggle("Hoenn", isOn: $hoenn)
//        }
//    }
//}
