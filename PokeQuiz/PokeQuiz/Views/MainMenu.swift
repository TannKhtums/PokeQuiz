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
    @State var noRegionsSelected = false
    @State var veryEasyGame = false
    @State var easyGame = false
    @State var mediumGame = false
    @State var hardGame = false
    @State var veryHardGame = false

    func dismissAlert() {
        noRegionsSelected = false
    }
    
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
                        
                        Text("Select a training level below:")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                        
//                        Button("test") {
//                            print(viewModel.selectedPokemonArr.count)
//                        }
                        
                        if viewModel.selectedPokemonArr.count > 0 {
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
                        }
                        
                        if viewModel.selectedPokemonArr.count == 0 {
                            if viewModel.selectedStyle == .green {
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "green_egg")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "001")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "002")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "003")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "003_mega")
                                })
                            }
                            else if viewModel.selectedStyle == .red {
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "red_egg")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "004")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "005")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "006")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "006_mega2")
                                })
                            }  else if viewModel.selectedStyle == .blue {
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "blue_egg")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "007")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "008")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "009")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "009_mega")
                                })
                            }   else if viewModel.selectedStyle == .yellow {
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "yellow_egg")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "172")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "025")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "026")
                                })
                                Button(action: {
                                    noRegionsSelected = true
                                }, label: {
                                    PokemonImageView(selection: "145")
                                })
                            }
                        }

                        

    
                        Spacer()
                    }
                }
            }
//            .navigationBarHidden(true)
//            .toolbar {
//                Button {
//                    showingSettings.toggle()
//                } label: {
//                    GearPokemonView()
//                }
//            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
                    .environmentObject(viewModel)
            }.preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationTitle("PokeQuiz!")
            
        }
        .onAppear {
            if viewModel.selectedPokemonArr.count == 0 {
                print("true")
            }
        }
        .alert("You can't take a quiz with no questions. Please select at least one region under settings.", isPresented: $noRegionsSelected) { Button("Okee dokee!", action: dismissAlert)}
        
        .navigationBarHidden(true)
        .environmentObject(viewModel)
    }

}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu().environmentObject(SettingsViewModel())
    }
}
