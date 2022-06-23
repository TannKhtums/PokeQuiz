//
//  Onboarding_3.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_3: View {
    @EnvironmentObject var viewModel: SettingsViewModel

    var body: some View {
        ZStack {
                    VStack {
                        Text("First, let's set some settings.")
                            .font(.title)
                            .bold()
                            .padding()
                            Section {
                                Text("Please select a preferred color theme:")
                                    .font(.title2)
                                Picker("Level Style", selection: $viewModel.selectedStyle) {
                                    ForEach(SettingsViewModel.LevelStyle.allCases) { style in
                                        Text(style.rawValue.capitalized)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding([.leading, .trailing])
                            }
                        if viewModel.selectedStyle == .green {
                            PokemonImageViewEasy(selection: "green_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .red {
                            PokemonImageViewEasy(selection: "red_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .blue {
                            PokemonImageViewEasy(selection: "blue_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .yellow {
                            PokemonImageViewEasy(selection: "yellow_egg")
                                .padding()
                        }
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}

struct Onboarding_3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_3().environmentObject(SettingsViewModel())
    }
}
