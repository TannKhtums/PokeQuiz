//
//  Level4QuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 3/9/22.
//

import SwiftUI

struct HardQuestionView: View {

    @EnvironmentObject var viewModel: HardViewModel

    
    var body: some View {
        ZStack{
            BackgroundView()
            ScrollView {
                VStack {
                    Spacer()
                    Spacer()
                    Text("What are this Pokemon's weaknesses?")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    Spacer()
                    PokemonImageViewMedium(selection: viewModel.pokemon.number)
                        .padding()
                    Spacer()
                    VStack {
                        HardTypesView()
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


struct HardQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        HardQuestionView().environmentObject(HardViewModel())
        //        YourView().environmentObject(yourEnvironmentObject)
    }
}
