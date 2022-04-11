//
//  WelcomeSettingsView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/28/22.
//

//import SwiftUI
//
//struct WelcomeSettingsView: View {
//    @EnvironmentObject var viewModel: SettingsViewModel
//
//    var body: some View {
//            Form {
//                Section {
//                    Picker("Level Style", selection: $viewModel.selectedStyle) {
//                        ForEach(SettingsViewModel.LevelStyle.allCases) { style in
//                            Text(style.rawValue.capitalized)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                    .padding([.leading, .trailing])
//                }
//                Picker("Favorite Pokemon", selection: $viewModel.selectedPokemon) {
//                    ForEach(viewModel.pokemonArr, id: \.self) {
//                            Text($0.name)
//                        }
//                    }
//                HStack {
//                    Spacer()
//                    PokemonImageView(selection: viewModel.selectedPokemon.number)
//                    Spacer()
//                }
//            }
//    }
//}
//
//struct WelcomeSettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeSettingsView().environmentObject(SettingsViewModel())
//    }
//}
