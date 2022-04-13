//
//  VeryHardQuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/19/22.
//

import SwiftUI

struct VeryHardQuestionView: View {
    @EnvironmentObject var viewModel: VeryHardViewModel

    
    var body: some View {
        ZStack{
            BackgroundView()
            ScrollView {
                VStack {
                    Spacer()
                    Spacer()
                    Text("What types is this Pokemon resistant to?")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    Spacer()
                    PokemonImageViewMedium(selection: viewModel.pokemon.number)
                        .padding()
                    Spacer()
                    VStack {
                        VeryHardTypesView()
                            .padding()
                            .onTapGesture {
                                print(viewModel.selectedTypes)
                            }
                        Button {
                            print("submit")
                            viewModel.makeGuess(typesArr: viewModel.alphabetizedTypesArr(array: viewModel.selectedTypes))
                            print(viewModel.selectedTypes)
                        } label: {
                            ButtonView(chosenText: "Submit Answer" + " " + viewModel.rightWrongText())
                        }
                        .background(viewModel.color())
                        
                        Text(viewModel.correctAnswerNotification())
                            .multilineTextAlignment(.center)
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
                    Spacer()
                }
            }
        }
    }
}

struct VeryHardQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        VeryHardQuestionView().environmentObject(VeryHardViewModel())
    }
}
