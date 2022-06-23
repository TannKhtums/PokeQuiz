//
//  Onboarding_4.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_4: View {
    @EnvironmentObject var viewModel: SettingsViewModel

    var body: some View {
        ZStack {
                    VStack {
                        Section {
                            Text("Please select a favorite Pokemon:")
                                .font(.title2)
                                .padding()
                            Picker("Favorite Pokemon", selection: $viewModel.selectedPokemon) {
                                ForEach(viewModel.pokemonArr, id: \.self) {
                                        Text($0.name)
                                    }
                                }
                            .pickerStyle(.menu)
                        }
                        PokemonImageViewEasy(selection: viewModel.selectedPokemon.number)
                            .padding()
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}

struct Onboarding_4_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_4().environmentObject(SettingsViewModel())
    }
}
