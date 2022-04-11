//
//  SettingsView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/23/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: SettingsViewModel

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Level Style", selection: $viewModel.selectedStyle) {
                        ForEach(SettingsViewModel.LevelStyle.allCases) { style in
                            Text(style.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding([.leading, .trailing])
                }
                Picker("Favorite Pokemon", selection: $viewModel.selectedPokemon) {
                    ForEach(viewModel.pokemonArr, id: \.self) {
                            Text($0.name)
                        }
                    }
                HStack {
                    Spacer()
                    PokemonImageView(selection: viewModel.selectedPokemon.number)
                    Spacer()
                }
            }.navigationBarTitle("Settings")
            
//                .toolbar {
//                    if viewModel.settingsShownForFirstTime == true {
//                        Text("Next >")
//                    } else {
//                        Button("Save") {
//                            print(viewModel.selectedStyle)
//                            dismiss()
//                        }
//                    }
//                }
        }
//        .onAppear(perform: {
//            UserDefaults.standard.welcomeScreenShown = true
//        })

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsViewModel())
    }
}


//VStack {
//    Picker(selection: $selectedPokemon, label: Text("Favorite Pokemon")) {
//        ForEach(0..<pokemonArr.count) {
//            Text((self.pokemonArr[$0]))
//        }
//    }.pickerStyle(WheelPickerStyle())
//}
