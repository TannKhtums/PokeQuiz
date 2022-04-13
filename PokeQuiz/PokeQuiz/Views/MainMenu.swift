//
//  ContentView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 1/22/22.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var viewModel: SettingsViewModel
    @AppStorage("isDarkMode") var isDarkMode = false

//    @StateObject var viewModel = SettingsViewModel()

    @State private var experiencePoints = 0
    @State private var showingSettings = false
    
//
//    enum LevelStyle: String, CaseIterable, Identifiable {
//        case green, red, blue, yellow
//        var id: Self { self }
//    }
//
//    @State private var selectedStyle: LevelStyle = .green
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    LazyVStack {
//                        Picker("Level Style", selection: $selectedStyle) {
//                            ForEach(LevelStyle.allCases) { style in
//                                Text(style.rawValue.capitalized)
//                            }
//                        }
//                        .pickerStyle(.segmented)
//                        .padding([.leading, .trailing])
                        
                        Text("Select a training level below:")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()

                        if viewModel.selectedStyle == .green {
                            NavigationLink(destination: VeryEasyGameView()) {
                                    PokemonImageView(selection: "green_egg")
                                }
                            NavigationLink(destination: EasyGameView()) {
                                    PokemonImageView(selection: "001")
                                }
                            NavigationLink(destination: MediumGameView()) {
                                    PokemonImageView(selection: "002")
                                }
                            NavigationLink(destination: HardGameView()) {
                                PokemonImageView(selection: "003")
                            }
                            NavigationLink(destination: VeryHardGameView()) {
                            PokemonImageView(selection: "003_mega")
                            }
                        }
                        else if viewModel.selectedStyle == .red {
                            NavigationLink(destination: VeryEasyGameView()) {
                                    PokemonImageView(selection: "red_egg")
                                }
                            NavigationLink(destination: EasyGameView()) {
                                    PokemonImageView(selection: "004")
                                }
                            NavigationLink(destination: MediumGameView()) {
                                    PokemonImageView(selection: "005")
                                }
                            NavigationLink(destination: HardGameView()) {
                                PokemonImageView(selection: "006")
                            }
                            NavigationLink(destination: VeryHardGameView()) {
                            PokemonImageView(selection: "006_mega2")
                            }
                        }  else if viewModel.selectedStyle == .blue {
                            NavigationLink(destination: VeryEasyGameView()) {
                                    PokemonImageView(selection: "blue_egg")
                                }
                            NavigationLink(destination: EasyGameView()) {
                                    PokemonImageView(selection: "007")
                                }
                            NavigationLink(destination: MediumGameView()) {
                                    PokemonImageView(selection: "008")
                                }
                            NavigationLink(destination: HardGameView()) {
                                PokemonImageView(selection: "009")
                            }
                            NavigationLink(destination: VeryHardGameView()) {
                            PokemonImageView(selection: "009_mega")
                            }
                        }   else if viewModel.selectedStyle == .yellow {
                            NavigationLink(destination: VeryEasyGameView()) {
                                    PokemonImageView(selection: "yellow_egg")
                                }
                            NavigationLink(destination: EasyGameView()) {
                                    PokemonImageView(selection: "172")
                                }
                            NavigationLink(destination: MediumGameView()) {
                                    PokemonImageView(selection: "025")
                                }
                            NavigationLink(destination: HardGameView()) {
                                PokemonImageView(selection: "026")
                            }
                            NavigationLink(destination: VeryHardGameView()) {
                            PokemonImageView(selection: "145")
                            }
                        }
    
                        Spacer()
                    }
                }
            }
            .navigationTitle("PokeQuiz!")
            .toolbar {
                Button {
                    showingSettings.toggle()
                } label: {
                    GearPokemonView()
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
                    .environmentObject(viewModel)
            }.preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .environmentObject(viewModel)
        .navigationBarHidden(true)
//        .onAppear(perform: {
//            viewModel.settingsShownForFirstTime = false
//        })
    }
}
//    .environmentObject(SettingsViewModel())

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu().environmentObject(SettingsViewModel())
    }
}
