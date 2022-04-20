//
//  Onboarding_5.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_5: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @EnvironmentObject var viewModel: SettingsViewModel

    var body: some View {
        ZStack {
                    VStack {
                        Section {
                           VStack {
                               Text("Regions to be included in quizzes:")
                                   .font(.title2)
                                   .padding()
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
                            }
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

struct Onboarding_5_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_5().environmentObject(SettingsViewModel())
    }
}
