//
//  Onboarding_5.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_5: View {
    
    @State var noRegionsSelected = false

    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @EnvironmentObject var viewModel: SettingsViewModel

    var body: some View {
        ScrollView {
            ZStack {
                        VStack {
                            Section {
                               VStack {
                                   Text("Regions to be included in quizzes:")
                                       .fixedSize(horizontal: false, vertical: true)
                                       .font(.title2)
                                       .padding()
                                   Group {
                                       HStack {
                                           Spacer()
                                           Toggle("Kanto (Gen 1)", isOn: $viewModel.kanto)
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
                                           Toggle("Johto (Gen 2)", isOn: $viewModel.johto)
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
                                           Toggle("Hoenn (Gen 3)", isOn: $viewModel.hoenn)
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
                                           Toggle("Sinnoh (Gen 4)", isOn: $viewModel.sinnoh)
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
                                           Toggle("Unova (Gen 5)", isOn: $viewModel.unova)
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
                                           Toggle("Kalos (Gen 6)", isOn: $viewModel.kalos)
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
                                           Toggle("Alola (Gen 7)", isOn: $viewModel.alola)
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
                                      HStack {
                                          Spacer()
                                          Toggle("Galar (Gen 8)", isOn: $viewModel.galar)
                                              .onChange(of: viewModel.galar) { value in
                                                  viewModel.unselectOrAddRegion(type: "Galar")
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
                                          Toggle("Hisui (Gen 8)", isOn: $viewModel.hisui)
                                              .onChange(of: viewModel.hisui) { value in
                                                  viewModel.unselectOrAddRegion(type: "Hisui")
                                                  print(value)
                                                  print(viewModel.selectedRegionArr)
                                                  print(viewModel.selectedPokemonArr)
                                                  viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                                  print(viewModel.selectedPokemonArr)
                                              }
                                          Spacer()
                                      }.padding()
                                   }
                                    
                                   Button(action: {
                                       if viewModel.selectedPokemonArr.count < 1 {
                                           noRegionsSelected = true
                                       } else {
                                           shouldShowOnboarding.toggle()
                                       }
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
        }

        .alert("You can't take a quiz with no questions. Please select at least one region.", isPresented: $noRegionsSelected)
       { Button("Okee dokee!", action: dismissAlert)}
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
    
    func dismissAlert() {
        noRegionsSelected = false
    }

}

struct Onboarding_5_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_5().environmentObject(SettingsViewModel())
    }
}
