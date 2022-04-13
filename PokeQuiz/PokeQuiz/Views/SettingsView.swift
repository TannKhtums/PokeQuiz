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
    
    let darkModeButtonColor = Color(hue: 225/360, saturation: 0.1, brightness: 1)
    let lightModeButtonColor = Color(hue: 30/360, saturation: 0.3, brightness: 1)

    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        Text("Color Scheme")
                        Picker("Level Style", selection: $viewModel.selectedStyle) {
                            ForEach(SettingsViewModel.LevelStyle.allCases) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding([.leading, .trailing])
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
                       Text("Regions")
                        HStack {
                            Spacer()
                            Toggle("Kanto", isOn: $viewModel.kanto)
                                .onChange(of: viewModel.kanto) { value in
                                    viewModel.unselectOrAddRegion(type: "Kanto")
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Johto", isOn: $viewModel.johto)
                                .onChange(of: viewModel.johto) { value in
                                    viewModel.unselectOrAddRegion(type: "Johto")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Hoenn", isOn: $viewModel.hoenn)
                                .onChange(of: viewModel.hoenn) { value in
                                    viewModel.unselectOrAddRegion(type: "Hoenn")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Sinnoh", isOn: $viewModel.sinnoh)
                                .onChange(of: viewModel.sinnoh) { value in
                                    viewModel.unselectOrAddRegion(type: "Sinnoh")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Unova", isOn: $viewModel.unova)
                                .onChange(of: viewModel.unova) { value in
                                    viewModel.unselectOrAddRegion(type: "Unova")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Kalos", isOn: $viewModel.kalos)
                                .onChange(of: viewModel.kalos) { value in
                                    viewModel.unselectOrAddRegion(type: "Kalos")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                        HStack {
                            Spacer()
                            Toggle("Alola", isOn: $viewModel.alola)
                                .onChange(of: viewModel.alola) { value in
                                    viewModel.unselectOrAddRegion(type: "Alola")
                                    print(value)
                                    print(viewModel.selectedRegionArr)
                                    print(viewModel.selectedPokemonArr)
                                    viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                    print(viewModel.selectedPokemonArr)
                                }
                            Spacer()
                        }.padding()
                    }
                }
            }.navigationBarTitle("Settings")
                .toolbar {
                    Button("Done") {
                        dismiss()
                    }
                }
        }.preferredColorScheme(isDarkMode ? .dark : .light)

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
