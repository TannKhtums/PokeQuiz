//
//  Onboarding_5.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 4/16/22.
//

import SwiftUI

struct Onboarding_5: View {
    
    @State var regionSelected = false
    @State var noRegionSelectedAlert = false


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
                                                   regionSelected.toggle()
                                                   print("Kanto", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Johto (Gen 2)", isOn: $viewModel.johto)
                                               .onChange(of: viewModel.johto) { value in
                                                   viewModel.unselectOrAddRegion(type: "Johto")
                                                   regionSelected.toggle()
                                                   print("Johto", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Hoenn (Gen 3)", isOn: $viewModel.hoenn)
                                               .onChange(of: viewModel.hoenn) { value in
                                                   viewModel.unselectOrAddRegion(type: "Hoenn")
                                                   regionSelected.toggle()
                                                   print("Hoenn", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Sinnoh (Gen 4)", isOn: $viewModel.sinnoh)
                                               .onChange(of: viewModel.sinnoh) { value in
                                                   viewModel.unselectOrAddRegion(type: "Sinnoh")
                                                   regionSelected.toggle()
                                                   print("Sinnoh", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Unova (Gen 5)", isOn: $viewModel.unova)
                                               .onChange(of: viewModel.unova) { value in
                                                   viewModel.unselectOrAddRegion(type: "Unova")
                                                   regionSelected.toggle()
                                                   print("Unova", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Kalos (Gen 6)", isOn: $viewModel.kalos)
                                               .onChange(of: viewModel.kalos) { value in
                                                   viewModel.unselectOrAddRegion(type: "Kalos")
                                                   regionSelected.toggle()
                                                   print("Kalos", value)
                                               }
                                           Spacer()
                                       }.padding()
                                       HStack {
                                           Spacer()
                                           Toggle("Alola (Gen 7)", isOn: $viewModel.alola)
                                               .onChange(of: viewModel.alola) { value in
                                                   viewModel.unselectOrAddRegion(type: "Alola")
                                                   regionSelected.toggle()
                                                   print("Alola", value)
                                               }
                                           Spacer()
                                       }.padding()
                                      HStack {
                                          Spacer()
                                          Toggle("Galar (Gen 8)", isOn: $viewModel.galar)
                                              .onChange(of: viewModel.galar) { value in
                                                  viewModel.unselectOrAddRegion(type: "Galar")
                                                  regionSelected.toggle()
                                                  print("Galar", value)
                                              }
                                          Spacer()
                                      }.padding()
                                      HStack {
                                          Spacer()
                                          Toggle("Hisui (Gen 8)", isOn: $viewModel.hisui)
                                              .onChange(of: viewModel.hisui) { value in
                                                  viewModel.unselectOrAddRegion(type: "Hisui")
                                                  regionSelected.toggle()
                                                  print("Hisui", value)
                                              }
                                          Spacer()
                                      }.padding()
                                   }
                                    
                                   Button(action: {
                                       if regionSelected == false {
                                           noRegionSelectedAlert = true
                                       } else {
                                           shouldShowOnboarding.toggle()
                                           viewModel.createPokemonArrRegionSelection(chosenArr: viewModel.selectedRegionArr, pokemonArr: viewModel.pokemonArr)
                                           print(viewModel.selectedPokemonArr)
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

        .alert("You can't take a quiz with no questions. Please select at least one region.", isPresented: $noRegionSelectedAlert)
       { Button("Okee dokee!", action: dismissAlert)}
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
    
    func dismissAlert() {
        noRegionSelectedAlert = false
    }

}

struct Onboarding_5_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding_5().environmentObject(SettingsViewModel())
    }
}
