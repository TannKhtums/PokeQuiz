//
//  MediumQuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import SwiftUI

struct MediumQuestionView: View {

    @EnvironmentObject var viewModel: MediumGameViewModel

    @AppStorage("isDarkMode") var isDarkMode = false
        
    var body: some View {
        ZStack{
            BackgroundView()
            ScrollView {
                VStack {
                    Spacer()
                    Spacer()
                    Text("Select the correct type(s):")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isDarkMode ? darkBackgrounColor.darkBackground : Color.red)
                    Spacer()
                    PokemonImageViewMedium(selection: viewModel.pokemon.number)
                        .padding()
                    Spacer()
                    VStack {
                        TypesView()
                            .padding()
                            .onTapGesture {
                                print(viewModel.selectedTypes)
                            }
                        Button {
                            print("submit")
                            viewModel.makeGuess(typesArr: viewModel.alphabetizedTypesArr(array: viewModel.selectedTypes))
                            print(viewModel.selectedTypes)
                            print("Weakness Array: \(viewModel.pokemon.weaknesses), Super Weakness: \(viewModel.pokemon.superWeaknesses), Resistance: \(viewModel.pokemon.resistance), Super Resistance: \(viewModel.pokemon.superResistance)")
                        } label: {
                            ButtonView(chosenText: "Submit Answer" + " " + viewModel.rightWrongText())
                        }
                        .background(viewModel.color())
                        
                        Text(viewModel.correctAnswerNotification())
                            .padding()
                        
                        if viewModel.guessWasMade {
                            Button(action: {
                                viewModel.displayNextScreen()
                                viewModel.assignNextQuestion()
                                viewModel.selectedTypes = []
                                print(viewModel.pokemon)
                            }) {
                                BottomTextView(str: "Next")
                            }
                        }
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct MediumQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MediumQuestionView().environmentObject(MediumGameViewModel())
//        YourView().environmentObject(yourEnvironmentObject)
    }
}
