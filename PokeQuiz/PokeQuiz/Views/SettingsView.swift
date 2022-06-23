//
//  SettingsView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/23/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: SettingsViewModel
    @AppStorage("isDarkMode") var isDarkMode = false
    @Environment(\.dismiss) var dismiss
    
    @State var settingsSaved = true
    
    let darkModeButtonColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)
    let lightModeButtonColor = Color(hue: 30/360, saturation: 0.3, brightness: 1)

    var body: some View {
        NavigationView {
            Form {
                Section {
                        HStack {
                            Spacer()

                            Button(action: {
                                viewModel.switchLightDark()
                            }, label: {
                                HStack {
                                    Text(isDarkMode ? "Light Mode" : "Dark Mode")
                                        .foregroundColor(isDarkMode ? Color.black : Color.white)
                                    if isDarkMode {
                                        SolRockImageView()
                                    } else {
                                        LunatoneImageView()
                                    }
                                }
                                    .padding()
                                    .frame(width: 220, height: 70)
                                    .background(isDarkMode ? lightModeButtonColor : Color(white: 0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            })

                            Spacer()
                        }.padding()

                }
            
                Section {
                    VStack {
                        Text("Color Theme")
                        Picker("Level Style", selection: $viewModel.selectedStyle) {
                            ForEach(SettingsViewModel.LevelStyle.allCases) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding([.leading, .trailing])
                        
                        if viewModel.selectedStyle == .green {
                            PokemonImageView(selection: "green_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .red {
                            PokemonImageView(selection: "red_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .blue {
                            PokemonImageView(selection: "blue_egg")
                                .padding()
                        } else if viewModel.selectedStyle == .yellow {
                            PokemonImageView(selection: "yellow_egg")
                                .padding()
                        }
                    }
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
                
                Section {
                   VStack {
                       Text("Regions")
                       
                       Group {
                           HStack {
                               Spacer()
                               Toggle("Kanto (Gen 1)", isOn: $viewModel.kanto)
                                   .onChange(of: viewModel.kanto) { value in
                                       viewModel.unselectOrAddRegion(type: "Kanto")
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Johto (Gen 2)", isOn: $viewModel.johto)
                                   .onChange(of: viewModel.johto) { value in
                                       viewModel.unselectOrAddRegion(type: "Johto")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Hoenn (Gen 3)", isOn: $viewModel.hoenn)
                                   .onChange(of: viewModel.hoenn) { value in
                                       viewModel.unselectOrAddRegion(type: "Hoenn")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Sinnoh(Gen 4)", isOn: $viewModel.sinnoh)
                                   .onChange(of: viewModel.sinnoh) { value in
                                       viewModel.unselectOrAddRegion(type: "Sinnoh")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Unova(Gen 5)", isOn: $viewModel.unova)
                                   .onChange(of: viewModel.unova) { value in
                                       viewModel.unselectOrAddRegion(type: "Unova")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Kalos (Gen 6)", isOn: $viewModel.kalos)
                                   .onChange(of: viewModel.kalos) { value in
                                       viewModel.unselectOrAddRegion(type: "Kalos")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                           HStack {
                               Spacer()
                               Toggle("Alola (Gen 7)", isOn: $viewModel.alola)
                                   .onChange(of: viewModel.alola) { value in
                                       viewModel.unselectOrAddRegion(type: "Alola")
                                       print(value)
                                       settingsSaved = false
                                   }
                               Spacer()
                           }.padding()
                          HStack {
                              Spacer()
                              Toggle("Galar (Gen 8)", isOn: $viewModel.galar)
                                  .onChange(of: viewModel.galar) { value in
                                      viewModel.unselectOrAddRegion(type: "Galar")
                                      print(value)
                                      settingsSaved = false
                                  }
                              Spacer()
                          }.padding()
                          HStack {
                              Spacer()
                              Toggle("Hisui (Gen 8)", isOn: $viewModel.hisui)
                                  .onChange(of: viewModel.hisui) { value in
                                      viewModel.unselectOrAddRegion(type: "Hisui")
                                      print(value)
                                      settingsSaved = false
                                  }
                              Spacer()
                          }.padding()
                       }
                       
                       Button(action: {
                           settingsSaved = true
                           viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                           print(viewModel.selectedPokemonArr)
                       }, label: {
                           Text(settingsSaved ? "Regions Saved" : "Save Regions")
                               .bold()
                               .foregroundColor(Color.white)
                               .frame(width: 200, height: 50)
                               .background(settingsSaved ? Color.green : Color.blue)
                               .cornerRadius(6)
                               .padding()
                       })

                    }
                }
            }.navigationBarTitle("Settings")
//                .navigationBarHidden(true)
        }
        .environmentObject(viewModel)
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationBarHidden(true).navigationBarTitle("")
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
