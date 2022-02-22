//
//  MediumQuestionView.swift
//  PokeQuiz
//
//  Created by Tanner Garlick on 2/16/22.
//

import SwiftUI

struct MediumQuestionView: View {

    @EnvironmentObject var viewModel: MediumGameViewModel

    
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
                            viewModel.makeGuess(typesArr: ["test"])
                        } label: {
                            ButtonView(chosenText: "Submit Answer")
                        }
                        
                        if viewModel.guessWasMade {
                            Button(action: { viewModel.displayNextScreen()
                                viewModel.assignNextQuestion()
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

struct MediumQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        MediumQuestionView().environmentObject(MediumGameViewModel())
//        YourView().environmentObject(yourEnvironmentObject)
    }
}
