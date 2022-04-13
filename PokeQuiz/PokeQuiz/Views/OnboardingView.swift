//
//  OnboardingView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/4/22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    @EnvironmentObject var viewModel: SettingsViewModel
    
    var body: some View {
        TabView {
            PageView(
                title: "Bulbasaur",
                text: "Test",
                image: "001",
                showDismissButton: false,
                shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(
                title: "Bulbasaur",
                text: "Test",
                image: "002",
                showDismissButton: true,
                shouldShowOnboarding: $shouldShowOnboarding
            )
            WelcomeSettingsView(
                shouldShowOnboarding: $shouldShowOnboarding
            ).environmentObject(viewModel)

        }
        .tabViewStyle(PageTabViewStyle())
        //allows you to swipe between tab pages
    }
}

struct PageView: View {
    let title: String
    let text: String
    let image: String
    let showDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack {
            PokemonImageView(selection: image)
                .padding()
            Text(title)
                .font(.system(size: 32))
                .padding()
            Text(text)
                .font(.system(size: 32))
                .padding()
            
            if showDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Done")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                })
            }
        }
    }
}


struct WelcomeSettingsView: View {
    @EnvironmentObject var viewModel: SettingsViewModel
    @Binding var shouldShowOnboarding: Bool

    var body: some View {
        VStack {
            Form {
                Section {
                    Text("What's your preferred color?")
                    Picker("Level Style", selection: $viewModel.selectedStyle) {
                        ForEach(SettingsViewModel.LevelStyle.allCases) { style in
                            Text(style.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding([.leading, .trailing])
                }
                HStack {
                    Text("Who's your favorite Pokemon?")
                    Spacer()
                    Picker("Favorite Pokemon", selection: $viewModel.selectedPokemon) {
                        ForEach(viewModel.pokemonArr, id: \.self) {
                                Text($0.name)
                            }
                        }
                    .pickerStyle(.menu)
                }
                HStack {
                    Spacer()
                    PokemonImageView(selection: viewModel.selectedPokemon.number)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        shouldShowOnboarding.toggle()
                    }, label: {
                        Text("Done")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .cornerRadius(6)
                            .padding()

                    })
                    Spacer()
                }

            }

        }
 

    }
}

